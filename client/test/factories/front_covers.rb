Factory.define(:front_cover) do |f|
  f.main_story_background_color 'aabbcc'
  f.main_story_link_url 'http://www.google.com'
  f.main_story_text 'Lorem ipsum dolor...'
  f.main_story_title 'The main story'
  f.sequence(:name) {|n| "Front cover #{n}"}
  f.small_story1_link_url 'http://www.google.com'
  f.small_story1_text 'Lorem ipsum dolor...'
  f.small_story1_title 'Small story 1'
  f.small_story2_link_url 'http://www.google.com'
  f.small_story2_text 'Lorem ipsum dolor...'
  f.small_story2_title 'Small story 2'
  f.small_story3_link_url 'http://www.google.com'
  f.small_story3_text 'Lorem ipsum dolor...'
  f.small_story3_title 'Small story 3'
  f.after_build do |front_cover|
    image_mock = mock
    image_mock.stubs(:height).returns 500
    image_mock.stubs(:mime_type).returns 'image/png'
    image_mock.stubs(:process).returns mock.stub(:url => '/image/thumb.png')
    image_mock.stubs(:url).returns 'image.png'
    image_mock.stubs(:width).returns 1280
    front_cover.stubs(:image).returns image_mock
  end
end
