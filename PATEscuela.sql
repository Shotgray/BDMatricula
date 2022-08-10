--Procedimientos almacenados
--Hilbert Eduardo Quispe Lucana
--09/08/2022

--PA TEscuela
use BDUniversidad
go

--LISTAR
if OBJECT_ID('spListarEscuela') is not null
	drop proc spListarEscuela
go

create proc spListarEscuela
as
begin
	select * from TEscuela
end
go
exec spListarEscuela

--AGREGAR
if OBJECT_ID('spAgregarEscuela') is not null
	drop proc spAgregarEscuela
go

create proc spAgregarEscuela
@CodEscuela char(3), @Escuela varchar(50), @Facultad varchar(50)
as
begin
	--CodEscuela no puede ser duplicado
	if not exists(select CodEscuela from TEscuela where CodEscuela=@CodEscuela)
		--CodEscuela no puede ser duplicado
		if not exists(select Escuela from TEscuela where Escuela=@Escuela)
			begin
				insert into TEscuela values(@CodEscuela,@Escuela,@Facultad)
				select CodError = 0, Mensaje = 'Se inserto correctamente'
			end
		else select CodError = 1, Mensaje = 'Error: Escuela duplicada'
	else select CodError = 1, Mensaje = 'Error: CodEscuela duplicada'
end
go

--ELIMINAR
if OBJECT_ID('spEliminarEscuela') is not null
	drop proc spEliminarEscuela
go

create proc spEliminarEscuela
@CodEscuela char(3)
as
begin
	if not exists(select CodEscuela from TEscuela where CodEscuela=@CodEscuela)
		select CodError = 1, Mensaje = 'Error: No se encuentra el registro'
	else 
		begin
		DELETE FROM TEscuela  WHERE CodEscuela = @CodEscuela
		select CodError = 0, Mensaje = 'Se elimino correctamente'
		end
end
go
exec spEliminarEscuela 'E03'

--UPDATE
if OBJECT_ID('spActualizarEscuela') is not null
	drop proc spActualizarEscuela
go

create proc spActualizarEscuela
@CodEscuela char(3), @Escuela varchar(50), @Facultad varchar(50)
as
begin
	if not exists(select CodEscuela from TEscuela where CodEscuela=@CodEscuela)
		select CodError = 1, Mensaje = 'Error: No se encuentra el registro'
	else 
		begin
		UPDATE TEscuela SET Escuela = @Escuela, Facultad = @Facultad WHERE CodEscuela = @CodEscuela
		select CodError = 0, Mensaje = 'Se actualizado correctamente'
		end
end
go
exec spActualizarEscuela 'E01','Sistemas','Ingenieria'

--BUSCAR
if OBJECT_ID('spBuscarEscuela') is not null
	drop proc spBuscarEscuela
go

create proc spBuscarEscuela
@CodEscuela char(3)
as
begin
	if not exists(select CodEscuela from TEscuela where CodEscuela=@CodEscuela)
		select CodError = 1, Mensaje = 'Error: No se encuentra el registro'
	else 
		begin
		select * from TEscuela where CodEscuela=@CodEscuela
		end
end
go
exec spBuscarEscuela 'E01'