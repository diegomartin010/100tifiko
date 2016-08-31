<html>
<head>
<meta name='layout' content='main' />
<title>Restablecer contraseña </title>


</head>

<body>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  </head>
  <body>
    <a href="#create-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/>
    </a>
    <div class="nav" role="navigation">
      <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
      </ul>
    </div>
    <div id="create-user" class="content scaffold-create" role="main">
      <br><br>
      <h1>Restablecer contraseña</h1>
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

      <g:form controller="restablecer" >
         <fieldset class="form">

      <div class="fieldcontain"><label>Contraseña: </label>
        <input  TYPE="password" id = "password" name="password" />
      </div><br/>
         <div class="fieldcontain"><label>Repetir contraseña: </label>
          <input  TYPE="password" id = "repass" name="repass" />
            <span class = "pass errors" style="display:none" >Las contraseñas no coinciden
            </span>
          </div><br/>
              <fieldset class="buttons">
                 <g:submitButton name="create" class="save" value="Restablecer"  />
              </fieldset>
      </g:form>



<script type='text/javascript'>
$(document).ready(function () {
  $("#sidebar-wrapper").hide() //OCULTO LA BARRA LATERAL

})


    $("#repass").focusout(function(e) {
      if ($("#password").val() != $("#repass").val())
        $(".pass.errors").show()
      else
        $(".pass.errors").hide()
    })


</script>
  </body>

</html>