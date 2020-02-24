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
//= stub 'video_call_core'
//= require bootstrap-sprockets

function selfShow(caller){
  $(caller).addClass("show");
}
function selfHide(caller){
  $(caller).removeClass("show");
}
function updateStateNotify(idNotify) {
    $.ajax({
        url: "/notices/" + idNotify,
        type: 'PATCH',
        dataType: 'script',
        success: function(data) {}
    })
}

function removeElement(caller) {
    $(caller).remove();
}

function closeNewNotify(caller) {
    $(caller).parent().parent().remove();
}

function test(caller) {
    console.log(caller);
}

function dropdown(idTag) {
    $(idTag).toggleClass("show");
    if (idTag == "#show-notifyy") {
        $('.notify-wrapper p').html("");
    }
}

function settingDropdown(postId) {
    $("#setting-post-dropdown_" + postId).toggleClass("show");
}

function settingDropdownComment(postId) {
    $("#setting-comment-dropdown_" + postId).toggleClass("show")
}

function showComments(caller) {
    $(caller).parent().parent().siblings().toggle(".show");
    $(caller).toggleClass("active");
}

function cancerBtn(idPost) {
    $("#edit_post_" + idPost).remove();
    $("#post_" + idPost + " .card-text ").removeClass("hidden");
}

function focusInput(caller) {
    $(caller).parent().parent().siblings().css("z-index", 6);
    $(caller).parent().parent().css("z-index", 7);
};

function clickTab(caller) {
    $(caller).css('z-index', 7);
    $(caller).siblings().css("z-index", 6);
};

function draggableVideo(caller) {
    $(caller).draggable();
};

function draggbleTab(caller) {
    $(caller).draggable({
        start: function(event, ui) {
            $(caller).css("z-index", 7);
            $(caller).siblings().css("z-index", 6);

        },
        cursor: "move"
    });
};

function hideChatTab(caller) {
    $(caller).parent().parent().addClass("hidden");
    console.log("#user-" + $(caller).parent().parent().attr("data-icon"));
    $("#user-" + $(caller).parent().parent().attr("data-icon")).addClass("show");
};


function closeChatTab(caller) {
    $(caller).parent().parent().remove();
    $("#user-" + $(caller).parent().parent().attr("data-icon")).remove();

};

//  $(document).on('click', '.icon-chat', function(event) {
//      var room_id = $(this).attr('data-room');
//      $(".room_" + room_id).removeClass("hidden");
//      $(this).removeClass("show");
//      $(this).parent().find('p').removeClass('show');
//  });
function showChatTabFromIcon(caller) {
    var room_id = $(caller).attr('data-room');
    $(".room_" + room_id).removeClass("hidden");
    $(caller).removeClass("show");
    $(caller).parent().find('p').removeClass('show');
}

//  $(document).on('click', '.signal-video-call-content .btn-danger', function(event) {

//      $(this).parent().parent().parent().remove();
//  })

function closeSelf(caller) {
    $(caller).parent().parent().parent().remove();
}

function cancerBtnCmt(idCmt) {
    $("#edit_comment_" + idCmt).remove();
    $("#cmt_" + idCmt + " .content").removeClass("hidden");
}

function toggleHeaderChat() {
    $(".rooms-list").toggle();
};

//$(document).on('turbolinks:load', function() {
//  $(".header-chats").click(function() {
//      $(".rooms-list").toggle();
//  });


//$(".hide-chat-tab").click(function(event) {
//    $(this).parent().parent().addClass("hidden");
//    console.log("#user-" + $(this).parent().parent().attr("data-icon"));
//    $("#user-" + $(this).parent().parent().attr("data-icon")).addClass("show");
//});

function clickOutSidePost(event, caller) {
    if (event.target.matches('.card-show-bg')) {
        $(caller).remove();
    }
}

function showPostBtn(caller) {
    if ($("#new_post_textarea").val().trim().length > 0) {
        $(".new_post input[type='submit']").addClass("show");
    } else {
        $(".new_post input[type='submit']").removeClass("show");
    }
};

//});
function clickOutSide(event, caller) {
    if (!event.target.matches('.fa-angle-down') && !event.target.matches('.fa-users') && !event.target.matches('.fa-commments') && (!event.target.matches('.fa-bell'))) {
        var dropdowns = document.getElementsByClassName("dropdown-content");
        var i;
        for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) {
                openDropdown.classList.remove('show');
            }
        }
    }
    if (event.target.matches('.seen')) {
        $('.new-notify').remove();
    }
}
