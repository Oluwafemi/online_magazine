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
//= require jquery_ujs
//= require ckeditor/override
//= require ckeditor/init
//= require_tree ./ckeditor
//= require turbolinks
//= require_tree .

function imgUpdate(arg) {
    var loaded = false;
    var src = arg.src;

    $(arg).on("load", function() {
        loaded = true;
        $(".spinner").hide();
    });

    setTimeout(function(){
        if (!loaded) {
            $(".spinner").show();
        }
    }, 250);

    arg.src = "";
    arg.src = src;
}

/*$(document).ready(function() {
		var target = $('.aws-image');
		target.each(function(i) {
		imgUpdate(target[i]);
		//var spinner = new Spinner(opts).spin(target[i]);
	});
});*/
