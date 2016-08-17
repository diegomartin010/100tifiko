@echo off 
cd .. 
echo RECOMPILAR ARCHIVO 
call grails clean 
call grails compile 
echo. 
exit 
