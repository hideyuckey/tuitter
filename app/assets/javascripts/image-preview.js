$(document).on('turbolinks:load', function(){
  $(function(){
    function buildHTML(image){
      var html =`
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

  $(function(){
    function buildHTML(icon){
      var html =
        `
        <div class = 'prev-icon-content'>
          <img src = "${icon}", class = 'prev-icon'>
        <div>
        `
      return html;
    }

    $(document).on("change", '.form-icon__hiden', function(){
      var file = this.files[0];
      var reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function(){
        var icon = this.result;
        if ($(".prev-icon-content").length == 0){
          var html = buildHTML(icon);
          $(".prev-icon-contents").prepend(html);
        } else {
          $(".prev-icon-content .prev-icon").attr({src: icon});
        }
      }
    })
  })
})