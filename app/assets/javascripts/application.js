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
    var val = $(this).prevAll(".rails-id").val();
    if ($(this).is(':checked')) {
      $.ajax({
        type: "POST",
        url: "/stars",
        data: {lesson_id: this.id}
     });
    } else {
      $.ajax({
        type: "DELETE",
        url: "/stars/1",
        data: {lesson_id: this.id}
     });
    }
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
  // href: "https://isotropic.org/papers/chicken.pdf",
  // content: this.id,
  parent: "body"
  // data: {document_id: this.id}
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
