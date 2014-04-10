module MessagesHelper
  
  def message_recipient_list(message, options = {})
    options.reverse_merge!(:use_links => true, :capitalize => true, :include_author => true)
    you = options[:capitalize] ? "You" : "you"
    out = options[:use_links] ? link_to(you, @logged_in_member) : you
    recipients = message.recipients.not_including(@logged_in_member)
    recipients << message.author unless message.owned_by?(@logged_in_member) || !options[:include_author]
    recipients.each do |recipient|
      out += (recipients.last == recipient) ? " and " : ", "
      out += options[:use_links] ? link_to(recipient.to_s, recipient) : recipient.to_s
    end
    out
  end
  
end
