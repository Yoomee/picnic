class DelegateReceiverController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  open_action :receive
  
  def receive
    DELEGATE_LOGGER.info("#{params.to_yaml}\n\n#{request.env.inspect}\n\n")
    render :text => "SUCCESS\n", :status => 200
  end
  
  
  
end