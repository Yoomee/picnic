Factory.define(:message) do |m|
  m.association :member, :factory => :member
  m.recipients {|recipient| [recipient.association(:member)]}
  m.subject "Message Subject"
  m.text "Message text"
end