class TagsController < ApplicationController
  
  before_filter :get_tag, :only => %w{destroy edit show update}

  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      flash[:notice] = "New theme has been created"
      redirect_to @tag
    else
      render :action => "new"
    end
  end

  def destroy
    if @tag.destroy
      flash[:notice] = "#{@tag} theme has been deleted"
    else
      flash[:error] = "#{@tag} theme could not be deleted"
    end
    redirect_to_waypoint
  end
  
  def edit
    
  end
  
  def index
    @tags = Tag.all
  end
  
  def new
    @tag = Tag.new
  end
  
  def show
    @stories = Shout.tagged_with(params[:id]).all.paginate(:per_page => 6, :page => params[:page])
  end
  
  def update
    if @tag.update_attributes(params[:tag])
      flash[:notice] = "Updated theme"
      redirect_to @tag
    else
      render :action => "edit"
    end
  end
  
  private
  def get_tag
    @tag = Tag.find_by_name(CGI::unescape(params[:id]))
  end
  
end