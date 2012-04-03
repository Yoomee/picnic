class ConferenceDelegatesController < ApplicationController
  
  admin_only :index  
  
  def index
    params[:year] ||= 2012
    @conference_delegates = ConferenceDelegate.for_year(params[:year]).latest.paginate(:page => params[:page], :per_page => 20)
  end
  
  def verify
    conference_delegate = ConferenceDelegate.find_by_signature(params[:signature])
    if conference_delegate && conference_delegate.member.nil?
      session[:conference_delegate_id] = conference_delegate.id
      if logged_in_member
        if logged_in_member.conference_delegate.nil?
          conference_delegate.update_attribute(:member, logged_in_member)
          flash[:notice] = "Thanks for verifying your PICNIC 11 booking."
        else
          flash[:notice] = "You've already verified your PICNIC 11 booking."
        end
        redirect_to club_path
      else
        @member = Member.new(:conference_delegate => conference_delegate)
      end
    else
      flash[:notice] = "This PICNIC 11 booking has already been verified."
      redirect_to club_path
    end
  end

  
end