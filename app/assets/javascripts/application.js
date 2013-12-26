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
//= require turbolinks
//= require_tree .

var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-27949674-1']);
_gaq.push(['_trackPageview']);

(function() {
  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();


$(document).ready(function(){
  //alert("ready");
  $(".left-nav").click(function(){
    //alert("other-side");
    $(".intro").css("position","absolute");
    $(".other-side").fadeIn();
    $("body").css("overflow","hidden");
    $( ".main-side" ).animate({
      left: "3000px"
    }, 1000 );
  });

  $(".back").click(function(){
    $("body").css("overflow-y","auto");
    $(".main-side").show();
    $( ".main-side" ).animate({
      left: "0px"
    }, 500, function(){
      $(".intro").css("position","fixed");
    });
    $(".other-side").fadeOut();

    /* $( ".main-side" ).animate({
      left: "0px"
    }, {
      duration: 500,
      specialEasing: {
        width: "easeOutBounce"
      },
      complete: function() {
        $(".intro").css("position","fixed");
      }
    }); */

  });

  $(window).scroll(function(){
    offset = $(window).scrollTop();

    if( offset > 10 ) {
      $(".left-nav").css("left", "-100px").fadeOut().find("p").hide();
      $(".right-nav").css("right", "-100px").fadeOut();
    }
    else {
      $(".left-nav").fadeIn(50).css("left", "-40px");
      $(".right-nav").fadeIn(50).css("right", "-40px");
    }

    if( offset > 220 ) {
      $(".intro .container").css({"top":"-160px", "opacity": 0 });
    }
    else {
      $(".intro .container").css({"top":"0px", "opacity": 1 });
    }
  });

});