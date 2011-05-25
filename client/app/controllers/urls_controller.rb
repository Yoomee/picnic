class UrlsController < ApplicationController
  
  member_only :new, :create
  owner_only :edit, :update
  
  class << self
    
    def allowed_to_with_urls?(url_options, member)
      if url_options[:action].to_sym == :destroy && url_options[:id]
        return false if !member
        Url.find(url_options[:id]).attachable == member || member.is_admin?
      else
        allowed_to_without_urls?(url_options, member)
      end
    end    
    
    alias_method_chain :allowed_to?, :urls
  end
  
  def create
    @url_object = Url.new params[:url]
    render :update do |page|
      if @url_object.save
        page.redirect_to @url_object.attachable
      else
        page["#{@url_object.new_record? ? 'new' : 'edit'}_url"].replace(render('urls/form', :url_object => @url_object))
      end
    end
  end
  
  def destroy
    @url_object = Url.find(params[:id])
    render :update do |page|
      if @url_object.destroy
        page << "$('#url_#{@url_object.id}').blindUp().remove()"
      end
    end
  end
  
  def new
    @url_object = Url.new(:attachable => logged_in_member)
    render :layout => false
  end
  
  def show
    
  end
  
  private
  def allowed_to
    
  end
  
end
  
