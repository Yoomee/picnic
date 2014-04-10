require 'forwardable'
class Banning

  extend Forwardable
  
  Banning::DEFAULTS = {:message_subject => "You have been banned from the #{APP_CONFIG[:site_name]} website", :message_text => "Unfortunately you have been banned from the #{APP_CONFIG[:site_name]} website until further notice."}

  attr_accessor :member, :message_subject, :message_text, :banner, :created_at
  
  def_delegator :member, :banned_message, :message
  def_delegator :member, :forename, :member_forename
  def_delegator :member, :id

  attr_boolean_accessor :skip_email

  class << self
    
    def find(id)
      member = Member.find(id)
      new(:member => member, :message_text => member.banned_message, :created_at => member.banned_at)
    end
    
  end
  
  def attributes=(attrs)
    attrs.each do |k, v|
      send("#{k}=", v)
    end
  end
  
  def banner_id
    banner.try(:id)
  end
  
  def banner_id=(bid)
    self.banner = Member.find(bid)
  end
  
  def content_filter_errors
    {}
  end
  
  def destroy
    member.attributes = {:banned_by => nil, :banned_at => nil, :banned_message => nil}
    member.save(false)
  end
  
  def errors
    @errors ||= ActiveRecord::Errors.new(self)
  end
  
  def initialize(attrs = {})
    self.attributes = attrs.reverse_merge(Banning::DEFAULTS)
  end
  
  def member_email
    member.try(:email)
  end
  
  def member_id
    member.try(:id)
  end
  
  def member_id=(mid)
    self.member = Member.find(mid)
  end
  
  def new_record?
    true
  end
  
  def save
    member.attributes = {:banned_by => banner, :banned_at => Time.now, :banned_message => message_text}
    member.save(false)
    member.shouts.each {|shout| shout.update_attributes!(:removed_by => banner, :removed_at => Time.now)}
    Notifier.deliver_ban_notification(self) unless member_email.blank? || skip_email?
  end  
  
  def save!
    save || raise(ActiveRecord::RecordNotSaved)
  end
  
end
