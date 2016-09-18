<!DOCTYPE html>
<html>
	<head>
			%{-- Incluir logica javascript --}%
			<g:javascript src="user/create.js" />
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'Usuario')}" />
		<title><g:message code="default.name.label" args="['Registrarse']"  /></title>
	</head>
	<body>
		<a href="#create-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="create-user" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>

			<g:form controller="User" action="save">
				 <fieldset class="form">
					<!--<g:render template="form"/> -->

					<div class="fieldcontain"><label>Usuario: </label>
            <g:textField name="username"/></div><br/>
            		<div class="fieldcontain"><label>Contraseña: </label>
            <input  TYPE="password" id = "password" name="password" />
             <span class = "size errors" style="display:none" >La contraseña debe tener al menos 6 caracteres</span>
         			</div><br/></div><br/>
              <div class="fieldcontain"><label>Repetir contraseña: </label>
            <input  TYPE="password" id = "repass" name="repass" />
        	<span class = "pass errors" style="display:none" >Las contraseñas no coinciden</span>
      		</div><br/>



				
			<!-- <div class="fieldcontain"><label>Nombre: </label>
            <g:textField name="nombre"/></div><br/>
            <div class="fieldcontain"><label>Apellido: </label>
            <g:textField name="apellido"/></div><br/> -->
            


			
			<div class="content scaffold-create"><h1>Datos de Perfil</h1></div>
			<div class="fieldcontain"><label>Nombre: </label>
            <g:textField name="nombre"/></div><br/>
            <div class="fieldcontain"><label>Apellido: </label>
            <g:textField name="apellido"/></div><br/>
            <div class="fieldcontain"><label>Mail: </label>
            <g:textField name="email"/>
            <span class = "em errors" style="display:none" >El email no es válido</span></div><br/>
            </fieldset> 

		<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="Registrarse"  />
		</fieldset>
		</g:form>
		</div>
	</body>

</html>
