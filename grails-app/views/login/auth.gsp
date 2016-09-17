<html>
<head>
	%{-- Carga de hojas de estilos predenterminadas --}%
  		%{-- <asset:stylesheet src="application.css"/> --}%
  		%{-- Js de aplicacion --}%
		%{-- <asset:javascript src="application.js"/> --}%

		%{-- Css Bootstrap --}%
		<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="/bootstrap/css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="/css/login.css">


		
		%{-- Scripts --}%

		%{-- Jquery --}%
		<script src="/jquery/jquery.js"></script>
		%{-- Js Bootstrap --}%
		<script src="/bootstrap/js/bootstrap.min.js"></script>
		<script src="/js/login/login.js"></script>
	<title><g:message code="springSecurity.login.title"/></title>

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
            <input type='text' value="mrios" name='j_username' id='username'/>
			
            <label>Contraseña</label>
            <input type='password' value="mrios1" name='j_password' id='password'/>
            
  		
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

</body>
</html>
