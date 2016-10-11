<%@ page import="estats.SessionManager" %>
<!DOCTYPE html>
<html>
<head>
	<g:javascript src="" />
	<meta name="layout" content="main">
	<title><g:message code="Carrera"/></title>
</head>
<body>
		
	%{-- Barra de navegacion pagina --}%
	<div class="nav" role="navigation">
		<ul><li><a class="home" href="/"><g:message code="default.home.label"/></a></li></ul>
	</div>
	
	%{-- Estilo body de la pagina --}%
	<div id="page-body" role="main">
		<% def usuario = SessionManager.getCurrentUser() %>
		<div class="content"><h1>Estado academico</h1></div>			
		<div class="container">
			Mudo Aca tenes que hacer la vista para esto ....
			<br>
			<iframe src="https://drive.google.com/file/d/0B3N4QK1nj086NVNkeDVzZ1otQzg/preview" width="640" height="480"></iframe>
		</div>

		<div align="center" style="border: 1px solid #a9a9a9; width: 450px; margin-top: 3px; margin-bottom: 3px; background-color:#ffffff;"><table cellpadding="2" cellspacing="3" border=0 bgcolor="#ffffff"><TR><TD><span style="font-family: arial; color:#666666; font-weight:bold; font-size:12px;">RISA DE PATAN</span></TD></tr><TR VALIGN="MIDDLE"><TD><embed  wmode="transparent" style="height: 24px; width: 290px;" src="http://www.madringtones.org/player.swf" quality="high" bgcolor="#ffffff" width="290" height="24" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" flashvars="playerID=1077876&animation=no&titles=RISA DE PATAN&artists=&soundFile=http://net18.madringtones.org/data/72/1077876/files/1077876.mp3"></embed><a href="http://www.madringtones.org/" title="¡Crea tus propios ringtones, convierte videos de YouTube en ringtones mp3 gratis"><img style="padding: 0; border: 0; vertical-align: bottom" src="http://www.madringtones.org/image/madringtones_logo_remote.png" /></a></TD></TR><TR><TD align="center"><span style="font-family: arial; font-size:11px; text-align: center; width: 100%; line-height: 20px; color:#ababab;">Descargar "<a href="http://www.madringtones.org/tone/1077876-RISA-DE-PATAN" style="color:#319FE7">RISA DE PATAN</a>" de MadRingtones.org</TD></TR></table></div>
	</div>

</body>
</html>