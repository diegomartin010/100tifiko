
	$(document).ready(function () {


	$("#sidebar-wrapper").hide() //OCULTO LA BARRA LATERAL

	validatePass();
	validateEmail();


})

function validatePass(){

		$("#repass").focusout(function(e) {
			if ($("#password").val() != $("#repass").val())
				$(".pass.errors").show()
			else
				$(".pass.errors").hide()
		})
}

function validateEmail() {
  
	$("#email").focusout(function(e) {
		var patron=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/;
			if($("#email").val().search(patron)==0)	{
					//Mail correcto
					$(".em.errors").hide()
					return;
			}

			//Mail incorrecto
			$(".em.errors").show()
	})
}