class SubscriptionsController < ApplicationController
  
  member_only :create, :destroy, :index
  
  def create
    @subscription = logged_in_member.subscriptions.find_or_create_by_attachable_type_and_attachable_id(params[:attachable_type], params[:attachable_id])
    render :update do |page|
      page[:subscribe_link].replace(render("subscriptions/link", :attachable => @subscription.attachable))
    end
  end
  
  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
    render :update do |page|
      if Module::value_to_boolean(params[:manage_subscriptions])
        page["subscription_#{@subscription.id}"].fadeOut
      else
        page[:subscribe_link].replace(render("subscriptions/link", :attachable => @subscription.attachable))
      end
    end
  end
  
  def index
   @subscriptions = logged_in_member.subscriptions
  end
  
end