SessionsController.class_eval do
  
  skip_before_filter :check_what_i_bring, :only => %w{destroy}
  
end