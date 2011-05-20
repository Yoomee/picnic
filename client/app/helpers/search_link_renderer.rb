class SearchLinkRenderer < WillPaginate::LinkRenderer

  def page_link(page, text, attributes = {})
    form_id = "discussion_search_form"
    javascript = "var new_action = action_with_page_param('#{form_id}', #{page});"
    javascript << "var new_action = action_with_page_param('#{form_id}', #{page});"
    javascript << "$('##{form_id}').attr('action', new_action);"
    # javascript << "$('#search_term').attr('value', '#{@options[:search_term]}');"
    javascript << "$('##{form_id}').submit();"
    @template.link_to_function text, javascript, attributes
  end
  
end