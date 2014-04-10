class MessagesController < ApplicationController
  
  member_only :create, :destroy, :destroy_selected_messages, :index, :new, :set_messages_to_read, :set_messages_to_unread, :show
  
  after_filter :set_waypoint, :only => %w{index list show sent}
  
  class << self

    def allowed_to_with_messages?(url_options, member)
      return false if !allowed_to_without_messages?(url_options, member)
      if url_options[:action].in? %w{destroy show}
        @message = Message.find(url_options[:id])
        @message.recipients.all.include?(member) || @message.owned_by?(member)
      else
        true
      end
    end
    alias_method_chain :allowed_to?, :messages
    
  end
  
  def index
    @messages = @logged_in_member.messages.grouped_by_parent.max_latest.paginate(:page => params[:page], :per_page => APP_CONFIG[:messages_per_page] || 10)
  end
  
  def show
    @message = Message.find(params[:id])
    @message.read_by!(@logged_in_member)
    @message = @message.parent    
    @messages = @message.children
  end
  
  def new
    @message = Message.new(:member => @logged_in_member, :recipient_ids => params[:recipient_ids])
  end
  
  def create
    @message = Message.new(params[:message])
    if @message.save
      flash[:notice] = "Message sent"
      redirect_to_waypoint
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @message = Message.find(params[:id])
    params[:sent] ? @message.update_attribute(:deleted, true) : @message.delete_for!(@logged_in_member)
    flash[:notice] = "Message deleted"
    redirect_to params[:sent] ? sent_messages_url : messages_url
  end
  
  def destroy_selected_messages
    messages = []
    params[:selected_messages].each_pair do |id, value|
      messages << Message.find(id.to_i) if value.to_i == 1
    end
    count = 0 
    messages.each do |message|
      if params[:sent] && params[:sent] == "true"
        message.update_attribute(:deleted, true) if message.owned_by?(logged_in_member)
      else
        message.delete_for!(@logged_in_member)
      end
      count += 1
    end
    flash[:notice] = "#{@template.pluralize(count, 'message')} deleted"
    if params[:sent] && params[:sent] == "true"
      redirect_to sent_messages_url
    else
      redirect_to messages_url
    end
  end

  def sent
    @messages = @logged_in_member.sent_messages.not_deleted.grouped_by_parent.max_latest.paginate(:page => params[:page], :per_page => APP_CONFIG[:messages_per_page] || 10)
  end
  
  def set_messages_to_read
    params[:selected_messages].each_pair do |id, value|
      Message.find(id.to_i).read_by!(@logged_in_member) if value.to_i == 1
    end
    redirect_to messages_url
  end
  
  def set_messages_to_unread
    params[:selected_messages].each_pair do |id, value|
      Message.find(id.to_i).un_read_by!(@logged_in_member) if value.to_i == 1
    end
    redirect_to messages_url
  end
  
end