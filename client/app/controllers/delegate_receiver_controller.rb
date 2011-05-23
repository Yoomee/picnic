# require 'openssl'
# require 'base64'
class DelegateReceiverController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  admin_only :test
  open_action :receive  
  def receive
    DELEGATE_LOGGER.info(" (from #{request.remote_ip})\n\n#{params.to_yaml}\n#{request.env.inspect}\n\n")
    render :text => "SUCCESS\n", :status => 200
  end
  
  def test
  end
  
  # private
  # def verify_signature
  #   fields = %w{REGDATE PRESENT TYPE PROMO FIRSTNAME LASTNAME GENDER ORGANISATION BRANCH FUNCTION EMAIL TWITTER TICKET_WED TICKET_THU TICKET_FRI TICKET_3 DINNER_WED DINNER_THU}
  #   
  #   data = fields.collect{|f| params[f.to_sym]}.join('')
  #   signature = Base64.encode64(OpenSSL::HMAC.digest(digest, "yTY76jN#p0&u1J", data)).strip
  # end
  
  
  
end