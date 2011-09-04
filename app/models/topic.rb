class Topic < ActiveRecord::Base
    
  has_many  :child_linkages, :class_name => "Linkage", :foreign_key => "topic_id", :dependent => :destroy, :conditions => ['linkages.active = ?', true]          
  has_many  :children, :through => :child_linkages
  has_many  :parental_linkages, :class_name => "Linkage", :foreign_key => "child_id", :dependent => :destroy, :conditions => ['linkages.active = ?', true]   
  has_many  :parents, :through => :parental_linkages, :source => :article
  
  before_save :assign_display_options
  
  validates_presence_of :title
  validates_presence_of :body
  
  has_attached_file :icon, :styles => { :thumb => "100x100>", :iphone => "50x50>" },
    :url => "/images/:attachment/:id/:style/:basename.:extension",  
    :path => ":rails_root/public/images/uploads/:attachment/:id/:style/:basename.:extension"
  
# Define getters/setters for display_options and constants
  %w[visible active root full_screen linkable].each_with_index do |ivar, index|
    const_set(ivar.upcase, 1 << index)
    
    define_method(ivar) do 
      tmp = instance_variable_get("@#{ivar}")
      return tmp if tmp
      instance_variable_set("@#{ivar}", display_options & class_eval(ivar.upcase))
    end
    
    define_method("#{ivar}?") do
      self.send(ivar) > 0
    end
    
    define_method("#{ivar}=") do |value|
      instance_variable_set("@#{ivar}", value.to_i > 0 ? class_eval(ivar.upcase) : 0)
    end
  end
  
  scope :linkable_topics, (
    lambda do |topic| 
      linkages = topic.child_linkages
      return Topic.where('id <> ? AND display_options & ?', topic, LINKABLE) if linkages.empty?
      { :conditions => ['id <> ? AND id NOT IN (?) AND display_options & ?', topic, linkages.map(&:child_id), LINKABLE] }
    end
  )
          
  def self.all_after_date(date)
    if date.nil?
      find(:all, :order => :id)
    else
      where("created_at >= ? OR updated_at >= ?", date, date).order(:id)
    end
  end
  
  def self.alive
    where(['display_options & ? AND display_options & ?', VISIBLE, ACTIVE])
  end
  
  def self.visible_topics
    where(['display_options & ? AND display_options & ?', LINKABLE, ACTIVE])
  end
  
  def as_json(options ={})
    {:topic => 
      {
        :server_id       => id,
        :title           => title,
        :summary         => summary || "",
        :body            => body,
        :display_options => display_options,
        :icon_file_name  => icon.url(:iphone)
      }
    }
  end
    
private 

  def assign_display_options
    self.display_options = visible | active | root | full_screen | linkable
  end
  
end
