class LinkagesController < ApplicationController
  
  before_filter do |controller|
    logged_in? unless controller.request.format.json?
  end
  
  def index
    @linkages = Linkage.all_after_date(params[:date])
    respond_to do |format|
      format.json { render :json => @linkages }
    end
  end
  
  def create
    linkage = Linkage.new(:topic_id => params[:topic_id], :child_id => params[:child_id])

    if linkage.save
      flash[:notice] = "Added link to '#{linkage.child.title}'."
    else
      flash[:error] = "Unable to add '#{linkage.child.title}'."
    end
    redirect_to :back
  end

  def destroy
    linkage = Linkage.find(params[:id])
    linkage.active = false
    linkage.save
      
    flash[:notice] = "The link has been removed"
    
    redirect_to :back
  end
  
end
