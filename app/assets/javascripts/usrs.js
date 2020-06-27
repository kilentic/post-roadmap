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
            $('#new-avatar, .new-avatar-trigger').css('display', 'none');
            $('#img_prev')
                .attr('src', e.target.result);
            $('.submit-upload-avatar').attr('disabled', false).css({
                background: '#94C843',
                cursor: 'pointer'
            });
            $('.jcrop-holder img').attr('src', e.target.result);
            $('#img_prev').Jcrop({

                onSelect: updateCoords,

                bgOpacity: 0.4,
                bgColor: 'black',
                setSelect: [100, 100, 50, 50],
                aspectRatio: 1 / 1
            });
        };

        reader.readAsDataURL(input.files[0]);
    }
}

function updateCoords(c) {
    var imp = $("#img_prev");
    var impH = imp.get(0).naturalHeight;
    var impW = imp.get(0).naturalWidth;
    $('#x').val(c.x*impW/imp.width());
    $('#y').val(c.y*impH/imp.height());
    $('#w').val(c.w*impW/imp.width());
    $('#h').val(c.h*impH/imp.height());
};
