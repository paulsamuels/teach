class Linkage < ActiveRecord::Base
  
  belongs_to :topic
  belongs_to :child, :class_name => "Topic", :foreign_key => "child_id"
  
  validates_presence_of :topic_id
  validates_presence_of :child_id
  
  def self.all_after_date(date)
    if date.nil?
      return all
    else
      return where("created_at >= ? OR updated_at >= ?", date, date)
    end
  end
  
  def as_json(options={})
    {:linkage =>
      {
        :topic_id => topic_id,
        :child_id => child_id,
        :active   => active
      }
    }
  end
  
end
