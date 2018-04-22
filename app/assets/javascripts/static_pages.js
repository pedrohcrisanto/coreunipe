//Muda classe para a cor dos apps adicionais
$(document).ready(function() {
  $(".cor-additional").find(".adaptable").each(function() {
    $(this).removeClass('bg-green-active' );
    $(this).addClass('bg-yellow-active' );
  });
  //Muda classe para a cor dos apps genéricos
  $(".cor-generic").find(".adaptable").each(function() {
    $(this).removeClass('bg-green-active' );
    $(this).addClass('bg-light-blue-active' );
  });
});
