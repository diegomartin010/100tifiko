@echo off 
cd .. 
echo Crear un nuevo Controlador 
set /p CONTROLADOR=Nombre de Controlador: 
set /p PAQUETE=Nombre de Paquete : 
grails create-controller %PAQUETE%.%CONTROLADOR% 
exit 
