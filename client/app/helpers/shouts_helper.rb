ShoutsHelper.module_eval do

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
    if($('#shout_shout_type').val() == 'Photo'){
      ShoutForm.loading();
      $('#shout_form form').attr('target','photo_upload_iframe');    
      return true; 
    } else {
      if (!ShoutForm.blank()) {
        jQuery.ajax({
          beforeSend:function(request){ShoutForm.loading();},
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