function externalLink(url) {
  _gaq.push(['_trackPageview', '/external/'+encodeURIComponent(url)]);
  //setTimeout('window.open("' + url + '","_blank");', 100);
}
$(document).ready(function() {
  $('.wall_post_text_input').autoGrow();
  $('a[href]').not("[href^='/']").not("[href^='mailto']").not("[href*='#{request.host.gsub(/www\./, '')}']").not("[href^='#']").not("[href^='javascript']").attr('target', '_blank').attr('onClick', "externalLink(this.href);return true;");
  if(navigator.platform == 'iPad' || navigator.platform == 'iPhone' || navigator.platform == 'iPod'){$("#header").css("position", "static");$('body').css('padding-top',0);
  };
  ShareThis.init();
});

var ShareThis = {
  init: function(){
    $('#share_this').css('position', 'absolute');
    ShareThis.move(false);
    $(document).scroll(function(){ShareThis.scrolled();});
  },
  interval: null,
  scrollTop: 0,
  checkScroll: function(){
    if (Math.abs($(window).scrollTop() - ShareThis.scrollTop) == 0){
      clearInterval(ShareThis.interval);
      ShareThis.interval = null;
      ShareThis.move(true);
    } else {
      ShareThis.scrollTop = $(window).scrollTop();
    }
  },
  move: function(animated){
    if ($('#share_this').length == 0)
      return nil;      
    var top = $(window).scrollTop() - $('#main').offset().top + 100;
    var minTop = $('#page_subnav').outerHeight() + 170;
    var maxTop = $('#footer').offset().top - $('#main').offset().top - 150;
    if (top < minTop)
      top = minTop;
    else if (top > maxTop)
      top = maxTop;
    if(animated)
      $('#share_this').animate({'top':top}, 500, 'easeOutQuint');
    else
      $('#share_this').css('top',top);
  },
  scrolled: function(){
    if(ShareThis.interval == null){
      ShareThis.scrollTop = $(window).scrollTop();
      ShareThis.interval = setInterval("ShareThis.checkScroll()", 100);
    }
  }
};

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
  startTouch: 0,
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
    // if (navigator.appName == "Microsoft Internet Explorer") {
    //   $('#flipboard .hover').hide(0, function() {
    //     $('#flipboard .flip_image').show();        
    //   });
    //   flip.children('.flip_image').hide(0, function() {
    //     flip.children('.hover').show();        
    //   });
    // } else {
    //   $('#flipboard .hover').fadeOut(50, function() {
    //     $(this).removeClass('fading');
    //   });
    //   flip.children('.hover:not(.fading)').addClass('fading').fadeIn('fast');
    // }
    $('#flipboard .hover').fadeOut(50, function() {
      $(this).removeClass('fading');
    });
    flip.children('.hover:not(.fading)').addClass('fading').fadeIn('fast');
  },
  hoverOff: function(flip){
    // if (navigator.appName == "Microsoft Internet Explorer") {
    //   flip.children('.hide').hide(0, function() {
    //     flip.children('.flip_image').show();
    //   });
    // } else {
    //   flip.children('.hover').fadeOut(50, function() {
    //     $(this).removeClass('fading');
    //   });
    // }
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
    Flipboard.slow_scroll_timer = setInterval("Flipboard.scroll(1)", 50);
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
  },
  toggle: function(){
    if (navigator.appName == "Microsoft Internet Explorer") {
      if($(window).scrollTop() > 0){      
        $('html').animate({'scrollTop':0}, 1000);
      } else {
        $('html').animate({'scrollTop':617}, 1000);
      }      
    } else {
      if($(window).scrollTop() > 0){      
        $('body').animate({'scrollTop':0}, 1000);
      } else {
        $('body').animate({'scrollTop':617}, 1000);
      }
    }
  },
  touchStartOffset:null
};

var RecipientShouts = {
  url: '',
  getShouts: function(filter) {
    $('#filter_loader').show();
    $.ajax({
      url: RecipientShouts.url,
      data: {
        filter: filter,
        wants: 'shouts'
      },
      complete: function() {
        $('#filter_loader').hide();
      },
      success: function(html) {
        $('#shouts_container').html(html);
        FancyboxLoader.loadAll();
      }
    });
  },
  latest: function() {
    $('.stories_filter li').removeClass('active');
    $('#latest_shouts').addClass('active');
    this.getShouts('latest');
  }, 
  popular: function() {
    $('.stories_filter li').removeClass('active');
    $('#popular_shouts').addClass('active');
    this.getShouts('popular');
  },
  received: function() {
    $('.stories_filter li').removeClass('active');
    $('#received_shouts').addClass('active');
    this.getShouts('received');
  }       

};

var MemberFilterAZ = {
  finished_ajax: false,
  show_loader: function() {
    if (!MemberFilterAZ.finished_ajax) {
      $('#member_filter_loader').fadeIn();
    }
  },
  update_members: function(data) {
    $('#member_filter_a_z a').removeClass('active');
    $('#member_filter_' + data.letter).addClass('active');
    MemberFilterAZ.finished_ajax = false;
    setTimeout("MemberFilterAZ.show_loader();", 700);
    $('#member_grid_container').animate({opacity:0}, 500, function() {
      $('#member_grid_container').load('/members/all', data, function() {
        FB.XFBML.parse();
        MemberFilterAZ.finished_ajax = true;
        $('#member_grid_container').animate({opacity:1}, 300);
        $('#member_filter_loader').hide();
      });      
    });
  }
};

var BuyTickets = {
	animate: function(){
		setTimeout("BuyTickets.showMessage(2)", 2000);
	},
	showMessage: function(message){
		var other = (message == 1 ? 2 : 1);
		$(".ticket_message_"+other).animate({opacity:"0"}, 500, function(){
			$(".ticket_message_"+message).animate({opacity:"1"}, 500, function(){
				setTimeout("BuyTickets.showMessage("+other+")", 2000);
			});
		});	
	}
};

var SpeakerTagFilter = {
  filter: function(tag){
    if(tag == null || tag == ''){
      $('#member_grid').css('border-color', $('#speaker_tag_filter_all .tag').css('background-color'));
      $('.speaker_grid li').fadeIn();
    } else {
      $('#member_grid').css('border-color', $('#speaker_tag_filter_'+tag+' .tag').css('background-color'));
      $('.speaker_grid li').fadeOut();
      $('.speaker_grid .tag_'+tag).fadeIn();
    }
  }
};




