// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
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
//= require ckeditor/init
//= require_tree .

$(function() {
  $('.star-box').on("click", function() {
      $.ajax({
        type: "POST",
        url: "/stars",
        data: {lesson_id: this.id}
     });
     // else {
    //   $.ajax({
    //     type: "DELETE",
    //     url: "/stars/1",
    //     data: {lesson_id: this.id}
    //  });
    // }
  });
});

$(function() {
  $('#inline-search-field').on("click", function() {
  var WhereToMove = $("#steady_scroll").position().top;
    $("html,body").animate({scrollTop: WhereToMove }, 300);
  });
});

$('.fancybox').fancybox({
  type: 'iframe',
  parent: "body"
})

$('#fancybox').fancybox({
  autoSize    : false,
  width: '480px',
  height: '300px',
  type: 'iframe',
  parent: "body"
})

$(document).ready(function () {
    $('.accordion-tabs').each(function(index) {
      $(this).children('li').first().children('a').addClass('is-active').next().addClass('is-open').show();
    });

    $('.accordion-tabs').on('click', 'li > a', function(event) {
      if (!$(this).hasClass('is-active')) {
        event.preventDefault();
        var accordionTabs = $(this).closest('.accordion-tabs');
        accordionTabs.find('.is-open').removeClass('is-open').hide();

        $(this).next().toggleClass('is-open').toggle();
        accordionTabs.find('.is-active').removeClass('is-active');
        $(this).addClass('is-active');
      } else {
        event.preventDefault();
      }
    });
  });

  $(document).ready(function() {
  var expanderTrigger = document.getElementById("js-expander-trigger");
  var expanderContent = document.getElementById("js-expander-content");

  $('#js-expander-trigger').click(function(){
    $(this).toggleClass("expander-hidden");
  });
});


$(document).ready(function(){
  $(".dropdown-button").click(function() {
    $(".dropdown-menu").toggleClass("show-menu");
    $(".dropdown-menu > li").click(function(){
      $(".dropdown-menu").removeClass("show-menu");
    });
    $(".dropdown-menu.dropdown-select > li").click(function() {
      $(".dropdown-button").html($(this).html());
    });
  });
});


$(document).ready(function(){
  $(".dropdown-button") .click(function() {
    $(".dropdown-menu").toggleClass("show-menu");
    $(".dropdown-menu > li") .click(function(){
      $(".dropdown-menu").removeClass("show-menu");
    });
    $(".dropdown-menu.dropdown-select > li") .click(function() {
      $(".dropdown-button").html($(this).html());
    });
  });
});

var  mn = $(".main-nav");
    mns = "main-nav-scrolled";
    hdr = $('header').height();

$(window).scroll(function() {
  if( $(this).scrollTop() > hdr ) {
    mn.addClass(mns);
  } else {
    mn.removeClass(mns);
  }
});

CKEDITOR.on('instanceReady', function (e) {
  $('.cke_top').css('background','#b6ded4');
});

CKEDITOR.on('instanceReady', function (e) {
  $('.cke_bottom').css('background','#b6ded4');
});

$(function() {


    $('.star-ranking').click(function () {
      var clicked = $(this);
      $('.icon-star').addClass('liked');
      var ranking = $('.ranking');
      ranking.text(Number(ranking.text()) + 1);
      $.ajax({
        type: "POST",
        url: "/stars",
        data: { lesson_id: this.id }
      })//.done(function () {
      //   var parent = clicked.closest('ul');
      //   $('.icon-star').addClass('liked');
      //   var ranking = $('.ranking', parent);
      //   ranking.text(Number(ranking.text()) + 1);
      // });
    });

  });
