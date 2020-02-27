function toggleClassName(toggleClassName, className, id) {
    $(id).find(className).toggleClass(toggleClassName);
}

function removeById(id) {
    $(id).remove();
}

function previewImages(input) {

    var $preview = $('#preview-images');
    if (input.files) $.each(input.files, readAndPreview);

    function readAndPreview(i, file) {

        if (!/\.(jpe?g|png|gif)$/i.test(file.name)) {
            return alert(file.name + " is not an image");
        } // else...

        var reader = new FileReader();

        reader.onload = function(e) {
            $preview.append($("<img/>", {
                src: e.target.result,
                height: 100,
                margin: 10

            }));
        };

        reader.readAsDataURL(file);

    }

}
