MessagesController.class_eval do
  before_filter :render_404 unless RAILS_ENV.to_s == 'test'
end