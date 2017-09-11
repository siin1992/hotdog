$(function() {
    // 이미지 롤오버
    $('.zImgOver').mouseover(function(){
        $(this).attr('src', $(this).attr('oversrc'));
    }).mouseout(function(){
        $(this).attr('src', $(this).attr('outsrc'));
    });

    // 이미지 클래스 롤오버
    $('.zBtnOver').mouseover(function(){
        $(this).removeClass($(this).attr('outclass'));
        $(this).addClass($(this).attr('overclass'));
    }).mouseout(function(){
        $(this).removeClass($(this).attr('overclass'));
        $(this).addClass($(this).attr('outclass'));
    });

    // 슬라이드 배너
    $.fn.zBanner = function(options) {

    	var opts = $.extend({}, $.fn.zBanner.defaults, options);
    	var target = $(this);
    	var autoPlay = opts.autoPlay;

    	var timer = null;
    	var zBannerBoxWidth = target.children('li').find('img').width();
    	var zBannerBoxHeight = target.children('li').find('img').height();
    	var ctBanner = 1;
    	
    	target.css({'height':zBannerBoxHeight, 'width':zBannerBoxWidth, 'overflow':'hidden'});
    	
    	target.children('li').css({'position':'absolute', 'left': '-9999em'});
		target.children('li:first').css({'left':0, 'z-index':100});
		target.children('li:nth-child(2)').css({'left':0});

		target.parent().append("<ul class='slideBannerController'></ul>");

		var addNum = 0;
		target.children('li').each(function() {
			$(this).attr({"bannerNum":++addNum});
			if (addNum == 1) {
				target.parent().find('ul[class="slideBannerController"]').append('<li><span class="bar on" spanNum='+addNum+'></span></li>');
			} else {
				target.parent().find('ul[class="slideBannerController"]').append('<li><span class="bar" spanNum='+addNum+'></span></li>');
			}
		})

		target.parent().find('ul[class="slideBannerController"] > li > span').mouseover(function() {
			clearInterval(timer);
			var targetNum = $(this).attr('spanNum');
			if(targetNum != ctBanner) {
				processBanner(targetNum);
			}
		}).mouseout(function() {
			if (autoPlay == true) {
				initPlay();
			}
		});

		target.mouseover(function() {
			clearInterval(timer);
		}).mouseout(function() {
			if (autoPlay == true) {
				initPlay();
			}
		});
		
		initPlay();

		function initPlay() {
			if (autoPlay == true) {
				$(function() {
	    			timer = setInterval(function () {
	        			processBanner('plus');
					}, opts.speed)
				});	
			}
		}

		function processBanner(e) {
			var easingTime = (opts.mode == 'fade') ? opts.easingTime : 0;
			target.children('li').stop().animate({'opacity':0}, easingTime, opts.easing, function(){$(this).css({'left':'-9999em'})});
			//target.children('li').css({'display':'none'}).animate({'opacity':0}, easingTime, opts.easing);
			if (e == 'plus') {
				if (ctBanner++ >= addNum ) {
					ctBanner = 1;
				}
				//target.children('li[bannerNum='+ctBanner+']').css({'left':0});
				target.children('li[bannerNum='+ctBanner+']').stop().css({'left':0}).animate({'opacity':1}, easingTime, opts.easing);
			} else {
				target.children('li[bannerNum='+e+']').stop().css({'left':0}).animate({'opacity':1}, easingTime, opts.easing);
				ctBanner = parseInt(e);
			}
			
			// 하단 paging
			target.parent().find('ul[class="slideBannerController"] > li > span').removeClass('on').addClass('off');
			target.parent().find('ul[class="slideBannerController"] > li > span[spanNum='+ctBanner+']').removeClass('off').addClass('on');
		}
	};

	// 슬라이드 배너 초기값
	$.fn.zBanner.defaults = {
		speed : 3000,
		easingTime : 500,
		mode : 'unfade',
		autoPlay : true,
		easing : 'swing'
	}
});

function setCookie(n,v,e) {
	var todayDate=new Date();
	todayDate.setDate(todayDate.getDate()+e);
	document.cookie=n+"="+escape( v )+";path=/; expires="+todayDate.toGMTString()+";"
}

function getCookie(n) {
	var nameOfCookie=n+"=";
	var x=0;
	while(x<=document.cookie.length) {
		var y=(x+nameOfCookie.length);
		if(document.cookie.substring(x,y)==nameOfCookie) {
			if((endOfCookie=document.cookie.indexOf(";",y))==-1) endOfCookie=document.cookie.length;
			return unescape( document.cookie.substring(y,endOfCookie));
		}
		x=document.cookie.indexOf(" ",x)+1;
		if(x==0) break;
	}
	return false;
}