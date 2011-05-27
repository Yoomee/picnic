LocationHelper.module_eval do
  
  def current_root_section_with_beta_form
    return Page.slug(:beta).root_section if @enquiry.try(:form_name) == 'Beta'
    current_root_section_without_beta_form
  end
  alias_method_chain :current_root_section, :beta_form

  def current_section_with_beta_form?(section_id, options = {})
    @page ||= Page.slug(:beta) if @enquiry.try(:form_name) == 'Beta'
    current_section_without_beta_form?(section_id, options)
  end
  alias_method_chain :current_section?, :beta_form

end
  