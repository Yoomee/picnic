$(document).ready(function() {
  $('.wall_post_text_input').autoGrow();
});

// Shout form javascript
var ShoutForm = {
  blank: function(shout_id){
    var form_id = ShoutForm.form_id(shout_id);
    return $(form_id + ' #shout_text').attr('value') == '' && ($(form_id + ' #shout_shout_type').val() == '' || $(form_id + ' #shout_shout_type').val() == undefined);
  },
  form_id: function(shout_id) {
    if (shout_id==undefined || shout_id=='') {
      return '#new_shout';
    } else {
      return '#edit_shout_' + shout_id;
    }
  },
  loading: function(shout_id) {
    $(ShoutForm.form_id(shout_id) + ' #shout_submit').hide();
    $(ShoutForm.form_id(shout_id) + ' .shout_form_submit_loader').show();
  },
  complete: function(shout_id) {
    $(ShoutForm.form_id(shout_id) + ' .shout_form_submit_loader').hide();
    $(ShoutForm.form_id(shout_id) + ' #shout_submit').show();
  },
  hide_all_attachables: function(shout_id) {
    $(ShoutForm.form_id(shout_id) + ' .form_type_input').hide();
    $(ShoutForm.form_id(shout_id) + ' a.conversation_type').removeClass('active');
    $.fancybox.resize();
  },
  remove_attachable: function(shout_id) {
    $(ShoutForm.form_id(shout_id) + ' #shout_shout_type').val('');
    $(ShoutForm.form_id(shout_id) + ' #shout_delete_attachable').val(1);
    $(' .shout_form .attachable_preview').hide();
  },
  show_attachable_form: function(attachable, shout_id) {
    ShoutForm.hide_all_attachables(shout_id);
    if (attachable == 'Link'){
      $(ShoutForm.form_id(shout_id) + ' #shout_link_url_input').show();
    } else if (attachable == 'Photo') {
      $(ShoutForm.form_id(shout_id) + ' #shout_photo_image_input').show();
    } else if (attachable == 'Video'){
      $(ShoutForm.form_id(shout_id) + ' #shout_video_url_input').show();
    } else if (attachable == 'Document'){
      $(ShoutForm.form_id(shout_id) + ' #shout_document_input').show();
    } else if (attachable == 'PollQuestion'){
      $(ShoutForm.form_id(shout_id) + ' #shout_poll_question_form').show();
    }
    $(ShoutForm.form_id(shout_id) + ' a.attach_' + attachable.toLowerCase()).addClass('active');
    $.fancybox.resize();
  },        
  photo_attached: function () {
    return $('#shout_shout_type').val() == 'Photo';
  },
  toggle_attachable: function(attachable, shout_id) {
    if($('#shout_shout_type').val() == attachable){
      $('#shout_shout_type').val('');
      ShoutForm.hide_all_attachables();
    } else {
      $('#shout_shout_type').val(attachable);
      ShoutForm.show_attachable_form(attachable, shout_id);
    }
  },
  showCommentForm: function(elem) {
    $('.wall_form').addClass('closed');
    $('.wall_form .wall_post_text_input').val('');
    /*elem.parents('.wall_form').removeClass('closed');*/
    elem.parents('.shout_right').find('.wall_form').removeClass('closed');
    /*elem.next('form').find('.wall_post_text_input').focus();*/
    elem.parents('.shout_right').find('.wall_post_text_input').focus();
  }
};

var Leaderboard = {
  loading: function(container_id) {
    $(container_id + ' .pagination').hide();
    $(container_id + ' .leaderboard_loader').show();
  },
  complete: function(container_id) {
    $(container_id + ' .leaderboard_loader').hide();    
    $(container_id + ' .pagination').show();
    FB.XFBML.parse();
  }
};