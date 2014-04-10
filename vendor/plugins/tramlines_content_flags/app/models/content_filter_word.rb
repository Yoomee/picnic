class ContentFilterWord < ActiveRecord::Base

  after_save :flush_words
  after_destroy :flush_words
  
  validates_presence_of :word
  validates_uniqueness_of :word
  
  named_scope :whitelist, :conditions => {:whitelist => true}
  named_scope :blacklist, :conditions => {:whitelist => false}
  
  def starred
    word.gsub(/[aeiou]/, '*')
  end
  alias_method :to_s, :starred
  
  def increment!
    update_attribute :count, count + 1
  end
  
  private
  def flush_words
    TramlinesContentFilter::flush_words!
  end

end