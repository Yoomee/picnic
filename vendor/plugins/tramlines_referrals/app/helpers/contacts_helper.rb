module ContactsHelper
  
  def contacts_email_suffix_options
    [
      ["gmail.com","gmail:gmail.com"],
      ["googlemail.com","gmail:googlemail.com"],
      ["hotmail.com","hotmail:hotmail.com"],
      ["hotmail.co.uk","hotmail:hotmail.co.uk"],
      ["plaxo.com","plaxo:plaxo.com"],
      ["yahoo.co.uk","yahoo:yahoo.co.uk"],
      ["yahoo.com","yahoo:yahoo.com"]
    ]
  end
  
end