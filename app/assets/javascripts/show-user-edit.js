$(document).on("turbolinks:load", function(){
  $(".show-user-edit").on("click", function(e) {
    e.preventDefault();
    $(".edit-user-profile").addClass("active");
  })
  $(".close-edit-page").on("click", function(e) {
    e.preventDefault();
    $(".edit-user-profile").removeClass("active");
  })
})