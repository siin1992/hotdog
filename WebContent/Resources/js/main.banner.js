// 초기값 설정
var imgHeight = 400;
var controllMode = null;
var ctBanner = 1;
var ctBannerAdd = 0;
var numBanner = 0;
var timer = null;
var playChk = true;
var autoPlayTime = 3000;
var easingTime = 1000;

$(document).ready(function() {
	initVisualBanner();	
	moveCar();

	// banner E
	$('.mBannerE .tapItems a').click(function() {
		var eTarget = $(this).attr("tapName");
		var eTarget_num = eTarget.split('_')[1];
		var addNum = 0;
		$('.mBannerE .tapItems img').each(function() {
			$(this).attr('src', $(this).attr('src').replace('_on.gif', '_off.gif'));
		})
		$(this).children('img').attr('src', $(this).children('img').attr('src').replace('_off.gif', '_on.gif'));
		$('.mBannerE .tapContents li[class^="content_"]').hide();
		$('.mBannerE .tapContents li[class="content_'+eTarget_num+'"]').show();
	})

	// banner E > slide banner
	
	$('.mBannerERight .slideBanner').zBanner( {
		speed : 5000,
		easingTime : 300,
		mode:'fade',
		autoPlay : true
	});

	// banner F > slide banner A
	$('.mBannerF .slideBannerA').zBanner( {
		easingTime : 300,
		mode:'fade',
		autoPlay : false
	});

	// banner F > slide banner B
	$('.mBannerF .slideBannerB').zBanner( {
		easingTime : 300,
		mode:'fade',
		autoPlay : false
	});

	$('.mBannerF .bC li a').mouseover(function() {
		$(this).find('span[class="upImg"]').stop().animate({'top':0}, 500, 'easeOutExpo');
	}).mouseout(function() {
		$(this).find('span[class="upImg"]').stop().animate({'top':'170px'}, 300, 'easeOutExpo');
	})

	// banner H > bA > slide banner
	$('.mBannerH .bA .slideBanner').zBanner( {
		easingTime : 300,
		mode:'fade',
		autoPlay : false
	});

	// banner H > bB > slide banner
	$('.mBannerH .bB .slideBanner').zBanner( {
		easingTime : 300,
		mode:'fade',
		autoPlay : false
	});

	// bannerG
	$('.mBannerG').find('.rollBannerTap > li > a').mouseover(function() {
		$(this).parent().parent().find('a').removeClass('on');
		$(this).addClass('on');
		var eTarget = $(this).attr('class').substr(1,1);
		$(this).parent().parent().parent().find('.rollBannerScreen > li').css({'display':'none'});
		$(this).parent().parent().parent().find('.rollBannerScreen > li[class=b'+eTarget+']').css({'display':'block'});

		//$(this).parent().parent().find('a').css({'background-position-x':'0px'});
		/*
		$(this).parent().parent().find('a').each(function() {
			alert("ok");
		});
		*/
		/*
		$(this).parent().parent().find('a').each(function() {
			var tempY = $(this).css('background-position').split(' ')[1];
			$(this).css({'background-position': '0px '+tempY+''});		
		});
		var bgPositionY = $(this).css('background-position').split(' ')[1];
		var eTarget = $(this).attr('class').substr(1,1);
	
		$(this).css({'background-position': '-170px '+bgPositionY+''});
		$(this).parent().parent().parent().find('.rollBannerScreen > li').css({'display':'none'});
		$(this).parent().parent().parent().find('.rollBannerScreen > li[class=b'+eTarget+']').css({'display':'block'});
		*/

	}).mouseout(function() {
		//var bgPositionY = $(this).css('backgroundPosition').split(' ')[1];
		//$(this).css({'background-position': '0px '+bgPositionY+''});
	});

	$('.mBannerG').find('.tapItems > a').mouseover(function() {
		$(this).parent().parent().find('a').removeClass('on');
		$(this).addClass('on');
		var eTarget = $(this).attr('class').substr(4,1);
		$(this).parent().parent().parent().find('.tapContents > ul > li').css({'display':'none'});
		$(this).parent().parent().parent().find('.tapContents > ul > li[class=content_'+eTarget+']').css({'display':'block'});

	});

	$('.mBannerI').find('.tapItems > a').mouseover(function() {
		$(this).parent().parent().find('a').removeClass('on');
		$(this).addClass('on');
		var eTarget = $(this).attr('class').substr(4,1);
		$(this).parent().parent().find('.tapContents > ul > li').css({'display':'none'});
		$(this).parent().parent().find('.tapContents > ul > li[class=content_'+eTarget+']').css({'display':'block'});

	});

});

function initVisualBanner() {
	// 배너의 갯수
	numBanner = $('#visualBanner li').size();

	// 배너 초기화
	var addNum = 0;
	$('#visualBanner li').each(function() {
		addNum++;
		var bgImg = $(this).attr('bgImg');
		$(this).css({'background':'url("' + bgImg + '")'});
		$(this).css({'top':'-9999px'});
		$(this).attr({'bannerNum':''+addNum+''});

		// 하단 버튼 추가
		if (addNum == 1) {
			$('#visualBannerCount').append('<li><span class="bar on" spanNum='+addNum+'></span></li>');
		} else {
			$('#visualBannerCount').append('<li><span class="bar" spanNum='+addNum+'></span></li>');
		}
		
	})
	// 하단 버튼 중앙 위치
	var pdLeft = (1000 - ((numBanner * 16)+10))/2;
	$('#visualBannerCount').css({'padding-left':''+pdLeft+'px'});

	// 하단 버튼 기능 추가
	$('#visualBannerCount span').click(function() {
		var targetNum = $(this).attr('spanNum');
		if(targetNum != ctBanner) {
			processBanner(targetNum);
		}
	});

	// 1번 배너 노출
	$('#visualBanner li[bannerNum=1]').css({'top':'0'});

	// 버튼 콘트롤
	$('#visualBannerController a').click(function() {
		controllMode = $(this).parent().attr("class");
		switchController(controllMode);
	});

	$('#visual').mouseover(function() {
		clearInterval(timer);
	});
	$('#visual').mouseout(function() {
		if (playChk == true) {
			initPlay();	
		}
	});
	initPlay();
}

function initPlay() {
	$(function() {
    	timer = setInterval(function () {
        	processBanner("plus");
		}, autoPlayTime)
	});
}

function switchController(e) {
	switch(e) {
		case 'up' :
			processBanner("minus");
			break;
		case 'down' :
			processBanner("plus");
			break;
		case 'stop' :
			$('#visualBannerController li[class=stop]').hide();
			$('#visualBannerController li[class=play]').show();
			clearInterval(timer);
			playChk = false;
			break;
		case 'play' :
			$('#visualBannerController li[class=stop]').show();
			$('#visualBannerController li[class=play]').hide();
			clearInterval(timer);
			playChk = true;
			break;
		default :
			break;
	}
}

function processBanner(e) {
	if (e == 'plus') {
		if(ctBanner >= numBanner) {
			ctBannerAdd = 1;
		} else {
			ctBannerAdd = ctBanner + 1;
		}
		$('#visualBanner li[bannerNum='+ctBannerAdd+']').css({'top':'-400px'});
		$('#visualBanner li[bannerNum='+ctBanner+']').stop().animate({'top':'400px'}, easingTime, 'easeOutExpo');
		$('#visualBanner li[bannerNum='+ctBannerAdd+']').stop().animate({'top':'0'}, easingTime, 'easeOutExpo');
		
		if (ctBanner++ >= numBanner) {
			ctBanner = 1;
		}
	} else if (e == 'minus') {
		if(ctBanner <= 1) {
			ctBannerAdd = numBanner;
		} else {
			ctBannerAdd = ctBanner - 1;
		}
		$('#visualBanner li[bannerNum='+ctBannerAdd+']').css({'top':'400px'});
		$('#visualBanner li[bannerNum='+ctBanner+']').stop().animate({'top':'-400px'}, easingTime, 'easeOutExpo');
		$('#visualBanner li[bannerNum='+ctBannerAdd+']').stop().animate({'top':'0'}, easingTime, 'easeOutExpo');

		if (ctBanner-- <= 1) {
			ctBanner = numBanner;
		}
	} else {
		$('#visualBanner li[bannerNum='+e+']').css({'top':'-400px'});
		$('#visualBanner li[bannerNum='+ctBanner+']').stop().animate({'top':'400px'}, easingTime, 'easeOutExpo');
		$('#visualBanner li[bannerNum='+e+']').stop().animate({'top':'0'}, easingTime, 'easeOutExpo');
		ctBanner = parseInt(e);
	}

	// 하단 paging
	$('#visualBannerCount li span').each(function() {
		$(this).addClass("off");
	});
	$('#visualBannerCount li span[spanNum='+ctBanner+']').removeClass("off").addClass("on");
}

function moveCar() {
	var documentHeight, windowHeight, creativeShipping, creativeShippingBottom;
	documentHeight = $('.contentInner').height() + 200 + 300;
	windowHeight = $(window).height();
	creativeShipping = $('.car');
	creativeShippingBottom = creativeShipping.offset().top + creativeShipping.height();

	creativeShipping.css({'backgroundPosition': -106});
	if (documentHeight - creativeShippingBottom > windowHeight) {
		$(window).scroll(function(event) {
			$this = $(this);
			percentScrolled = $this.scrollTop()/(creativeShippingBottom-100);
			creativeShipping.css({'backgroundPosition': (percentScrolled*creativeShipping.width())-106})
		})
	}
}


/*
var documentHeight,
		windowHeight,
		creativeShipping,
		creativeShippingBottom;

	// Do not use $(document).height();, chrome returns wrong value
	//documentHeight = $(document).height();

	documentHeight = $('.creative').height() + 200 + 320; // ASOS header height ~200px... ASOS footer height ~320px
	windowHeight = $(window).height();
	creativeShipping = $('.creative-shipping');
	creativeShippingBottom = creativeShipping.offset().top + creativeShipping.height();

	// Init: hide plane on load
	creativeShipping.css({'backgroundPosition': -82});	

	// If window is short enough to be able to scroll PAST the bottom of .creative-shipping
	if (documentHeight - creativeShippingBottom > windowHeight) {

		$(window).scroll(function(event) {
			$this = $(this);

			// proportion measured from top of document to bottom of .creative-shipping 
			percentScrolled = $this.scrollTop()/creativeShippingBottom;

			// move plane according to scrollTop position 
			creativeShipping.css({'backgroundPosition': (percentScrolled*creativeShipping.width()) - 82 });

			// once plane has flown passed, remove it from background image
			// if (percentScrolled > 1) {
			// 	creativeShipping.css({'background': 'none'});
			// }
		});
	}
*/