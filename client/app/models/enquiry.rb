Enquiry.class_eval do
  
  acts_as_textcaptcha({
      'api_key' => '6t5vlvftcusc0gwgokgks08wog18qgtm',
      'questions' => [
        {'question' => 'Which of these would be useful for a Picnic? A lightbulb, a hammer, a sandwich', 'answers' => 'a sandwich, sandwich'}
      ]
  })
  
end