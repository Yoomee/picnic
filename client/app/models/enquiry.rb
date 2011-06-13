Enquiry.class_eval do
  
  acts_as_textcaptcha({
    'questions' => Picnic::SPAM_QUESTIONS
  })
  
end