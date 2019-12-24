// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets

function dropdown(idTag) {
    $(idTag).toggleClass("show");
}

function settingDropdown(postId) {
    $("#setting-post-dropdown_" + postId).toggleClass("show");
}

function settingDropdownComment(postId) {
    $("#setting-comment-dropdown_" + postId).toggleClass("show")
}

function showComments(postId) {
    $("#post_" + postId + " .comments-wrap").toggle(".show");
    $(this).toggleClass("active");
}
$('document').ready(function() {

    $("#new_post_textarea").keyup( function(){
      console.log($("#new_post_textarea").val().trim().length);
      if($("#new_post_textarea").val().trim().length > 0){
        $(".new_post input[type='submit']").addClass("show");
      }else{
        $(".new_post input[type='submit']").removeClass("show");
      }
    });

});
window.onclick = function(event) {
    if (!event.target.matches('.fa-angle-down') && !event.target.matches('.setting-post-btn')) {
        var dropdowns = document.getElementsByClassName("dropdown-content");
        var i;
        for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) {
                openDropdown.classList.remove('show');
            }
        }
    }
}
