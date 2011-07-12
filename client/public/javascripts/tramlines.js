function externalLink(url) {
  _gaq.push(['_trackPageview', '/external/'+encodeURIComponent(url)]);
  //setTimeout('window.open("' + url + '","_blank");', 100);
}
$(document).ready(function() {
  $('.wall_post_text_input').autoGrow();
  $('a[href]').not("[href^='/']").not("[href^='mailto']").not("[href*='#{request.host.gsub(/www\./, '')}']").not("[href^='#']").not("[href^='javascript']").attr('target', '_blank').attr('onClick', "externalLink(this.href);return true;");
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

function action_with_page_param(form_id, page) {
	var action = $('#'+form_id).attr('action');
	if (action.match(/\?/)) {
		return (action + '&page=' + page);
	} else {
		return (action + '?page=' + page);
	}
}

var PhotoGallery = {
  init_hovers: function() {
    $('.photo_gallery_row').hover(
      function() {
        $(this).find('.photo_description').animate({'height':70});
      },
      function() {
        $(this).find('.photo_description').animate({'height':0});
      }
    );
  }
};

var Flipboard = {
  slow_scroll_timer: null,
  fast_scroll_timer: null,  
  fast_scrolling: false,
  scrolling: 0,
  direction: 1,
  allowScrolling: function() {
    var currentPosition = $('#flipboard').position().left;
    if (Flipboard.direction == 1) {
      return (currentPosition >= Flipboard.maxRight());
    } else {
      return (currentPosition <= Flipboard.maxLeft);
    }
    
  },
  hoverOn: function(flip){
    $('#flipboard .hover').fadeOut(50, function() {
      $(this).removeClass('fading');
    });
    flip.children('.hover:not(.fading)').addClass('fading').fadeIn('fast');
  },
  hoverOff: function(flip){
    flip.children('.hover').fadeOut(50, function() {
      $(this).removeClass('fading');
    });
  },
  maxRight: function() {
    return ($(window).width() - 10 - $('#flipboard').width());
  },
  maxLeft: 10,
  playPause: function(){
	if(Flipboard.slow_scrolling){
		Flipboard.slow_scrolling = false;
		$('#flipboard_play_pause').removeClass('pause');
		Flipboard.stopSlowScroll();
	} else {
		Flipboard.slow_scrolling = true;
		$('#flipboard_play_pause').addClass('pause');
		Flipboard.startSlowScroll();
	}
  },
  startFastScroll: function() {
    Flipboard.stopAllScrolling();
    Flipboard.fast_scrolling = true;
    Flipboard.fast_scroll_timer = setInterval("Flipboard.scroll(5)", 1);
  },
  startSlowScroll: function() {
    Flipboard.stopAllScrolling();
    Flipboard.slow_scrolling = true;    
    Flipboard.slow_scroll_timer = setInterval("Flipboard.scroll(1)", 30);
  },
  stopAllScrolling: function(){
    Flipboard.stopSlowScroll();
    Flipboard.stopFastScroll();
  },
  stopFastScroll: function(){
    clearInterval(Flipboard.fast_scroll_timer);
    Flipboard.fast_scrolling = false;
  },
  stopSlowScroll: function(){
    clearInterval(Flipboard.slow_scroll_timer);
    Flipboard.slow_scrolling = false;
  },
  scroll: function(speed) {
    if (!Flipboard.allowScrolling() && Flipboard.fast_scrolling) {
      Flipboard.stopAllScrolling();
    } else {
      if (!Flipboard.allowScrolling()) {
        Flipboard.direction = (Flipboard.direction * -1);
      }
      $('#flipboard').css('left', $('#flipboard').position().left - Flipboard.direction * speed);
    }
  },
  scrollJump: function(){
    if(!Flipboard.scrolling && Flipboard.allowScrolling()){
      Flipboard.scrolling = 1;
      Flipboard.stopAllScrolling();
      var currentPosition = $('#flipboard').position().left;
      var newPosition = (Flipboard.direction==1 ? (currentPosition - 240) : (currentPosition + 240));
      if (newPosition > Flipboard.maxLeft) {
        newPosition = Flipboard.maxLeft;
      } else if (newPosition < Flipboard.maxRight()) {
       newPosition = Flipboard.maxRight(); 
      }
      $('#flipboard').animate({'left':newPosition}, 600, function(){
        Flipboard.scrolling = 0;
        Flipboard.startSlowScroll();
      });
    }
  }
};