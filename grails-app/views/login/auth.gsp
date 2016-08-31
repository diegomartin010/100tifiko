<html>
<head>
	%{-- Carga de hojas de estilos predenterminadas --}%
  		%{-- <asset:stylesheet src="application.css"/> --}%
  		%{-- Js de aplicacion --}%
		%{-- <asset:javascript src="application.js"/> --}%

		%{-- Css Bootstrap --}%
		<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="/bootstrap/css/bootstrap-theme.min.css">
		
		%{-- Scripts --}%

		%{-- Jquery --}%
		<script src="/jquery/jquery.js"></script>
		%{-- Js Bootstrap --}%
		<script src="/bootstrap/js/bootstrap.min.js"></script>
	<title><g:message code="springSecurity.login.title"/></title>
	<style type="text/css" media="screen">
		


		
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
/* form */
body{
    background: #e7e7e7;
}
.form-body{
    background:#fff;
    padding:20px;
}
.login-form{
    background:rgba(255,255,255,0.8);
	padding:20px;
	border-top:3px solid#3e4043;
}
.innter-form{
	padding-top:20px;
}
.final-login li{
	width:50%;
}

.nav-tabs {
    border-bottom: none !important;
}

.nav-tabs>li{
	color:#222 !important;
}
.nav-tabs>li.active>a, .nav-tabs>li.active>a:hover, .nav-tabs>li.active>a:focus {
    color: #fff;
    background-color: #d14d42;
    border: none !important;
    border-bottom-color: transparent;
	border-radius:none !important;
}
.nav-tabs>li>a {
    margin-right: 2px;
    line-height: 1.428571429;
    border: none !important;
    border-radius:none !important;
	text-transform:uppercase;
	font-size:16px;
}

.social-login{
	text-align:center;
	font-size:12px;
}
.social-login p{
	margin:15px 0;
}
.social-login ul{
	margin:0;
	padding:0;
	list-style-type:none;
}
.social-login ul li{
	width:33%;
	float:left;
    clear:fix;
}
.social-login ul li a{
	font-size:13px;
	color:#fff;
	text-decoration:none;
	padding:10px 0;
	display:block;
}
.social-login ul li:nth-child(1) a{
	background:#3b5998;
}
.social-login ul li:nth-child(2) a{
	background:#e74c3d;
}
.social-login ul li:nth-child(3) a{
	background:#3698d9;
}
.sa-innate-form input[type=text], input[type=password], input[type=file], textarea, select, email{
    font-size:13px;
	padding:10px;
	border:1px solid#ccc;
	outline:none;
	width:100%;
	margin:8px 0;
	
}
.sa-innate-form input[type=submit]{
    border:1px solid#e64b3b;
	background:#e64b3b;
	color:#fff;
	padding:10px 25px;
	font-size:14px;
	margin-top:5px;
	}
	.sa-innate-form input[type=submit]:hover{
	border:1px solid#db3b2b;
	background:#db3b2b;
	color:#fff;
	}
	
	.sa-innate-form button{
	border:1px solid#e64b3b;
	background:#e64b3b;
	color:#fff;
	padding:10px 25px;
	font-size:14px;
	margin-top:5px;
	}
	.sa-innate-form button:hover{
	border:1px solid#db3b2b;
	background:#db3b2b;
	color:#fff;
	}
    .sa-innate-form p{
        font-size:13px;
        padding-top:10px;
    }
    .errors {
    background: #fff3f3;
    border: 1px solid #ffaaaa;
    color: #cc0000;
    -moz-box-shadow: 0 0 0.25em #ff8888;
    -webkit-box-shadow: 0 0 0.25em #ff8888;
    box-shadow: 0 0 0.25em #ff8888;
    width:70%;
}
	.register{

	}
	.register-button button{
		background-color: lightblue;
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
<form style="margin-left:2em" action="/restablecer">
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
<div class="container">

</div>
<br>
<br>
<div class="container">
<div class="row">
<div class="col-md-4 col-md-offset-4">
<div class="form-body">
    <ul class="nav nav-tabs final-login">
        <li class="active"><a data-toggle="tab" href="#sectionA">Iniciar sesion</a></li>
        <!-- <li><a data-toggle="tab" href="#sectionB">Join us!</a></li> -->
    </ul>
    <div class="tab-content">
        <div id="sectionA" class="tab-pane fade in active">
        <div class="innter-form">


</div>
<g:if test='${flash.message}'>
 		<div class='errors'>${flash.message}</div><br>
 		</g:if>

		<form action='${postUrl}' method='POST' id='loginForm' class='sa-innate-form' autocomplete='off'>
			<!-- <p>
				<label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
				<input type='text' class='text_' name='j_username' id='username'/>
			</p>

			<p>
				<label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
				<input type='password' class='text_' name='j_password' id='password'/>
			</p> -->
			<label>Usuario</label>
            <input type='text'  name='j_username' id='username'/>
			
            <label>Contraseña</label>
            <input type='password'  name='j_password' id='password'/>
            
  		
			<p id="restablecer" >
				
					<a>Restablecer contraseña</a>
			</p>
			
			
			<p id="remember_me_holder">
				<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
				<label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
			</p>
			
			<p>
				<input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
				<button style="background:#678fa7;     border-color: #678fa7;"><a style="color:white"  href="/user/create">Registrarse</a></button>

			</p>
			<p >
				
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
