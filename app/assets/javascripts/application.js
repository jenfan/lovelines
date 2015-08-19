// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require fancybox
//= require jquery_ujs
//= require turbolinks
//= require_tree .


// $(document).on("page:fetch", stopSpinner);
$(document).on("ready page:load", function(){ 
	$(document).ready(function() {
	  $("a.fancybox").fancybox();
	  $("a.next, a.prev, a.close").html('');
	});
	$('div.lazy_vimeo').each(function(){
			var id = $(this).data('vimeo-id');
			// iframe = $('<iframe width="100%" height="100%" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen />');
			// iframe.attr('src', "//player.vimeo.com/video/" + id + "?portrait=0&amp;&amp;title=0&amp;byline=0&amp;badge=0&amp;color=ffffff");
			var div = $(this);
			$.ajax({
		        type:'GET',
		        url: 'http://vimeo.com/api/v2/video/' + id + '.json',
		        jsonp: 'callback',
		        dataType: 'jsonp',
		        success: function(data){
		            var thumbnail_src = data[0].thumbnail_large;
		            // $('#thumb_wrapper').append('<img src="' + thumbnail_src + '"/>');
		            // console.log($(this));
		            div.replaceWith('<img src="' + thumbnail_src + '"/>');
		            // $(this).replaceWith(iframe);

		        }
		    });
		});
});