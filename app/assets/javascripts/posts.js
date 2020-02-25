function previewImages(input) {
    console.log(input.files)

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
