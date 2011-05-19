SearchHelper.module_eval do
  
  def search_filter_link(name, options = {})
    filter_name = options[:filter_name] || name.singularize
    html_options = @search_filter.to_s==filter_name.to_s ? {:class => "active_filter"} : {}
    link_to_function(name, "SearchForm.filter('#{filter_name}');", html_options)
  end
  
  def search_filter_name(search_filter, options = {})
    name = case search_filter.to_s.underscore
    when ""
      "result"
    when "member"
      "people"
    when "shout"
      "discussion"
    when "poll_question"
      "poll"
    else
      search_filter.titleize.downcase
    end
    (options[:pluralize] && name != "people") ? name.pluralize : name
  end
  
end