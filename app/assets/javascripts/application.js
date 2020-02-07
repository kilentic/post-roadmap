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
//= require jquery-ui
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

function cancerBtn(idPost) {
    $("#edit_post_" + idPost).remove();
    $("#post_" + idPost + " .card-text ").removeClass("hidden");
}
$(document).on('focus', '.chat-tab input', function(event) {
    $(this).parent().parent().siblings().css("z-index", 6);
    $(this).parent().parent().css("z-index", 7);
});
$(document).on('click', '.chat-tab', function(event) {
    $(this).css('z-index', 7);
    $(this).siblings().css("z-index", 6);
});
$(document).on('mouseover', '.chat-tab', function(event) {
    $(this).draggable({
        start: function(event, ui) {
            $(this).css("z-index", 7);
            $(this).siblings().css("z-index", 6);

        },
        cursor: "move"
    });
});
$(document).on('click', '.hide-chat-tab', (function(event) {
    $(this).parent().parent().addClass("hidden");
    console.log("#user-" + $(this).parent().parent().attr("data-icon"));
    $("#user-" + $(this).parent().parent().attr("data-icon")).addClass("show");
}));


$(document).on('click', '.close-chat-tab', function(event) {
    $(this).parent().parent().remove();
    $("#user-" + $(this).parent().parent().attr("data-icon")).remove();

});

$(document).on('click', '.icon-chat', function(event) {
    var room_id = $(this).attr('data-room');
    $(".room_" + room_id).removeClass("hidden");
    $(this).removeClass("show");
    $(this).parent().find('p').removeClass('show');
});

function cancerBtnCmt(idCmt) {
    $("#edit_comment_" + idCmt).remove();
    $("#cmt_" + idCmt + " .content").removeClass("hidden");
}

$(document).on('turbolinks:load', function() {
    $(".header-chats").click(function() {
        $(".rooms-list").toggle();
    });


    //$(".hide-chat-tab").click(function(event) {
    //    $(this).parent().parent().addClass("hidden");
    //    console.log("#user-" + $(this).parent().parent().attr("data-icon"));
    //    $("#user-" + $(this).parent().parent().attr("data-icon")).addClass("show");
    //});


    $("#new_post_textarea").keyup(function() {
        if ($("#new_post_textarea").val().trim().length > 0) {
            $(".new_post input[type='submit']").addClass("show");
        } else {
            $(".new_post input[type='submit']").removeClass("show");
        }
    });

});
window.onclick = function(event) {
    if (!event.target.matches('.fa-angle-down') && !event.target.matches('.fa-users') && !event.target.matches('.fa-commments')) {
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
