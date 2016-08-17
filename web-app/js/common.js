/*Funcionalidad: Se encarga de inicializar el javascript de la pagina*/

/*Iniciar Parallax*/
$(document).ready(function(){
		$('.parallax').parallax();
});

/*Iniciar Modal*/
$(document).ready(function(){
  		// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
  		$('.modal-trigger').leanModal();
});

/*Iniciar Slider*/
$(document).ready(function(){
 		$('.slider').slider({full_width: true});
});

/*Iniciarlizar Toast*/
$(document).ready(function(){
    $('.tooltipped').tooltip({delay: 50});
});