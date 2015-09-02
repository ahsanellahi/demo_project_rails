$(document).ready(function() {
  $('#user-products-id').on("click", function() {
    $(this).switchClass('label-primary','label-default');
    $('#user-reviews-id').switchClass('label-default','label-primary');
    $('#user-reviews').hide();
    $('#user-products').fadeIn(300);
  });

  $('#user-reviews-id').on("click", function() {
    $(this).switchClass('label-primary','label-default');
    $('#user-products-id').switchClass('label-default','label-primary');
    $('#user-products').hide();
    $('#user-reviews').fadeIn(300);
  });
});
