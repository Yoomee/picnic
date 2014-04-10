include Mocha::API
Factory.define(:badge) do |f|
  f.sequence(:ref) {|n| "badge_#{n}"}
  f.sequence(:name) {|n| "Badge #{n}"}
  f.description "A great badge"
  f.after_build do |badge|
    image_mock = mock
    badge.stubs(:image).returns image_mock
    image_mock.stubs(:size).returns 100.kilobytes
    image_mock.stubs(:process).returns image_mock
    image_mock.stubs(:mime_type).returns 'image/png'
    image_mock.stubs(:url).returns '/url/to/image.png'
    badge.stubs(:resize_down).returns true
    badge.stubs(:save_attachments).returns true
  end
end