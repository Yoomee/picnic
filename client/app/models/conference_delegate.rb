require 'openssl'
require 'base64'
class ConferenceDelegate < ActiveRecord::Base
  ConferenceDelegate::FIELDS_IN_ORDER = %w{REGDATE PRESENT TYPE PROMO FIRSTNAME LASTNAME GENDER ORGANISATION BRANCH FUNCTION EMAIL TWITTER TICKET_WED TICKET_THU TICKET_FRI TICKET_3 DINNER_WED DINNER_THU SIGNATURE}
  
  belongs_to :member
  
  class << self
    def create_from_params!(params)
      delegate_params = {}
      ConferenceDelegate::FIELDS_IN_ORDER.each do |field|
        case field
        when "REGDATE"
          delegate_params[:regdate] = params["REGDATE"].gsub('-','/')
        when "TYPE"
          delegate_params[:delegate_type] = params["TYPE"]
        else
          delegate_params[field.downcase.to_sym] = params[field]
        end
      end
      create(delegate_params)
    end
  end
  
  def authentic?
    expected_signature == signature
  end
  
  def expected_signature
    Base64.encode64(
      OpenSSL::HMAC.digest(
        OpenSSL::Digest::Digest.new('sha1'),
        "yTY76jN#p0&u1J",
        data_fields.join('')
      )
    ).strip    
  end
  
  private
  def data_fields
    ConferenceDelegate::FIELDS_IN_ORDER.collect do |field|
      case field
      when "SIGNATURE" then nil
      when "REGDATE" then regdate.strftime("%m-%d-%Y")
      when "TYPE" then delegate_type
      else
        string = send(field.downcase).to_s
        case string
        when "true" then "1"
        when "false" then "0"
        else string
        end
      end
    end
  end
end