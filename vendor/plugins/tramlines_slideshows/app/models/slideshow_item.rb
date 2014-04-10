# make open-uri always write Tempfile, never StringIO, so that video thumbnails can be saved
require 'open-uri'
OpenURI::Buffer.module_eval do
  remove_const :StringMax
  const_set :StringMax, 0
end

class SlideshowItem < ActiveRecord::Base
  
  include TramlinesImages
  include ValidateExtensions
  
  belongs_to :slideshow
  belongs_to :photo

  before_validation :delete_photo_or_video
  
  validates_url_format_of :video_url
  
  acts_as_list :scope => :slideshow
  
  attr_boolean_accessor :delete_photo, :delete_video, :invalid_video_url
  
  class << self
    
    def is_video_url?(url)
      [TextHelper::GOOGLE_VIDEO_URL_RE, TextHelper::VIMEO_URL_RE, TextHelper::YOUTUBE_URL_RE].any? {|reg| url.match(reg)}
    end
    
    def is_youtube_user_url?(url)
      url.match(TextHelper::YOUTUBE_USER_URL_RE)
    end
    
  end
  
  def is_video_url?
    return false if video_url.blank?
    self.class::is_video_url?(video_url)
  end
  
  def is_youtube_user_url?
    return false if video_url.blank?
    self.class::is_youtube_user_url?(video_url)
  end
  
  def oembed_video
    if changed.include?('video_url')
      begin
        oembed = Embedit::Media.new(video_url)
        self.video_html = oembed.html
        self.video_image = open(oembed.thumbnail)
        self.text = oembed.title if read_attribute(:text).blank?
      rescue
        self.invalid_video_url = true
      end
    end
  end
  
  def reformatted_video_html options={}
    ret = self.video_html
    ret.gsub!(/\s+width="\d+"/, " width='#{options[:width]}' ") if options[:width]
    ret.gsub!(/\s+height="\d+"/, " height='#{options[:height]}' ") if options[:height]
    # if video_url.match(TextHelper::YOUTUBE_URL_RE)
    #   ret.gsub!(/(youtube.com\/v\/[^"]+)"/, '\1' + "?version=3&enablejsapi=1\"")
    # end
    # ret.gsub!(/<\/object>/, "<param name='allowScriptAccess' value='always' /></object>")
    # ret.gsub!(/<embed /, "<embed allowScriptAccess='always' ")    
    if options[:autoplay]
      unless ret.gsub!("fullscreen=1", "fullscreen=1&amp;autoplay=1")
        ret.gsub!(/http:[^"]*/, '\0?autoplay=1')
      end
    end
    ret.gsub!(/<\/object>/, "<param name='wmode' value='#{options[:wmode]}' /></object>") if options[:wmode]
    # Unencode
    CGI.unescapeHTML ret
  end
  
  def video_url=(value)
    value = 'http://' + value unless value.blank? || value =~ /^http/
    value = fix_youtube_link(value)
    write_attribute(:video_url, value)
    if is_video_url?
      oembed_video unless RAILS_ENV.to_sym == :test
    else
      self.invalid_video_url = true
    end
    value
  end
  
  def validate
    return true if marked_for_destruction?
    if photo.blank? && video_url.blank?
      self.errors.add(:video_url, "")
      self.errors.add_to_base("Please choose an image or video")
    elsif !video_url.blank? && invalid_video_url?
      if is_youtube_user_url?
        self.errors.add(:video_url, "Please use the url for the video and not the channel.")
      else
        self.errors.add(:video_url, "Could not find video.")
      end
    end
  end
  
  private  
  def delete_photo_or_video
    if delete_photo?
      self.photo_id = nil
    elsif delete_video?
      self.video_url = nil
      self.video_html = nil
      self.video_image_uid = nil
    end
  end
  
  def fix_youtube_link(val)
    return val if val.blank?
    youtube_id = get_youtube_id(val)
    youtube_id.blank? ? val : "http://www.youtube.com/watch?v=#{youtube_id}"
  end
  
  def get_youtube_id(val)
    if res = val.match(TextHelper::YOUTUBE_URL_RE) || val.match(TextHelper::YOUTUBE_USER_ID_URL_RE)
      res[2]
    end
  end
  
end