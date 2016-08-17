@echo off 
cd .. 
echo. 
echo. 
echo. 
echo GENERATE ALL VIEWS AND CONTROLERS. 
echo. 
set /p DES=Crear todas las vistas y controladores? ( y/n ): 
goto %DES% 
:y 
call grails clean 
call grails compile 
call grails generate-all * 
echo. 
echo Creacion de clases y controladores finalizada 
pause 
exit 
:n 
echo. 
exit 
