$(document).on('turbolinks:load', function() {
  $("#chkbox_CheckPW").change(function(){
    if($(this).prop('checked')){
      $('#PWForm').attr('type','text');
    }else{
      $('#PWForm').attr('type','password');
    }
  });
});