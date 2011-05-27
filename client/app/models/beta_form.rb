module BetaForm
  
  include EnquiryForm
  
  email_from "info@picnicnetwork.org"
  email_subject 'New Beta form submission'
  email_to "info@picnicnetwork.org"
  response_message "Thanks very much for your comments. We will take them on board and use them to improve the PICNIC Network experience."
  title "Have your say"
  fields :name, :email_address, :comments
  validates_presence_of :name, :email_address, :comments
  
end