SessionsController.class_eval do
  
  skip_before_filter :check_what_i_bring, :only => %w{destroy}
  skip_before_filter :break_for_non_yoomee, :only => %w{destroy}
  
end