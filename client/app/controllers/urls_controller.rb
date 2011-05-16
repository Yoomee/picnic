class UrlsController < ApplicationController
  
  member_only :new, :create, :edit, :update
  
  
  def create
    @url_object = Url.new params[:url]
    render :update do |page|
      if @url_object.save
        page.redirect_to @url_object.attachable
      else
        page["#{@url_object.new_record? ? 'new' : 'url'}_url"].replace(render('urls/form', :url_object => @url_object))
      end
    end
  end
  
  
  def new
    @url_object = Url.new(:attachable_id => params[:attachable_id], :attachable_type => params[:attachable_type])
    render :layout => false
  end
  
  def show
    
  end
  
  
  
end