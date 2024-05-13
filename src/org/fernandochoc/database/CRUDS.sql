-- CRUD Clientes --

-- Agregar --
DELIMITER $$
create procedure sp_agregarClientes(nom varchar(30), ape varchar(30), tel varchar(15), dir varchar(200), nt varchar(15))
BEGIN
	insert into Clientes(nombre, apellido, telefono, direccion, nit) values
    (nom, ape, tel, dir, nt);
END$$
DELIMITER ;

-- Listar --
DELIMITER $$
create procedure sp_listarClientes()
BEGIN
	select * from 
		Clientes;
END$$
DELIMITER ;

-- Eliminar --
DELIMITER $$
create procedure sp_eliminarClientes(cliId int)
BEGIN 
	delete from Clientes where clienteId = cliId;
END$$
Delimiter ;

-- Buscar --
DELIMITER $$
create procedure sp_buscarClientes(cliId int)
BEGIN
	select * from Clientes where clienteId = cliId;
END$$
DELIMITER ;

-- Editar --
DELIMITER $$
create procedure sp_editarClientes(cliId int, nom varchar(30), ape varchar(30), tel varchar(15), dir varchar(200), nt varchar(15))
BEGIN
	update Clientes set
		nombre = nom,
        apellido = ape,
        telefono = tel,
        direccion = dir,
        nit = nt
			where clienteId = cliId;
END$$
DELIMITER ;

-- CRUD Cargos --

-- Agregar --
DELIMITER $$ 
CREATE PROCEDURE sp_AgregarCargos(IN nom VARCHAR (30), IN des VARCHAR (100))
BEGIN 	
	INSERT INTO Cargos (nombreCargo , descripcionCargo)VALUES 
		(nom, des);
END$$
DELIMITER ;

-- Listar --
DELIMITER $$ 
CREATE PROCEDURE sp_ListarCargos()
BEGIN 
	SELECT
		Cargos.cargoId ,
		Cargos.nombreCargo  ,
		Cargos.descripcionCargo  
			FROM Cargos;
END$$
DELIMITER ;

-- Eliminar -- 
DELIMITER $$ 
CREATE PROCEDURE sp_EliminarCargos(IN carId INT)
BEGIN
	DELETE
	FROM Cargos 
		WHERE cargoId =  carId;
END$$
DELIMITER ;

-- Buscar --
DELIMITER $$ 
CREATE PROCEDURE sp_BuscarCargos(IN carId INT)
BEGIN
	SELECT 	
		Cargos.cargoId ,
		Cargos.nombreCargo  ,
		Cargos.descripcionCargo  
			FROM Cargos
			WHERE cargoId = carId;
END$$
DELIMITER ;

-- Editar --
DELIMITER $$ 
CREATE PROCEDURE sp_EditarCargos(IN carId INT,IN nom VARCHAR (30), IN des VARCHAR (100))
BEGIN
	UPDATE Cargos
		SET
			nombreCargo  = nom,
			descripcionCargo  = des
			WHERE cargoId  = carId;
END$$
DELIMITER ;

-- CRUD Empleados --

-- Agregar -- 
DELIMITER $$
	create procedure sp_AgregarEmpleados (in nomEmp varchar (30), in apeEmp  varchar (30), in sud decimal (10, 2), in horEntr time, in horSld time, in cargId int, in encaId int)
		begin 
			insert into Empleados (nombreEmpleado , apellidoEmpleado, sueldo, horaEntrada, horaSalida, cargoId, encargadoId)
				values (nomEmp, apeEmp, sud, horEntr, horSld, cargId, encaId);
		end$$
DELIMITER ;

-- Listar -- 
DELIMITER $$
	create procedure sp_ListarEmpleados ()
		begin 
			select 
				Empleados.nombreEmpleado,
                Empleados.apellidoEmpleado,
                Empleados.sueldo,
                Empleados.horaEntrada,
                Empleados.horaSalida,
                Empleados.cargoId,
                Empleados.encargadoId
					FROM Empleados;
		end $$
DELIMITER ;

-- Eliminar --
DELIMITER $$
	create procedure sp_EliminarEmpleados (in empId int)
		begin
			delete
				from Empleados
					where empleadoId = empId;
		end $$
DELIMITER ;

-- Buscar --
DELIMITER $$
	create procedure sp_BuscarEmpleados (in empId int)
		begin 
			select
				Empleados.nombreEmpleado,
                Empleados.apellidoEmpleado,
                Empleados.sueldo,
                Empleados.horaEntrada,
                Empleados.horaSalida,
                Empleados.cargoId,
                Empleados.encargadoId
					from Empleados 
						where empleadoId = empId;
		end $$
DELIMITER ;

-- Editar --
DELIMITER $$
	create procedure sp_EditarEmpleados (in empId int, in nomEmp varchar (30), in apeEmp  varchar (30), in sud decimal (10, 2), in horEntr time, in horSld time, in cargId int, in encaId int)
		begin
			update Empleados
				set	
					nombreEmpleado = nomEmp,
					apellidoEmpleado = apeEmp,
					sueldo = sud,
					horaEntrada = horEntr, 
					horaSalida = horSld,
					cargoId = cargId,
					encargadoId = encaId
					where empleadoId = empId;
		end $$
DELIMITER ;

-- CRUD Facturas --

-- Agregar ..
DELIMITER $$
	create procedure sp_AgregarFacturas (in fech date, in hor time, in tot decimal (10, 2), in cliId int, in empId int)
		begin 
			insert into Facturas (fecha, hora, total, clienteId, empleadoId)
				values (fech, hor, tot, cliId, empId);
		end$$
DELIMITER ;

-- Listar -- 
DELIMITER $$
	create procedure sp_ListarFacturas ()
		begin 
			select 
				Facturas.facturaId,
				Facturas.fecha,
                Facturas.hora,
                Facturas.total,
                Facturas.clienteId,
                Facturas.empleadoId
					FROM Facturas;
		end $$
DELIMITER ;

-- Eliminar --
DELIMITER $$
	create procedure sp_EliminarFacturas (in facId int)
		begin
			delete
				from Facturas
					where facturaId = facId;
		end $$
DELIMITER ;

-- Buscar --
DELIMITER $$
	create procedure sp_BuscarFacturas (in facId int)
		begin 
			select
				Facturas.fecha,
                Facturas.hora,
                Facturas.total,
                Facturas.clienteId,
                Facturas.empleadoId
					from Facturas
						where facturaId = facId;
		end $$
DELIMITER ;

-- Editar --
DELIMITER $$
	create procedure sp_EditarFacturas (in facId int, in fech date, in hor time, in tot decimal (10, 2), in cliId int, in empId int)
		begin
			update Facturas
				set	
					fecha = fech,
					hora = hor,
					total = tot,
					clienteId = cliId,
					empleadoId = empId
					where facturaId = facId;
		end $$
DELIMITER ;

-- CRUD Ticketsoportes --

-- Agregar --
DELIMITER $$
	create procedure sp_AgregarTicketsoportes (in descTick varchar (250), in est varchar (30), in cliId int, in facId int)
		begin 
			insert into Facturas (descripcionTicket, estatus , clienteId , facturaId)
				values (descTick, est, cliId, facId);
		end$$
DELIMITER ;

-- Listar --
DELIMITER $$
	create procedure sp_ListarTicketsoportes ()
		begin 
			select 
				Ticketsoportes.ticketsoporteId ,
				Ticketsoportes.descripcionTicket,
                Ticketsoportes.estatus,
                Ticketsoportes.clienteId,
                Ticketsoportes.facturaId
					FROM Ticketsoportes;
		end $$
DELIMITER ;

-- Eliminar --
DELIMITER $$
	create procedure sp_EliminarTicketsoportes (in tickSopId int)
		begin
			delete
				from Ticketsoportes 
					where ticketsoporteId = tickSopId;
		end $$
DELIMITER ;

-- Buscar --
DELIMITER $$
	create procedure sp_BuscarTicketsoportes (in tickSopId int)
	  begin 
		select
			Ticketsoportes.descripcionTicket,
			Ticketsoportes.estatus,
			Ticketsoportes.clienteId,
			Ticketsoportes.facturaId
				from Ticketsoportes
					where ticketSoporteId = tickSopId;
	end $$
DELIMITER ;

-- Editar --
DELIMITER $$
	create procedure sp_EditarTicketsoportes (in tickSopId int, in descTick varchar (250), in est varchar (30), in cliId int, in facId int)
	  begin
		update Ticketsoportes
			set	
				descripcionTicket = descTick,
				estatus = est,
				clienteId = cliId,
				facturaId = facId
				where ticketSoporteId = tickSopId;
	end $$
DELIMITER ;

-- CRUD Distribuidores -- 

-- Agregar --
DELIMITER $$ 
CREATE PROCEDURE sp_AgregarDistribuidores(IN nom VARCHAR (30),IN dir VARCHAR (200), IN nit varchar(15), IN tel varchar(15),  IN web varchar(50))
BEGIN 	
	INSERT INTO Distribuidores (nombreDistribuidor , direccionDistribuidor ,nitDistribuidor ,telefonoDistribuidor ,web)VALUES 
		(nom, dir,nit,tel,web);
END$$
DELIMITER ;

-- Listar --
DELIMITER $$ 
CREATE PROCEDURE sp_ListarDistribuidores()
BEGIN 
	SELECT
		Distribuidores.distribuidorId,
		Distribuidores.nombreDistribuidor,
		Distribuidores.direccionDistribuidor,
		Distribuidores.nitDistribuidor,
		Distribuidores.telefonoDistribuidor,
		Distribuidores.web 
			FROM Distribuidores;
END$$
DELIMITER ;

-- Eliminar --
DELIMITER $$ 
CREATE PROCEDURE sp_EliminarDistribuidores(IN disId INT)
BEGIN
	DELETE
	FROM Distribuidores 
		WHERE distribuidorId =  disId;
END$$
DELIMITER ;

-- Buscar --
DELIMITER $$ 
CREATE PROCEDURE sp_BuscarDistribuidores(IN disId INT)
BEGIN
	SELECT 	
		Distribuidores.distribuidorId,
		Distribuidores.nombreDistribuidor,
		Distribuidores.direccionDistribuidor,
		Distribuidores.nitDistribuidor,
		Distribuidores.telefonoDistribuidor,
		Distribuidores.web 
			FROM Distribuidores
			WHERE distribuidorId = disId;
END$$
DELIMITER ;

-- Editar --
DELIMITER $$ 
CREATE PROCEDURE sp_EditarDistribuidores(IN disId INT,IN nom VARCHAR (30),IN dir VARCHAR (200), IN nit varchar(15), IN tel varchar(15),  IN web varchar(50))
BEGIN
	UPDATE Distribuidores
		SET
			nombreDistribuidor = nom,
			direccionDistribuidor = dir,
			nitDistribuidor = nit,
			telefonoDistribuidor = tel ,
            web = web
			WHERE clienteId = cliId;
END$$
DELIMITER ;

-- CRUD Categoriaproductos --

-- Agregar --
DELIMITER $$ 
CREATE PROCEDURE sp_AgregarCategoriaproductos(IN nom VARCHAR (30), IN des VARCHAR (100))
BEGIN 	
	INSERT INTO Categoriaproductos (nombreCategoria , descripcionCategoria )VALUES 
		(nom, des);
END$$
DELIMITER ;

-- Listar --
DELIMITER $$ 
CREATE PROCEDURE sp_ListarCategoriaproductos()
BEGIN 
	SELECT
		Categoriaproductos.categoriaproductoId, 
		Categoriaproductos.nombreCategoria,  
		Categoriaproductos.descripcionCategoria  
			FROM Categoriaproductos;
END$$
DELIMITER ;

-- Eliminar --
DELIMITER $$ 
CREATE PROCEDURE sp_EliminarCategoriaproductos(IN catId  INT)
BEGIN
	DELETE
	FROM Categoriaproductos 
		WHERE categoriaproductoId  =  catId;
END$$
DELIMITER ;

-- Buscar --
DELIMITER $$ 
CREATE PROCEDURE sp_BuscarCategoriaproductos(IN catId INT)
BEGIN
	SELECT 	
		Categoriaproductos.categoriaproductoId, 
		Categoriaproductos.nombreCategoria,  
		Categoriaproductos.descripcionCategoria  
			FROM CategoriaProductos
			WHERE categoriaProductoId  = catId;	
END$$
DELIMITER ;

-- Editar --
DELIMITER $$ 
CREATE PROCEDURE sp_EditarCategoriaproductos(IN catId INT,IN nom VARCHAR (30), IN des VARCHAR (100))
BEGIN
	UPDATE Categoriaproductos
		SET
			nombreCategoria  = nom,
			descripcionCategoria = ape
			WHERE categoriaproductoId = catId;
END$$
DELIMITER ;

-- CRUD Productos --

-- Agregar --
DELIMITER $$
CREATE PROCEDURE sp_AgregarProductos(in nom varchar(50),in des varchar(100),in can int, in preU decimal(10,2),in preM decimal(10,2),in preC decimal(10,2), in ima blob, in disId int, in catId int)
	BEGIN
		insert into Productos(nombreProducto, descripcionProducto, cantidadStock, precioUnitario, precioVentaMayor, precioCompra, imagenProducto, distribuidorId, categoriaProductosId ) values
			(nom, des, can, preU, preM, preC, ima, disId, catId);
	END $$
DELIMITER ;

-- Listar --
DELIMITER $$
CREATE PROCEDURE sp_ListarProducto()
	BEGIN 
		select * from Productos;
    END $$
DELIMITER ;

-- Buscar -- 
DELIMITER $$
CREATE PROCEDURE sp_BuscarProductos(in proId int)
	BEGIN 
		select * from Productos
        where productoId = proId;
    END $$
DELIMITER ;

-- Eliminar --
DELIMITER $$
CREATE PROCEDURE sp_EliminarProductos(in proId int)
	BEGIN
		delete from Productos
			where productoId = proId;
    END $$
DELIMITER ;

-- editar --
DELIMITER $$
CREATE PROCEDURE sp_EditarProductos(in proId int, in nom varchar(50),in des varchar(100),in can int, in preU decimal(10,2),in preM decimal(10,2),in preC decimal(10,2), in ima blob, in disId int, in catId int )
	BEGIN
		update Productos	
			set 
            nombreProducto = nom,
            descripcionProduto = des,
            cantidadStock = can,
            precioVentaUnitario = preU,
            precioVentaMayor = preM,
            precioCompra = preC,
            imagenProducto = ima,
            distribuidorId = disId,
            categoriaproductosId = catId
            where productoId = proId;
    END $$
DELIMITER ;

-- CRUD Promociones --

-- Agregar --
DELIMITER $$
CREATE PROCEDURE sp_AgregarPromociones(prePro decimal (10,2), desPro varchar (100), fecI date, fecF date, in proId int)
BEGIN
	insert into Promociones(precioPromocion, descripcionPromocion, fechaInicio, fechaFinalizacion, productoId )values
    (prePro,desPro, fecI, fecF, proId);
    
END $$
DELIMITER ;

-- Listar --
DELIMITER $$
CREATE PROCEDURE sp_ListarPromociones()
BEGIN
	select
    Promociones.promocionId,
    Promociones.precioPromocion,
    Promociones.descripcionPromocion,
    Promociones.fechaInicio,
    Promociones.fechaFinalizacion,
    Promociones.productoId
		FROM Promociones;

END $$
DELIMITER ;

-- Eliminar --
DELIMITER $$
CREATE PROCEDURE sp_EliminarPromociones(in proId int)
BEGIN
	delete
		from Promociones
        where promocionId = proId;
END $$
DELIMITER ;

-- Buscar --
DELIMITER $$
CREATE PROCEDURE sp_BuscarPromociones(in proId int)
BEGIN
	select
		Promociones.promocionId,
        Promociones.precioPromocion,
        Promociones.descripcionPromocion,
        Promociones.fechaInicio,
        Promociones.fechaFinalizacion,
        Promociones.productoId
			from Promociones
            where promocionId = proId;
END $$
DELIMITER  ;

-- Editar --
DELIMITER $$
CREATE PROCEDURE sp_EditarPromociones(in promId int, prePro decimal (10,2), desPro varchar (100), fecI date, fecF date, in proId int )
BEGIn
	update Promociones
		set
			precioPromocion = prePro,
            descripcionPromocion = desPro,
            fechaInicio = fecI,
            fechFinalizacion = fecF,
            profuctoId = proId
            where promocionId = promId;
END $$
DELIMITER ;

-- CRUD Compras --

-- Agregar --
DELIMITER $$ 
CREATE PROCEDURE sp_AgregarCompras(IN fec date, IN tot  decimal (10.2))
BEGIN 	
	INSERT INTO Compras (fechaCompra,totalCompra )VALUES 
		(fec, tot);
END$$
DELIMITER ;

-- Listar --
DELIMITER $$ 
CREATE PROCEDURE sp_ListarCompras()
BEGIN 
	SELECT
		Compras.compraId ,
		Compras.fechaCompra, 
		Compras.totalCompra  
			FROM Compras;
END$$
DELIMITER ;

-- Eliminar --
DELIMITER $$ 
CREATE PROCEDURE sp_EliminarCompras(IN compId  INT)
BEGIN
	DELETE
	FROM Compras 
		WHERE compraId  =  compId;
END$$
DELIMITER ;

-- Buscar --
DELIMITER $$ 
CREATE PROCEDURE sp_BuscarCompras(IN compId INT)
BEGIN
	SELECT 	
		Compras.compraId,
		Compras.fechaCompra, 
		Compras.totalCompra 
			FROM Compras
			WHERE compraId = compId;
END$$
DELIMITER ;

-- Editar --
DELIMITER $$ 
CREATE PROCEDURE sp_EditarCompras(IN compId INT,IN fec date, IN tot  decimal (10.2))
BEGIN
	UPDATE Compras
		SET
			fechaCompra   = fec,
			totalCompra   = tot
			WHERE compraId   = compId;
END$$
DELIMITER ;

-- CRUD Detallefacturas --

-- Agregar --
delimiter $$
	create procedure sp_AgregarDetallefacturas  (in factId int, in proId int)
		begin 
			insert into Detalledacturas  (facturaId, productoId)
				values (factId, proId);
		end$$
delimiter ;

-- Listar --
delimiter $$
	create procedure sp_ListarDetallefacturas  ()
		begin 
			select 
				Detallefacturas.detalleFacturaId,
				Detallefacturas.facturaId,
                Detallefacturas.productoId
					FROM DetalleFactura;
		end $$
delimiter ;

-- Eliminar --
delimiter $$
	create procedure sp_EliminarDetallefacturas   (in detaFacId int)
		begin
			delete
				from Detallefacturas  
					where detalleFacturaId  = detaFacId;
		end $$
delimiter ;

-- Buscar --
delimiter $$
	create procedure sp_BuscarDetallefacturas  (in detaFacId int)
		begin 
			select
				Detallefacturas.facturaId,
                Detallefacturas.productoId
					from Detallefacturas 
						where detalleFacturaId  = detaFacId;
		end $$
delimiter ;

-- Editar --

delimiter $$
	create procedure sp_EditarDetallefacturas  (in detaFacId int, in factId int, in proId int)
		begin
			update Detallefacturas 
				set	
					facturaId = factId,
					productoId = proId
					where detallefacturaId  = detaFacId;
		end $$
delimiter ;

-- CRUD detalleCompras --

-- Agregar --
DELIMITER $$
create procedure sp_AgregarDetallecompras(in canC int, in proId int, in comId int)
	BEGIN
		insert into Detalledompras(cantidadCompra, productoId, compraId) values
			(canC, proId, comId);
    END $$
DELIMITER ;

-- Listar --
DELIMITER $$
create procedure sp_ListarDetallecompras()
	BEGIN
		select
			Detallecompras.detalleCompraId,
            Detallecompras.cantidadCompra,
            Detallecompras.productoId,
            Detallecompras.compraId
				from Detallecompras;
    END $$
DELIMITER ;

-- Buscar --
DELIMITER $$
create procedure sp_BuscarDetallecompras(in detCId int)
	BEGIN
		select * from Detallecompras
				where detalleCompraId = detCId;
    END $$
DELIMITER ;

-- Eliminar --
DELIMITER $$
create procedure sp_EliminarDetallecompras(in detCId int)
	BEGIN
		delete
			from Detallecompras
				where detalleCompraId = detCId;
    END $$
DELIMITER ;

-- Editar --
DELIMITER $$
create procedure sp_EditarDetallecompras(in detCId int, in canC int, in proId int, in comId int)
	BEGIN
		update Detallecompras
			set
				cantidadCompra2 = canC,
                productoId = proId,
                compraId = comId
					where detalleCompraId = detCId;
    END $$
DELIMITER ;