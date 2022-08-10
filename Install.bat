echo Instalador de la base de datos Universidad
echo Autor: Hilbert Eduardo Quispe Lucana
echo 9 de agosto de 2022
sqlcmd -Slocalhost\SQLEXPRESS -E -i BDUniversidad.sql
sqlcmd -Slocalhost\SQLEXPRESS -E -i PATAlumno.sql
sqlcmd -Slocalhost\SQLEXPRESS -E -i PATEscuela.sql
echo Se ejecutó correctamente la base de datos
pause