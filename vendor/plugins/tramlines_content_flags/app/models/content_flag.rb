class ContentFlag < ActiveRecord::Base

  belongs_to :attachable, :polymorphic => true
  belongs_to :resolved_by, :class_name => "Member"
  before_create :set_opened_at
  
  has_many :content_flag_fields, :autosave => true, :dependent => :destroy
  has_many :content_flaggings, :dependent => :destroy
  has_many :content_flag_types, :through => :content_flaggings

  validates_presence_of :url, :unless => :has_attachable?

  named_scope :latest, :select => "content_flags.*, COUNT(content_flaggings.id) AS flagging_count", :joins => :content_flaggings, :group => "content_flags.id", :order => "flagging_count DESC, content_flags.opened_at DESC"
  named_scope :unresolved, :joins => :content_flaggings, :conditions => "content_flags.resolved_at IS NULL", :group => "content_flags.id"
  named_scope :resolved, :conditions => "content_flags.resolved_at IS NOT NULL"
  named_scope :for_type, lambda {|flag_type| {:joins => :content_flaggings, :conditions => ["content_flaggings.content_flag_type_id = ?", flag_type.id], :group => "content_flags.id"}}

  class << self
    
    def average_response_in_seconds
      resolved.average("TIME_TO_SEC(TIMEDIFF(content_flags.resolved_at,content_flags.opened_at))").to_i
    end
    
    def average_response
      time = average_response_in_seconds
      return time, "second" if time < 600
      time = time/60
      return time, "minute" if time < 240
      time = time/60
      return time, "hour" if time < 24
      time = time/24
      return time, "day"
    end
    
    def unresolved_count
      unresolved.count(:select => "DISTINCT content_flags.id")
    end
    
  end
  
  def bannable?
    attachable_type=="Member" && attachable.respond_to?(:banned?)
  end
  
  def create_content_flag_field_if_changed(attribute, value)
    latest_flag = content_flag_fields.name_is(attribute.to_s).latest.first
    if latest_flag.blank?
      content_flag_fields.create(:name => attribute.to_s, :value => value)
    elsif(latest_flag.value != value)
      content_flag_fields.create(:name => attribute.to_s, :value => value)
    end
  end

  def flagged_by_system?
    content_flaggings.not_flagged_by_human.count > 0
  end

  def has_attachable?
    !attachable.nil?
  end
  
  def history(field = nil)
    h = []
    h += content_flaggings
    if field && text_field
      h += content_flag_fields.name_is(text_field.name).name_is_not("member_id")
    else
      h += content_flag_fields.name_is_not("member_id")
    end
    h.sort{|x,y| y.created_at <=> x.created_at}
  end

  def member
    return nil if !has_attachable?
    if attachable.nil? && !(member_id_fields = content_flag_fields.name_is("member_id")).blank?
      Member.find(member_id_fields.first.value)
    else
      attachable.respond_to?(:member) ? attachable.member : nil
    end
  end
  
  def member_full_name
    member.nil? ? nil : member.full_name
  end

  def name
    if member
      member.full_name
    elsif has_attachable?
      "A #{attachable_type.downcase}"
    else
      APP_CONFIG['site_url'] + url
    end
  end
  alias_method :to_s, :name
  
  def next(options = {})
    if options[:menu_item]=="resolved"
      return ContentFlag.resolved.descend_by_resolved_at.find(:first, :conditions => ["content_flags.resolved_at < ?", resolved_at])
    end
    content_flag_type = ContentFlagType.find_by_id(options[:content_flag_type_id])
    next_content_flags = content_flag_type.nil? ? ContentFlag : content_flag_type.content_flags
    next_content_flags.unresolved.latest.not_including(self).find(:first, :group => "content_flags.id HAVING IF(flagging_count = #{content_flaggings.count}, content_flags.opened_at < '#{opened_at}', flagging_count < #{content_flaggings.count})")
  end
  
  def prev(options = {})
    if options[:menu_item]=="resolved"
      return ContentFlag.resolved.ascend_by_resolved_at.find(:first, :conditions => ["content_flags.resolved_at > ?", resolved_at])
    end
    content_flag_type = ContentFlagType.find_by_id(options[:content_flag_type_id])
    prev_content_flags = content_flag_type.nil? ? ContentFlag : content_flag_type.content_flags
    prev_content_flags.unresolved.latest.not_including(self).find(:first, :group => "content_flags.id HAVING IF(flagging_count = #{content_flaggings.count}, content_flags.opened_at > '#{opened_at}', flagging_count > #{content_flaggings.count})", :order => "flagging_count ASC, content_flags.opened_at ASC")
  end
  
  def text_field
    if has_attachable?
      text_fields = content_flag_fields.reject{|f| f.name.in?(["member_id","attachable_type"])}
      if !text_fields.blank?
        if !(t = text_fields.select{|f| f.name == "text"}).blank?
          t.first
        else
          text_fields.first
        end
      end      
    end
  end
  
  def current_text
    return attachable.to_s if attachable.is_a?(Member)
    if text_field
      attachable.send(text_field.name)
    end
  end
  
  def removable?
    return false if !has_attachable?
    attachable.respond_to?(:removed?)
  end
  
  def removed?
    removable? && attachable.removed?
  end
  
  def auto_removed?
    removed? && attachable.removed_by.nil?
  end
  
  def auto_remove!
    return false if !removable?
    attachable.update_attributes(:removed_at => Time.now, :removed_by => nil)
  end
  
  def auto_remove_if_needed
    return true if !removable?
    if content_flaggings.from_today.from_different_people.length == (APP_CONFIG['flagging_threshold'] || 3)
      auto_remove!
    else
      true
    end
  end
  
  def resolve!(member)
    return nil if member.nil?
    self.update_attributes(:resolved_by => member, :resolved_at => Time.now)
  end
  
  def unresolve!
    self.update_attributes(:resolved_by => nil, :resolved_at => nil, :opened_at => Time.now)
  end
  
  def resolved
    !resolved_at.blank?
  end
  alias_method :resolved?, :resolved

  def text
    return attachable.to_s if attachable.is_a?(Member)
    text_field ? text_field.value : nil
  end

  def validate_attachable
    if has_attachable?
      attachable.content_filter_valid?
    end
  end
  
  
  private
  def set_opened_at
    self.opened_at = Time.now
  end

end
