(function($){
    $.fn.supersize = function() {  
        $(document).ready(function() {
            $('#fullscreenbg').resizenow();
        });
        $(window).bind("resize", function() {
            $('#fullscreenbg').resizenow();
        });
    };

    $.fn.resizenow = function() {
		var startwidth  = 1370;
		var startheight = 922;
        var ratio = startheight/startwidth;
        var browserwidth = $(window).width();
        var browserheight = $(window).height();
        if ((browserheight/browserwidth) > ratio) {
            $(this).height(browserheight);
            $(this).width(browserheight / ratio);
            $(this).children().height(browserheight);
            $(this).children().width(browserheight / ratio);
        } else {
            $(this).width(browserwidth);
            $(this).height(browserwidth * ratio);
            $(this).children().width(browserwidth);
            $(this).children().height(browserwidth * ratio);
        }
        $(this).children().css('left', (browserwidth - $(this).width())/2);
        $(this).children().css('top', (browserheight - $(this).height())/2);
    };
})(jQuery);