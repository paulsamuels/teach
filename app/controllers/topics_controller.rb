class TopicsController < ApplicationController
  
  before_filter do |controller|
    has_access? unless controller.request.format.json?
  end
  
  # GET /topics
  # GET /topics.xml
  def index
    @topics = Topic.visible_topics.paginate(:page => params[:page], :per_page => 8)

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => Topic.all_after_date(params[:date]) }
    end
  end

  # GET /topics/1
  # GET /topics/1.xml
  def show
    @topic = Topic.find(params[:id])
    @parental_linkages = @topic.parental_linkages
    @child_linkages = @topic.child_linkages
    @linkable_topics = Topic.linkable_topics(@topic)

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /topics/new
  # GET /topics/new.xml
  def new
    @topic = Topic.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
  end

  def child_resource
    topic = Topic.new(
              :title           => "New resource",
              :body            => "New resource",
              :display_options => Topic::VISIBLE | Topic::ACTIVE | Topic::FULL_SCREEN
            )
    if topic.save
      Linkage.create(:topic_id => params[:id], :child_id => topic.id)
      redirect_to(edit_topic_path(topic))
    else
      redirect_to(topic_path(params[:id]), :notice => "Something prevented the creation of the resource")
    end
  end
  
  # POST /topics
  # POST /topics.xml
  def create
    @topic = Topic.new(params[:topic])

    respond_to do |format|
      if @topic.save
        format.html { redirect_to(@topic, :notice => 'Topic was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /topics/1
  # PUT /topics/1.xml
  def update
    @topic = Topic.find(params[:id])

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to(@topic, :notice => 'Topic was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.xml
  def destroy
    @topic = Topic.find(params[:id])
    @topic.active = 0
    @topic.save
    
    all_child_links = Linkage.find_by_child_id(@topic)
    all_child_links.delete unless all_child_links.nil?
    
    all_parental_links = Linkage.find_by_topic_id(@topic)
    all_parental_links.delete unless all_parental_links.nil?

    respond_to do |format|
      format.html { redirect_to(topics_url) }
    end
  end
end
