$(document).ready(function() {
	ZmodalClose();
	initQuickPad();
	initMenu();
	initViewMore();
	initSiteMap();
});

/*
function initBannerLeft() {
	var $tLeftBanner = $('.mBannerLeft');
	$tLeftBanner.hide().addClass("fixed").fadeIn("fast");
	$(window).scroll(function() {
		if ($tLeftBanner.offset().top >= ($(document).height() - 600)) {
			
			//alert("remove fixed");
			$tLeftBanner.removeClass('fixed');
		} else if ($tLeftBanner + '(not(".fixed")') {
			$tLeftBanner.addClass('fixed');
			$('.sayTxt').append($tLeftBanner.offset().top+':' );
			$('.sayTxt').append($(document).height() - 600+' / ');
		}
	});
}
*/

function initViewMore() {
	$('.pListGoods .more .size, .pListGoods .sizeInfo .sizeInfoDetail').mouseover(function() {
		$(this).parent().parent().find('.sizeInfoDetail').show();
	}).mouseout(function() {
		$('.pListGoods .sizeInfo .sizeInfoDetail').hide();
	})
	/*
	$('.pListGoods .more .size').mouseover(function() {
		$(this).parent().parent().find('.sizeInfoDetail').show();
	}).mouseout(function() {
		var $eChk = false;
		var $eTarget = $(this).parent().parent().find('.sizeInfoDetail');
		$eTarget.mouseover(function() {
			$
			$(this).show();
		}).mouseout(function() {
			$(this).hide();
		});
		// alert($mouseOverChk);
	});
	*/

}
function initMenu() {
	var $alertTxt = $('#header .sayTxt');
	var $eTarget = $('#menu_gnb a.hasSub');
	var $menuBox = $('#categoryBox');
	var $rollBox = $('#categoryBox .categoryBoxInner .headerInner .screen ul.box');
	var $cateMenu = $('#categoryBox .categoryBoxInner .headerInner .screen .box .boxCategory');	// 카테고리 메뉴(2depth)
	var $flagA = false; // 상단 메뉴
	var $flagB = false; // 하단 메뉴 보이는 부분
	var $ctMenu = 0;	// 선택된 메뉴

	$eTarget.mouseenter(function() {
		$ctMenu = parseInt($(this).attr('class').substr(1, 1));
		$flagA = true;
		chkCategoryBox();
	}).mouseleave(function() {
		$flagA = false;
		chkCategoryBox();
	});

	$menuBox.mouseenter(function() {
		$flagB = true;
		chkCategoryBox();
	}).mouseleave(function() {
		$flagB = false;
		chkCategoryBox();
	});

	function chkCategoryBox() {
		if ($flagA == true && $flagB == true) {
			// 하단이 열린 경우
			//rollMenu()
		} else if ($flagA == true && $flagB == false) {
			// 하단 안 열린 경우
			$cateMenu.find('ul[class=depth_2]').hide();
			$cateMenu.find('ul[class=depth_1] > li').css({'background-position': '150px 4px'});
			$cateMenu.find('ul[class=depth_1] > li > a').css({'color' : '#666'});
			effCategoryBox('on');
		} else if ($flagA == false && $flagB == true) {
			// 하단이 열린 경우
			effCategoryBox('on');
		} else if ($flagA == false && $flagB == false) {
			// 완전이 빠진 경우
			effCategoryBox('off');
		}
	}

	function effCategoryBox(mode) {
		var $mode = mode;
		if ($mode == 'on') {
			$menuBox.show();
			$menuBox.find('.categoryBoxInner').stop().animate({'top':'0'}, 300, 'easeOutExpo', rollBox());

		} else {
			$menuBox.find('.categoryBoxInner').stop().animate({'top':'-400px'}, 300, 'easeOutExpo', function() {$menuBox.hide()});
		}
	}

	function rollBox() {
		$rollBox.stop().animate({'left': ($ctMenu-3) * -1000+'px'}, 400, 'easeOutExpo');
		//$('.sayTxt').append(($ctMenu-3)*1000+'px');
	}
	
	// 2차 메뉴 hide 뢰 시작
	$cateMenu.find('ul[class=depth_2]').hide();

	$cateMenu.find('ul[class=depth_1] > li').mouseover(function() {
		var tClass = $(this).find('a:first-child').attr("class");
		$(this).parent().find('li').css({'background-position': '150px 4px'});
		$(this).parent().find('a').css({'color':'#666'});
		$(this).css({'background-position': '0 4px'});
		$(this).find('a:first').css({'color':'#fff'});
		$cateMenu.find('ul[class=depth_2]').hide();
		$cateMenu.find('ul[custom='+tClass+']').show();
	}).mouseout(function() {
		//$(this).css({'background-position': '150px 4px'});
		

	});
}

function initSiteMap() {
	$('#viewSitemap .btnCloseSitemap').click(function() {
		var $eTarget = $('#viewSitemap');
		var $eTargetH = $('#viewSitemap').height();
		$eTarget.stop().delay(100).animate({'top': $eTargetH * -1}, 700, 'easeOutExpo');
	});
	$('#menu_util .btnOpenSitemap').click(function() {
		var $eTarget = $('#viewSitemap');
		var $eTargetH = $('#viewSitemap').height();
		$eTarget.stop().delay(100).animate({'top': 0}, 700, 'easeOutExpo');
	});
}

function ZmodalClose() {
	var maskHeight = $(document).height(); 
	var maskWidth = $(window).width();
	// alert(maskHeight);
	$('.modalBg').css({'width':maskWidth, 'height':maskHeight});
	$('.modal').find('.close').click(function() {
		$('.modalBg').hide();
		$('.modal').hide();
	});

	$('.modalGoods').find('.close').click(function() {
		$('.modalBg').hide();
		$('.modalGoods').hide();
	});
}

function initQuickPad() {
	var quickPadType = ($.cookie('quickpad') == 'small') ? 'small' : 'big';
	quickPadTgl(quickPadType);

	$("#quickpad .btn_close, #quickpad .btn_open").click(function() {
		quickPadType=(quickPadType == 'small') ? 'big' : 'small';
		quickPadTgl(quickPadType);
	});

	$('.btn_top').click(function(){
		 $('html, body').animate({scrollTop:0}); return false
	});
}

function quickPadTgl(e) {
	if(e == 'big') {
		$('.quickpad_big').hide();
		$('.quickpad_sml').show();
		$.cookie('quickpad', 'big', { path: '/', expires: 1 });
		$('body').css({"margin-right":"40px"});
		$('#header .headerInner').css({"width":"1040px"});
		$('#menu_util').css({"padding-right":"40px"});
		$('.btn_top').css({"width":"40px"});
		// $('#visualBanner li h4').css({"width":"1040px"});
	} else {

		$('.quickpad_big').show();
		$('.quickpad_sml').hide();
		$.cookie('quickpad', 'small', { path: '/', expires: 1 });
		$('body').css({"margin-right":"120px"});
		$('#header .headerInner').css({"width":"1120px"});
		$('#menu_util').css({"padding-right":"120px"});
		$('.btn_top').css({"width":"120px"});
		// $('#visualBanner li h4').css({"width":"1120px"});
	}
}

$(function(){
	$('.boardList .trigger').click(function() {
		$(this).closest('tr').next('tr').toggle();
	});

	// 페이지내 이동
	$('.goodDivTit a[class^=t]').click(function() {
		var $eTarget = $(this).attr('class');
		if($eTarget.indexOf('on') < 0) {
			// go go
			var $goPosition = ($eTarget.substr(1, 1) - 1);
			$('body').scrollTo($('div[class=goodDivTit]:eq('+$goPosition+')').offset().top-210, 800, {easing:'easeOutQuint'});
		}
	});
});









