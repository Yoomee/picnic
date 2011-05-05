class TagsController < ApplicationController
  
  def index
    @tags = Tag.all
  end
  
  def show
    @tag = Tag.find_by_name(CGI::unescape(params[:id]))
    @stories = Shout.tagged_with(params[:id]).all.paginate(:per_page => 6, :page => params[:page])
  end
  
end