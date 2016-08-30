<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="springSecurity.login.title"/></title>
	<style type="text/css" media="screen">
		#login {
			margin: 15px 0px;
			padding: 0px;
			text-align: center;
			height: 80%;
		}

		#login .inner {
			width: 340px;
			height: 50%;
			padding-bottom: 6px;
			margin: 60px auto;
			text-align: left;
			border: 1px solid #aab;
			background-color: #f0f0fa;
			-moz-box-shadow: 2px 2px 2px #eee;
			-webkit-box-shadow: 2px 2px 2px #eee;
			-khtml-box-shadow: 2px 2px 2px #eee;
			box-shadow: 2px 2px 2px #eee;
		}

		#login .inner .fheader {
			padding: 18px 26px 14px 26px;
			background-color: #f7f7ff;
			margin: 0px 0 14px 0;
			color: #2e3741;
			font-size: 18px;
			font-weight: bold;
		}

		#login .inner .cssform p {
			clear: left;
			margin: 0;
			padding: 4px 0 3px 0;
			padding-left: 105px;
			margin-bottom: 20px;
			height: 1%;
		}

		#login .inner .cssform input[type='text'] {
			width: 120px;
		}


		#login .inner .cssform label {
			font-weight: bold;
			float: left;
			text-align: right;
			margin-left: -105px;
			width: 110px;
			padding-top: 3px;
			padding-right: 10px;
		}


		#login #submit {
			margin-left: 15px;
		}

		#login #remember_me_holder label {
			float: none;
			margin-left: 0;
			text-align: left;
			width: 200px
		}

		#login .inner .login_message {
			padding: 6px 25px 20px 25px;
			color: #c33;
			text-align:center ;
		}

		#login .inner .text_ {
			width: 120px;
		}

		#login .inner .chk {
			height: 12px;
		}
		#restablecer a {
			cursor:pointer;
		    color: #0c2561;
		    background-color: transparent;
		    text-decoration: underline;
		}
		.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 40%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}
.modal-header {
    padding: 2px 16px;
    background-color: #fb885d;
    color: white;
}
.modal-footer {
    padding: 2px 16px;
    background-color: #fb885d;
    color: white;
}
	</style>
</head>

<body>
	<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">×</span>
      <h2>Restablecer contraseña</h2>
    </div>
    <div class="modal-body">
      <p>Coloque el correo elecrónico y le enviaremos un link para restablecer su contraseña</p>
    </div>
<form style="margin-left:2em" action="restablecer.gsp">
Email:<br>
<input type="text" name="email">
<br>

<br>
<input type="submit">
</form>
    <div style="cursor:pointer " class="modal-footer">
      <h3 id="cerrar">Cerrar</h3>
    </div>
  </div>

</div>

<div id='login'>
	<div class='inner'>
		<div class='fheader'><g:message code="springSecurity.login.header"/></div>

		<g:if test='${flash.message}'>
			<div class='login_message'>${flash.message}</div>
		</g:if>

		<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
			<p>
				<label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
				<input type='text' class='text_' name='j_username' id='username'/>
			</p>

			<p>
				<label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
				<input type='password' class='text_' name='j_password' id='password'/>
			</p>

		
			<p id="restablecer" >
				
					<a>Restablecer contraseña</a>
			</p>
			
			
			<p id="remember_me_holder">
				<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
				<label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
			</p>
			
			<p>
				<input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>

			</p>
			<p style="text-align:right; margin-right:1em;">
				<a   class = "buttons" href="/user/create"><b>Registrarse</b></a>
			</p>

		</form>
	</div>
</div>
<script type='text/javascript'>
(function() {
	document.forms['loginForm'].elements['j_username'].focus();
	$("#status").hide()
	var modal = document.getElementById('myModal');
	// Get the button that opens the modal
var btn = document.getElementById("restablecer");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

var cerrar= document.getElementById("cerrar");

// When the user clicks the button, open the modal
btn.onclick = function() {
    modal.style.display = "block";
}

cerrar.onclick = function(){
	modal.style.display = "none";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}  
})();
</script>
</body>
</html>
