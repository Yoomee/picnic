class ReferralsController < ApplicationController

  member_only :contacts, :update, :fetch_contacts, :new
  
  def new
    @referral = Referral.create!(:member => logged_in_member)
  end
  
  def contacts
    contacts_request = FetchEmailContacts.new()
    render :partial => "contacts_form", :locals => {:contacts_request => contacts_request}, :layout => false
  end
  
  def fetch_contacts
    contacts_request = FetchEmailContacts.new(params[:fetch_email_contacts])
    render :update do |page|
      if contacts_request.save
        if contacts = contacts_request.fetch_contacts
          page["contacts_form"].replace(render "contacts_list", :contacts => contacts)
        else
          page["contacts_form"].replace(render "contacts_form", :contacts_request => contacts_request)
          page << "$('#contacts_form h1').after('#{escape_javascript("<p class='error'>Your username or password are incorrect</p>")}');"
        end
      else
        page["contacts_form"].replace(render "contacts_form", :contacts_request => contacts_request)
      end
      page << '$.fancybox.resize();'
    end
  end
  
  def update
    @referral = Referral.find(params[:id])
    if @referral.update_attributes(params[:referral])
      @referral.recipient_list.each do |recipient|
        Notifier.deliver_referral_email @referral, recipient
      end
      flash[:notice] = "Thanks for sharing!"
      redirect_to_waypoint
    else
      #flash[:notice] = "There was an error sharing this. Please ensure you entered the required details."
      render :action => "new"
    end
  end
  
  def show
    referral = Referral.find(params[:id])
    session[:referrer_id] = referral.member_id
    redirect_to root_path
  end
  
end