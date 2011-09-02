class TopicsController < ApplicationController
  # GET /topics
  # GET /topics.xml
  def index
    @topics = Topic.root_topics

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

    respond_to do |format|
      format.html { redirect_to(topics_url) }
    end
  end
end
