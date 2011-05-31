SearchHelper.module_eval do
  
  def search_filter_link(name, options = {})
    filter_name = options[:filter_name] || name.singularize
    html_options = @search_filter.to_s==filter_name.to_s ? {:class => "active_filter"} : {}
    link_to_function(name, "SearchForm.filter('#{filter_name}')", html_options)
  end
  
  def search_filter_name(search_filter, options = {})
    name = case search_filter.to_s.singularize.underscore
    when ""
      "result"
    when "member"
      "people"
    when "shout"
      "post"
    when "pages_section"
      "page"
    else
      search_filter.to_s.titleize.downcase
    end
    (options[:pluralize] && name != "people") ? name.pluralize : name
  end
  
  def search_results_view_all_link(search, class_name, options = {})
    options.reverse_merge!(:filter_name => class_name.to_s.classify)
    return "" if search.size(class_name) <= SearchController::PER_PAGE
    if @search_filter==options[:filter_name]
      will_paginate(search.results(class_name), :renderer => SearchLinkRenderer) #unless search.results(class_name).is_a?(Array)
    else
      content_tag(:div, :class => "search_result_view_all") do
        search_filter_link("View all #{pluralize(search.size(class_name), search_filter_name(class_name))}", options)
      end
    end
  end
  
end