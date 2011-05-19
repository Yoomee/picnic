class DelegateReceiverController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  open_action :receive
  
  def receive
    DELEGATE_LOGGER.info(" (from #{request.remote_ip})\n\n#{params.to_yaml}\n#{request.env.inspect}\n\n")
    render :text => "SUCCESS\n", :status => 200
  end
  
  
  
end