document.addEventListener("turbolinks:load", function() {
$(function(){
  $('.upload-image').on('change', function(event){
    var preview = document.querySelector('#preview');
    var files   = document.querySelector('input[type=file]').files;

    function readAndPreview(file) {

      if ( /\.(jpe?g|png|gif)$/i.test(file.name) ) {
        var reader = new FileReader();

        reader.addEventListener('load', function () {
          var image = new Image();
          image.height = 100;
          image.width = 100;
          image.title = file.name;
          image.src = this.result;
          preview.appendChild( image );
        }, false);

        reader.readAsDataURL(file);
      }
    }

    if (files) {
      [].forEach.call(files, readAndPreview);
    }
  });
});

$(document).ready(function () {
  $('.text').click(function () {
    $('.overlay').fadeIn(500);
  });
  $('.overlay').not('.text').click(function() {
    $('.overlay').fadeOut(500);
  });
});

$(document).ready(function(){
  $('.flexslider').flexslider({
    animation: "slide",
    pauseOnHover: true,
  });
});
});
