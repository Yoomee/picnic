class Url < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  validates_presence_of :url
  validates_url_format_of :url
  
  before_save :resolve_host
  
  
  class << self
    def favicon(url)
      #Uses http://getfavicon.appspot.com/
      "http://g.etfv.co/#{url.match(/^.*:\/\//) ? url : "http://#{url}"}?defaulticon=#{APP_CONFIG[:site_url]}/images/default_favicon.png"
    end
  end
  
  def favicon
    self.class.favicon(url)
  end
  
  private
  def resolve_host
    if matches = url.match(/^([^\/]*\/\/)?(www\.)?(.*)\.(\w*)(\/)?.*$/)
      self.host = matches[3]
    end
  end
end