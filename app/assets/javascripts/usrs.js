function showUploadAvatarBtn(caller) {
    $(caller).find("button").addClass("show");
}

function hideUploadAvatarBtn(caller) {
    $(caller).find("button").removeClass("show");
}

function removeElement(caller) {
    $(caller).remove();
}

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function(e) {
            $('#img_prev')
                .attr('src', e.target.result).css('display', 'inline-block');
        };

        reader.readAsDataURL(input.files[0]);
    }
}
