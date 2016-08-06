// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bar.min
//= require bsj.min
//= require turbolinks
//= require_tree .
var has_loaded = false;
var ready = function() {
	setTimeout(function(){
		$(".alert").fadeOut();
	}, 3000);
}

function turbolinksLoad() {
	$('#rating').barrating({
		theme: 'fontawesome-stars',
		hoverState: false
	});
	$('#movie_rating').barrating({
		theme: 'fontawesome-stars'
	});
}

if(!has_loaded) {
	$(document).ready(ready);
}

$(document).bind('turbolinks:visit', ready);
$(document).bind('turbolinks:load', turbolinksLoad);

function imgerror(image) {
	image.onerror = "";
	image.src = "http://placehold.it/334x500";
	return true;
}