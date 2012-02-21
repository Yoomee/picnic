require 'fileutils'
class DelegateLogger < Logger
  def format_message(severity, timestamp, progname, msg)
    "#{timestamp}#{msg}\n\n\n"
  end
end

FileUtils.touch("#{RAILS_ROOT}/log/delegate.log")
logfile = File.open(RAILS_ROOT + '/log/delegate.log', 'a')
logfile.sync = true
DELEGATE_LOGGER = DelegateLogger.new(logfile)