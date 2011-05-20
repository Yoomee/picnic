LocationsHelper.class_eval do
  
  def render_address(location, options = {})
    return "" if location.nil?
    options.reverse_merge!(:html => true, :multi_line => false, :country => (location.country != "United Kingdom"))
    if options[:multi_line]
      separator = options[:separator] || (options[:html] ? "<br />" : "\n")
    else
      separator = ", "
    end
    out = ""
    out << (location.city + separator) unless location.city.blank?
    out << (location.country + separator) if options[:country] && !location.country.blank?
    return "" if out.blank?
    out.sub!(/#{separator}$/, '')
    options[:html] ? content_tag(:p, out, :class => "contact_address") : out
  end
  
end