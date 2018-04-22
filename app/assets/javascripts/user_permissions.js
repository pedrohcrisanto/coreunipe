$(function(){
  $(".add").click(function(){
    var id = $(this).attr("id");
    var user = $(this).children('font').attr("id");
    $('select').each(function(i){
      if ($(this).attr("id") == id){
        var categoria = $(this).val();

        $("#user_permission_user_id").val(user);
        $("#user_permission_permission_id").val(id);
        $("#user_permission_category").val(categoria);
        $("#new_user_permission").submit();
      };
    });
  });
});
