class DelegateLogger < Logger
  def format_message(severity, timestamp, progname, msg)
    "#{timestamp}#{msg}\n\n\n"
  end
end


logfile = File.open(RAILS_ROOT + '/log/delegate.log', 'a')
logfile.sync = true
DELEGATE_LOGGER = DelegateLogger.new(logfile)