Factory.define(:advert) do |f|
  f.sequence(:name) {|n| "Advert #{n}"}
  f.association :campaign, :factory => :advert_campaign
  f.url "http://yoomee.com"
  f.after_build do |advert|
    image_mock = mock
    advert.stubs(:image).returns image_mock
    image_mock.stubs(:size).returns 100.kilobytes
    image_mock.stubs(:process).returns image_mock
    image_mock.stubs(:mime_type).returns 'image/png'
    image_mock.stubs(:url).returns '/url/to/image.png'
    advert.stubs(:save_attachments).returns true
  end
  
end