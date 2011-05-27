EnquiriesController.class_eval do
  
  def create
    @enquiry = Enquiry.new(params[:enquiry].merge(:possible_answers => session[:possible_answers]))
    if @enquiry.save
      Notifier.deliver_enquiry_notification @enquiry
      flash[:notice] = "#{@enquiry.response_message}"
      redirect_to root_url
    else
      spamify(@enquiry)
      render :action => 'new'
    end
  end
  
  
end