class FetchEmailContacts < Tableless
  
  validates_presence_of :email_prefix, :email_service, :email_suffix, :email_password
  attr_accessor :email_prefix, :email_suffix, :email_service, :service_and_suffix, :email_password
  before_validation :split_service_and_suffix
    
    
  def email
    "#{email_prefix}@#{email_suffix}"
  end
  
  def fetch_contacts
    begin
      req = Contacts.new(email_service.to_sym, email, email_password)
      req.contacts
    rescue Exception => e
      puts e.message
      nil
    end    
  end
  
  private
  def split_service_and_suffix
    self.email_service, self.email_suffix = service_and_suffix.try(:split, ':')
  end
  
end