require 'openssl'
require 'base64'
class DelegateReceiverController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  admin_only :test
  open_action :receive  
  def receive
    expected_signature = get_signature
    DELEGATE_LOGGER.info(" (from #{request.remote_ip})\n\n#{params.to_yaml}\nSIGNATURE: #{params["SIGNATURE"]}\nEXPECTED:  #{expected_signature}\n\n#{request.env.inspect}")
    render :text => "SUCCESS\n", :status => 200
  end
  
  def test
  end
  
  private
  def get_signature
    fields = %w{REGDATE PRESENT TYPE PROMO FIRSTNAME LASTNAME GENDER ORGANISATION BRANCH FUNCTION EMAIL TWITTER TICKET_WED TICKET_THU TICKET_FRI TICKET_3 DINNER_WED DINNER_THU}
    data = fields.collect{|f| params[f.to_sym]}.join('')
    Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha1'), "yTY76jN#p0&u1J", data)).strip    
  end  
  
end