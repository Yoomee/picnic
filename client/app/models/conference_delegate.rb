require 'openssl'
require 'base64'
class ConferenceDelegate < ActiveRecord::Base
  
  ConferenceDelegate::FIELDS_IN_ORDER = %w{REGDATE PRESENT TYPE PROMO FIRSTNAME LASTNAME GENDER ORGANISATION BRANCH FUNCTION EMAIL TWITTER TICKET_WED TICKET_THU TICKET_FRI TICKET_3 DINNER_WED DINNER_THU SIGNATURE EVP_ID}
  
  belongs_to :member
  after_create :send_club_invite
  #after_save :add_badge
  
  class << self
    def create_from_params!(params)
      delegate_params = {}
      ConferenceDelegate::FIELDS_IN_ORDER.each do |field|
        case field
        when "REGDATE"
          delegate_params[:regdate] = params["REGDATE"].try(:gsub, '-','/')
        when "TYPE"
          delegate_params[:delegate_type] = params["TYPE"]
        else
          delegate_params[field.downcase.to_sym] = params[field]
        end
      end
      return nil if [:firstname, :lastname, :email, :signature, :evp_id].any?{|field| delegate_params[field].blank?} || exists?(:evp_id => delegate_params[:evp_id])
      delegate_params[:member] = Member.find_by_email(delegate_params[:email])
      create!(delegate_params)
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
  
  def data_fields
    ConferenceDelegate::FIELDS_IN_ORDER.collect do |field|
      case field
      when "SIGNATURE" then nil
      when "REGDATE" then regdate.try(:strftime, "%m-%d-%Y")
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

  def add_badge
    puts "member_id = #{member_id}"
    Member.find(member_id).award_badge!(:picnic11_attendee) unless member_id.nil?
  end
    
  
  def send_club_invite
    Notifier.deliver_club_invite(self)
  end
  
end