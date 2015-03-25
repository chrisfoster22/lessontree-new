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
