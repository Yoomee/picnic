class Referral < ActiveRecord::Base
  
  attr_accessor :medium, :recipients
  attr_writer :subject, :message
  
  attr_accessor :email, :name, :recipient_email

  validates_presence_of :message

  delegate :email, :to => :member, :prefix => true, :allow_nil => true

  def recipient_list
    recipients.split(',').collect(&:strip)
  end
  
  def validate
    errors.add :recipients, "can't be blank" if medium == 'email' && recipient_list.size < 1
    validate_format_is_email_address_of %w{recipients} if medium == 'email'
  end

  has_permalink
  
  belongs_to :member
  
  cattr_accessor :default_subject, :default_message, :twitter_message, :facebook_message
  
  @@default_subject = 'Replace this with something relevant'
  @@default_message = <<EOS
Set the message here,

The placeholder #URL# will be replaced by the referral URL.

EOS
  @@twitter_message = "This message will link to"
  @@facebook_message = "This is a message about a site I like"
  
  def message
    @message ||= Referral::default_message.gsub(/#URL#/, url)
  end
  
  def twitter_message
    Referral::twitter_message
  end

  def facebook_message
    Referral::facebook_message.gsub(/#URL#/, url)
  end
  
  def subject
    @subject ||= Referral::default_subject
  end
  
  def url
    "#{APP_CONFIG[:site_url]}/#{code}"
  end
  
  # This must be passed as a hidden field, in order that the created record is saved with the correct code.
  def code
    @code ||= (read_attribute(:code) || (member.id * Time.now.to_i).to_s(36))
  end
  # For some reason using code for the hidden field in the form doesn't work, so:
  alias_method :code_string, :code

  def to_s
    code
  end

  def code_string=(val)
    self.code = val
  end

  
end
