$(document).on('turbolinks:load', function(){
  $(function(){
    function buildHTML(image){
      var html =
        `
        <div class = 'prev-content'>
          <img src = "${image}", class = 'prev-image'>
        <div>
        `
      return html;
    }

    $(document).on("change", '.form-image__hiden', function(){
      var file = this.files[0];
      var reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function(){
        var image = this.result;
        if ($(".prev-content").length == 0){
          var html = buildHTML(image);
          $(".prev-contents").prepend(html);
        } else {
          $(".prev-content .prev-image").attr({src: image});
        }
      }
    })
  })
})