@echo off
cd ..
echo GENERAR UNA VISTA
set /p VISTA=Nombre de la vista :
set /p PAQUETE=Nombre de Paquete :
grails generate-views %PAQUETE%.%VISTA%
exit
