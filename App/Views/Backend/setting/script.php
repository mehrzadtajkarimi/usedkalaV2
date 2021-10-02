<script>
    $(document).ready(function() {

        CKEDITOR.replace('textarea', {
            extraPlugins: 'filebrowser',
            height: 300,
            filebrowserUploadUrl: "/upload.php",
            filebrowserUploadMethod: "form"
        });

        // tinymce.init({
        //     selector: '#mytextarea',
        //     plugins: [
        //         'advlist autolink lists link image charmap print preview anchor',
        //         'searchreplace visualblocks code fullscreen',
        //         'insertdatetime media table paste imagetools wordcount'
        //     ],
        //     toolbar: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
        //     content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }',
        //     height: 400,






        //     setup: function(ed) {

        //         var fileInput = $('<input id="tinymce-uploader" type="file" name="pic" accept="image/*" style="display:none">');
        //         $(ed.getElement()).parent().append(fileInput);

        //         fileInput.on("change", function() {
        //             console.log('salam');
        //             var file = this.files[0];
        //             var reader = new FileReader();
        //             var formData = new FormData();
        //             var files = file;
        //             formData.append("file", files);
        //             formData.append('filetype', 'image');
        //             $.ajax({
        //                 url: "/admin/setting/upload",
        //                 type: "post",
        //                 data: formData,
        //                 contentType: false,
        //                 processData: false,
        //                 async: false,
        //                 success: function(response) {
        //                     var fileName = response;
        //                     if (fileName) {
        //                         ed.insertContent(fileName);
        //                     }
        //                 }
        //             });
        //             reader.readAsDataURL(file);
        //         });

        //         ed.ui.registry.addButton('image_upload', {
        //             text: 'Upload Image',
        //             icon: 'image',
        //             onAction: function() {
        //                 fileInput.trigger('click');
        //             }
        //         });

        //     }
        // });


        // tinymce.init({
        //     selector: 'textarea#mytextarea',
        //     plugins: 'image code',
        //     toolbar: 'undo redo | image code',

        //     // without images_upload_url set, Upload tab won't show up
        //     images_upload_url: '/admin/setting/upload',
        // });
    });
</script>