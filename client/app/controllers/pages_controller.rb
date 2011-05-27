PagesController.class_eval do
  
  def show_with_contact_form
    show_without_contact_form
    @enquiry = Enquiry.new(:form_name => 'Beta', :member => logged_in_member) if @page.slug == 'beta'
    spamify(@enquiry)
  end
  alias_method_chain :show, :contact_form
  
end