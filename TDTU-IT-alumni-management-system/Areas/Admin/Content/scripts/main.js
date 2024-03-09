$(document).ready(function() {

	$('.btn-toggle-fullwidth').on('click', function() {
		if(!$('body').hasClass('layout-fullwidth')) {
			$('body').addClass('layout-fullwidth');

		} else {
			$('body').removeClass('layout-fullwidth');
			$('body').removeClass('layout-default'); // also remove default behaviour if set
		}

		$(this).find('.lnr').toggleClass('lnr-arrow-left-circle lnr-arrow-right-circle');

		if($(window).innerWidth() < 1025) {
			if(!$('body').hasClass('offcanvas-active')) {
				$('body').addClass('offcanvas-active');
			} else {
				$('body').removeClass('offcanvas-active');
			}
		}
	});

	$('.sidebar a[data-toggle="collapse"]').on('click', function () {
		$(this).toggleClass('active', !$(this).hasClass('collapsed'));
	});
	//$(document).ready(function () {
	//	if ($('.sidebar-scroll').length) {
	//		$('.sidebar-scroll').slimScroll({
	//			height: '95%',
	//			wheelStep: 2,
	//		});
	//	}
	//});
	document.addEventListener("DOMContentLoaded", function () {
		// Kiểm tra xem có phần tử có class là "sidebar-scroll" không
		var sidebarScroll = document.querySelector('.sidebar-scroll');

		if (sidebarScroll) {
			// Tạo một instance mới của SlimScroll
			new SlimScroll(sidebarScroll, {
				height: '95%',
				wheelStep: 2
			});
		}
	});
});



