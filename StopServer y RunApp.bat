@echo off
call grails stop-app
call grails clean
call grails compile
call grails RunApp
echo PROCESO FINALIZADO
cmd
exit