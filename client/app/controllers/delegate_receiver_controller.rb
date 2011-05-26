class DelegateReceiverController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  admin_only :test
  open_action :receive  
  def receive
    conf_delegate = ConferenceDelegate.create_from_params!(params)
    DELEGATE_LOGGER.info(" (from #{request.remote_ip})\n\n#{params.to_yaml}\nSIGNATURE: #{params["SIGNATURE"]}\nEXPECTED:  #{conf_delegate.try(:expected_signature)}\n\n#{request.env.inspect}")
    render :text => "SUCCESS\n", :status => 200
  end
  
  def test
  end
  
end