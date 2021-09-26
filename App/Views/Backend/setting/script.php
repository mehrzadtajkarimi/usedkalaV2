<script>
    $(document).ready(function() {


        tinymce.init({
            selector: '#mytextarea',
            plugins: "code",
            toolbar: "undo redo | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link code image_upload",
            menubar: false,
            statusbar: false,
            content_style: ".mce-content-body {font-size:15px;font-family:Arial,sans-serif;}",
            height: 400,
            setup: function(ed) {

                var fileInput = $('<input id="tinymce-uploader" type="file" name="pic" accept="image/*" style="display:none">');
                $(ed.getElement()).parent().append(fileInput);

                fileInput.on("change", function() {
                    console.log('salam');
                    var file = this.files[0];
                    var reader = new FileReader();
                    var formData = new FormData();
                    var files = file;
                    formData.append("file", files);
                    formData.append('filetype', 'image');
                    $.ajax({
                        url: "/admin/setting",
                        type: "post",
                        data: formData,
                        contentType: false,
                        processData: false,
                        async: false,
                        success: function(response) {
                            var fileName = response;
                            if (fileName) {
                                ed.insertContent(fileName);
                            }
                        }
                    });
                    reader.readAsDataURL(file);
                });

                ed.ui.registry.addButton('image_upload', {
                    text: 'Upload Image',
                    icon: 'image',
                    onAction: function() {
                        fileInput.trigger('click');
                    }
                });
            }



        });
    });
</script>