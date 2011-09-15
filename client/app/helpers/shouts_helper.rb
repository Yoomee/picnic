ShoutsHelper.module_eval do

  def default_to_latest_shouts?
    if @member
      !@member.shouts_without_member_recipient.empty? || !@member.has_received_shouts?
    else
      true
    end
  end
  
  def default_to_received_shouts?
    !default_to_latest_shouts?
  end

  def older_shouts_link(name, url_options = {})
    out = link_to_remote(name, :url => older_shouts_link_url(url_options), :method => :get, :html => {:id => "older_shouts_link"}, :loading => "$('#older_shouts_link').hide();$('#older_shouts_loader').show()", :complete => "$('#older_shouts_link').show();$('#older_shouts_loader').hide()")
    out << image_tag('ajax_loader_squares.gif', :id => 'older_shouts_loader', :style => 'display:none')
  end

  def older_shouts_link_url(url_options = {})
    url_options.reverse_merge!(:page => ((params[:page] || 1).to_i + 1), :per_page => (params[:per_page] || 10), :named_scope => params[:named_scope])
    if parent = url_options.delete(:parent)
      case parent
      when Member
        url_options.merge(:id => parent.id)
        return member_older_shouts_path(url_options)
      when Tag
        url_options.merge(:id => u(parent))
        return tag_older_shouts_path(url_options)
      else
        url_options.merge!(:parent_type => parent.class, :parent_id => parent.id)
      end
    end
    older_shouts_path(url_options)
  end
  
  def render_shout_with_extra_options(shout, options = {})
    options.reverse_merge!(:show_member => true)
    render_shout_without_extra_options(shout, options)
  end
  alias_method_chain :render_shout, :extra_options
  
  def render_shouts_with_extra_options(shout, options = {})
    options.reverse_merge!(:show_member => true)
    render_shouts_without_extra_options(shout, options)
  end
  alias_method_chain :render_shouts, :extra_options
  
  def shout_on_submit(shout)
    "
    var shout_form_id = ShoutForm.form_id('#{shout.try(:id)}');
    if($(shout_form_id+' #shout_shout_type').val()=='Photo' || $(shout_form_id+' #shout_shout_type').val()=='Document'){
      ShoutForm.loading('#{shout.try(:id)}');
      $(shout_form_id).attr('target','photo_upload_iframe');
      return true; 
    } else {
      if (!ShoutForm.blank('#{shout.try(:id)}')) {
        jQuery.ajax({
          beforeSend:function(request){ShoutForm.loading('#{shout.try(:id)}');},
          data:jQuery.param(jQuery(this).serializeArray()) + '&authenticity_token=' + encodeURIComponent('#{form_authenticity_token}'),
          dataType:'script',
          type:'post',
          url:'#{shout.new_record? ? shouts_path : shout_path(shout)}'
        });
      }
      return false;
    }
    "
  end
  
end
