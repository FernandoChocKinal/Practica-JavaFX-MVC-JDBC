drop database if exists superKinalDB;
 
create database if not exists superKinalDB;
 
use  superKinalDB;

create table Clientes(
	clienteId int not null auto_increment,
    nombre varchar(30) not null,
    apellido varchar(30) not null,
    telefono varchar(15),
    direccion varchar(150) not null,
    nit varchar(15) default 'CF', 
    
    primary key PK_clienteId(clienteId)
); 

create table Cargos(
	cargoId int not null auto_increment,
    nombreCargo varchar(30) not null,
    descripcionCargo varchar(100) not null,
    
    primary key PK_cargoId(cargoId)
);

create table Compras (
	compraId int not null auto_increment,
    fechaCompra date not null,
    totalCompra decimal (10,2),
    
    primary key PK_compraId(compraId)
);

create table CategoriaProductos(
	categoriaProductoId int  not null auto_increment,
    nombreCategoria varchar(30) not null,
    descripcionCategoria varchar(100) not null,
    
    primary key PK_categoriaProductoId(categoriaProductoId)
);

create table Distribuidores(
	distribuidorId int not null auto_increment,
    nombreDistribuidor varchar (30)  not null,
    direccionDistribuidor varchar (200) not null,
    nitDistribuidor varchar (15) not null,
    telefonoDistribuidor varchar(15) not null,
    web varchar (50),
    
    primary key PK_distribuidorId(distribuidorId)
);

create table Productos(
	productoId int not null auto_increment,
    nombreProducto varchar(50) not null,
    descripcionProducto varchar(100) ,
    cantidadStock int not null,
    precioVentaUnitario decimal (10,2) not null,
    precioVentaMayor decimal(10,2) not null,
    precioCompra decimal(10,2) not null,
-- BloB 
	distribuidorId int not null,
	categoriaProductoId int not null,
    
    primary key PK_productoId(productoId),
	constraint FK_Productos_Distribuidores foreign key Productos(distribuidorId)
		references Distribuidores(distribuidorId),
	constraint FK_Productos_CategoriaProductos foreign key Productos(categoriaProductoId)
		references CategoriaProductos(categoriaProductoId)
);

create table DetallesCompras(
	detalleCompraId int not null auto_increment,
    cantidadCompra int not null,
    productoId int not null,
    compraId int not null,
    
    primary key PK_detalleCompraId(detalleCompraId),
    constraint FK_DetallesCompras_Productos foreign key DetallesCompras(productoId)
		references Productos(productoId),
    constraint FK_DetallesCompras_Compras foreign key DetallesCompras(compraId)
		references Compras(compraId)
    
);

create table Promociones(
	promocionId int not null auto_increment,
    precioPromocion decimal(10,2)not null,
    descripcionPromocion varchar(1000),
	fechaInicio date not null,
    fechaFinalizacion date not null,
    productoId int not null,
    
    primary key PK_promocionId(promocionId),
    constraint FK_Promociones_Productos foreign key Promociones(productoId)
		references Productos(productoId)
);

create table Empleados(
	empleadoId int not null auto_increment,
    nombreEmpleado varchar(30) not null,
    apellidoEmpleado varchar (30) not null,
    sueldo decimal (10,2) not null,
    horaEntrada time not null,
    horaSalida time not null,
    cargoId int not null,
    encargadoId int,
    
    primary key PK_Empleados(empleadoId),
    constraint FK_Empleados_Cargos foreign key Empleados(cargoId)
		references Cargos(cargoId),
	constraint FK_encargadoId foreign key Empleados(encargadoId)
		references Empleados(empleadoId)

);

create table Facturas(
	facturaId int not null auto_increment,
    fecha time not null,
    hora time not null,
    clienteId int not null,
	empleadoId int not null,
    total decimal (10,2),
    
    primary key PK_Facturas(facturaId),
    constraint FK_Facturas_Clientes foreign key Facturas(clienteId)
		references Clientes (clienteId),
	constraint PK_Facturas_Empleados foreign key Facturas(empleadoId)
		references Empleados(empleadoId)
);

create table DetallesFacturas(
	detalleFacturaId int not null auto_increment,
    facturaId int not null,
    productoId int not null,
    
    primary key PK_detalleFacturaId(detalleFacturaId),
    constraint FK_DetallesFacturas_Facturas foreign key DetallesFacturas(facturaId)
		references Facturas(facturaId),
	constraint FK_DetallesFacturas_Productos foreign key DetallesFacturas(productoId)
		references Productos(productoId)
);

create table TicketsSoportes(
	ticketSoporteId int not null auto_increment,
    descripcionTicket varchar(250) not null,
    estatus varchar (30) not null,
    clienteId int not null,
    facturaId int null,
    
	primary key PK_TicketsSoportes(ticketSoporteId),
    constraint FK_TicketsSoportes_Clientes foreign key TicketsSoportes(clienteId)
		references Clientes(clienteId),
	constraint FK_TicketsSoportes_Facturas foreign key TicketsSoportes(facturaId)
		references Facturas(facturaId)
	
);

DELIMITER $$ 
CREATE PROCEDURE sp_AgregarCliente(IN nom VARCHAR (30), IN ape VARCHAR (30), IN tel VARCHAR (15), IN dir VARCHAR (150), IN ni varchar(15))
BEGIN 	
	INSERT INTO Clientes (nombre, apellido,telefono,direccion,nit)VALUES 
		(nom, ape,tel,dir,ni);
END$$
DELIMITER ;

call sp_AgregarCliente('Guillen','Pepo','3234-0976','Guatemala','434665345');

DELIMITER $$ 
CREATE PROCEDURE sp_ListarClientes()
BEGIN 
	SELECT
		Clientes.clienteId,
		Clientes.nombre,
		Clientes.apellido,
		Clientes.telefono,
		Clientes.direccion,
		Clientes.nit
			FROM Clientes;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE sp_EliminarCliente(IN cliId INT)
BEGIN
	DELETE
	FROM Clientes 
		WHERE clienteId =  cliId;
END$$
DELIMITER ;

	
-- CALL sp_EliminarCliente(3);

DELIMITER $$ 
CREATE PROCEDURE sp_BuscarClientes(IN cliId INT)
BEGIN
	SELECT 	
		Clientes.clienteId,
		Clientes.nombre,
		Clientes.apellido,
		Clientes.telefono,
		Clientes.direccion,
		Clientes.nit
			FROM Clientes
			WHERE clienteId = cliId;
END$$
DELIMITER ;

-- CALL sp_BuscarClientes(2);

DELIMITER $$ 
CREATE PROCEDURE sp_EditarCliente(IN cliId INT,IN nom VARCHAR (30), IN ape VARCHAR (30), IN tel VARCHAR(15), IN dir VARCHAR(150), IN ni varchar(15))
BEGIN
	UPDATE Clientes
		SET
			nombre = nom,
			apellido = ape,
			telefono = tel,
			direccion = dir,
            nit = ni
			WHERE clienteId = cliId;
END$$
DELIMITER ;
CALL sp_EditarCliente(3, 'Choc' , 'Choquin', '3745-0984' , 'Coban','135713548');

call sp_ListarClientes();

-- Cargos 

DELIMITER $$ 
CREATE PROCEDURE sp_AgregarCargos(IN nom VARCHAR (30), IN des VARCHAR (100))
BEGIN 	
	INSERT INTO Cargos (nombreCargo , descripcionCargo)VALUES 
		(nom, des);
END$$
DELIMITER ;

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

DELIMITER $$ 
CREATE PROCEDURE sp_EliminarCargos(IN carId INT)
BEGIN
	DELETE
	FROM Cargos 
		WHERE cargoId =  carId;
END$$
DELIMITER ;

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

-- Compras 
DELIMITER $$ 
CREATE PROCEDURE sp_AgregarCompras(IN fec date, IN tot  decimal (10.2))
BEGIN 	
	INSERT INTO Compras (fechaCompra,totalCompra )VALUES 
		(fec, tot);
END$$
DELIMITER ;

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

DELIMITER $$ 
CREATE PROCEDURE sp_EliminarCompras(IN compId  INT)
BEGIN
	DELETE
	FROM Compras 
		WHERE compraId  =  compId;
END$$
DELIMITER ;

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

-- CategoriaProductos
DELIMITER $$ 
CREATE PROCEDURE sp_AgregarCategoriaProductos(IN nom VARCHAR (30), IN des VARCHAR (100))
BEGIN 	
	INSERT INTO CategoriaProductos (nombreCategoria , descripcionCategoria )VALUES 
		(nom, des);
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE sp_ListarCategoriaProductos()
BEGIN 
	SELECT
		CategoriaProductos.categoriaProductoId, 
		CategoriaProductos.nombreCategoria,  
		CategoriaProductos.descripcionCategoria  
			FROM CategoriaProductos;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE sp_EliminarCategoriaProductos(IN catId  INT)
BEGIN
	DELETE
	FROM CategoriaProductos 
		WHERE categoriaProductoId  =  catId;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE sp_BuscarCategoriaProductos(IN catId INT)
BEGIN
	SELECT 	
		CategoriaProductos.categoriaProductoId, 
		CategoriaProductos.nombreCategoria,  
		CategoriaProductos.descripcionCategoria  
			FROM CategoriaProductos
			WHERE categoriaProductoId  = catId;	
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE sp_EditarCategoriaProductos(IN catId INT,IN nom VARCHAR (30), IN des VARCHAR (100))
BEGIN
	UPDATE CategoriaProductos
		SET
			nombreCategoria  = nom,
			descripcionCategoria = ape
			WHERE categoriaProductoId = catId;
END$$
DELIMITER ;

-- Distribuidores 
DELIMITER $$ 
CREATE PROCEDURE sp_AgregarDistribuidores(IN nom VARCHAR (30),IN dir VARCHAR (200), IN nit varchar(15), IN tel varchar(15),  IN web varchar(50))
BEGIN 	
	INSERT INTO Distribuidores (nombreDistribuidor , direccionDistribuidor ,nitDistribuidor ,telefonoDistribuidor ,web )VALUES 
		(nom, dir,nit,tel,web);
END$$
DELIMITER ; 

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

DELIMITER $$ 
CREATE PROCEDURE sp_EliminarDistribuidores(IN disId INT)
BEGIN
	DELETE
	FROM Distribuidores 
		WHERE distribuidorId =  disId;
END$$
DELIMITER ;

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

-- Productos
DELIMITER $$
create procedure sp_AgregarProducto(in nom varchar(50),in des varchar(100),in can int, in preU decimal(10,2),in preM decimal(10,2),in preC decimal(10,2), in ima blob, in disId int, in catId int)
	BEGIN
		insert into Productos(nombreProducto, descripcionProducto, cantidadStock, precioUnitario, precioVentaMayor, precioCompra, imagenProducto, distribuidorId, categoriaProductosId ) values
			(nom, des, can, preU, preM, preC, ima, disId, catId);
	END $$
DELIMITER ;

DELIMITER $$
create procedure sp_ListarProducto()
	BEGIN 
		select * from Productos;
    END $$
DELIMITER ;

DELIMITER $$
create procedure sp_BuscarProducto(in proId int)
	BEGIN 
		select * from Productos
        where productoId = proId;
    END $$
DELIMITER ;

DELIMITER $$
create procedure sp_EliminarProducto(in proId int)
	BEGIN
		delete from Productos
			where productoId = proId;
    END $$
DELIMITER ;

DELIMITER $$
create procedure sp_EditarProducto(in proId int, in nom varchar(50),in des varchar(100),in can int, in preU decimal(10,2),in preM decimal(10,2),in preC decimal(10,2), in ima blob, in disId int, in catId int )
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
            categoriaProductosId = catId
            where productoId = proId;
    END $$
DELIMITER ;
-- DetalleCompra
DELIMITER $$
create procedure sp_AgregarDetalleCompra(in canC int, in proId int, in comId int)
	BEGIN
		insert into DetalleCompra(cantidadCompra, productoId, compraId) values
			(canC, proId, comId);
    END $$
DELIMITER ;

DELIMITER $$
create procedure sp_ListarDetalleCompra()
	BEGIN
		select
			DC.detalleCompraId,
            DC.cantidadCompra,
            DC.productoId,
            DC.compraId
				from DetalleCompra DC;
    END $$
DELIMITER ;

DELIMITER $$
create procedure sp_BuscarDetalleCompra(in detCId int)
	BEGIN
		select * from DetalleCompra
				where detalleCompraId = detCId;
    END $$
DELIMITER ;

DELIMITER $$
create procedure sp_EliminarDetalleCompra(in detCId int)
	BEGIN
		delete
			from DetalleCompra
				where detalleCompraId = detCId;
    END $$
DELIMITER ;

DELIMITER $$
create procedure sp_EditarDetalleCompra(in detCId int, in canC int, in proId int, in comId int)
	BEGIN
		update DetalleCompra
			set
				cantidadCompra = canC,
                productoId = proId,
                compraId = comId
					where detalleCompraId = detCId;
    END $$
DELIMITER ;
-- Promociones
DELIMITER $$
create procedure sp_AgregarPromociones(prePro decimal (10,2), desPro varchar (100), fecI date, fecF date, in proId int)
BEGIN
	insert into Promociones(precioPromocion, descripcionPromocion, fechaInicio, fechaFinalizacion, productoId )values
    (prePro,desPro, fecI, fecF, proId);
    
END $$
DELIMITER ;

DELIMITER $$
create procedure sp_ListarPromociones()
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

DELIMITER $$
create procedure sp_EliminarPromociones(in proId int)
BEGIN
	delete
		from Promociones
        where promocionId = proId;
END $$
DELIMITER ;

DELIMITER $$
create procedure sp_BuscarPromociones(in proId int)
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

DELIMITER $$
create procedure sp_EditarPromociones(in promId int, prePro decimal (10,2), desPro varchar (100), fecI date, fecF date, in proId int )
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

-- Empleados
delimiter $$
	create procedure sp_AgregarEmpleados (in nomEmp varchar (30), in apeEmp  varchar (30), in sud decimal (10, 2), in horEntr time, in horSld time, in cargId int, in encaId int)
		begin 
			insert into Empleados (nombreEmpleado , apellidoEmpleado, sueldo, horaEntrada, horaSalida, cargoId, encargadoId)
				values (nomEmp, apeEmp, sud, horEntr, horSld, cargId, encaId);
		end$$
delimiter ;


delimiter $$
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
delimiter ;
CALL sp_ListarEmpleados ();

delimiter $$
	create procedure sp_EliminarEmpleados (in empId int)
		begin
			delete
				from Empleados
					where empleadoId = empId;
		end $$
delimiter ;

delimiter $$
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
delimiter ;

delimiter $$
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
delimiter ;

-- FACTURAS --

delimiter $$
	create procedure sp_AgregarFacturas (in fech date, in hor time, in tot decimal (10, 2), in cliId int, in empId int)
		begin 
			insert into Facturas (fecha, hora, total, clienteId, empleadoId)
				values (fech, hor, tot, cliId, empId);
		end$$
delimiter ;

delimiter $$
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
delimiter ;

delimiter $$
	create procedure sp_EliminarFacturas (in facId int)
		begin
			delete
				from Facturas
					where facturaId = facId;
		end $$
delimiter ;

delimiter $$
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
delimiter ;

delimiter $$
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
delimiter ;

-- DETALLE FACTURA --
delimiter $$
	create procedure sp_AgregarDetalleFactura  (in factId int, in proId int)
		begin 
			insert into DetalleFactura  (facturaId, productoId)
				values (factId, proId);
		end$$
delimiter ;

delimiter $$
	create procedure sp_ListarDetalleFactura  ()
		begin 
			select 
				DetalleFactura.detalleFacturaId,
				DetalleFactura.facturaId,
                DetalleFactura.productoId
					FROM DetalleFactura;
		end $$
delimiter ;

delimiter $$
	create procedure sp_EliminarDetalleFactura   (in detaFacId int)
		begin
			delete
				from DetalleFactura  
					where detalleFacturaId  = detaFacId;
		end $$
delimiter ;

delimiter $$
	create procedure sp_BuscarDetalleFactura  (in detaFacId int)
		begin 
			select
				DetalleFactura.facturaId,
                DetalleFactura.productoId
					from DetalleFactura 
						where detalleFacturaId  = detaFacId;
		end $$
delimiter ;

delimiter $$
	create procedure sp_EditarDetalleFactura  (in detaFacId int, in factId int, in proId int)
		begin
			update DetalleFactura 
				set	
					facturaId = factId,
					productoId = proId
					where detalleFacturaId  = detaFacId;
		end $$
delimiter ;

-- TICKET SOPORTE --
delimiter $$
	create procedure sp_AgregarTicketSoporte (in descTick varchar (250), in est varchar (30), in cliId int, in facId int)
		begin 
			insert into Facturas (descripcionTicket, estatuts , clienteId , facturaId)
				values (descTick, est, cliId, facId);
		end$$
delimiter ;

delimiter $$
	create procedure sp_ListarTicketSoporte ()
		begin 
			select 
				TicketSoporte.ticketSoporteId ,
				TicketSoporte.descripcionTicket,
                TicketSoporte.estatuts,
                TicketSoporte.clienteId,
                TicketSoporte.facturaId
					FROM TicketSoporte;
		end $$
delimiter ;

delimiter $$
	create procedure sp_EliminarTicketSoporte  (in tickSopId int)
		begin
			delete
				from TicketSoporte 
					where ticketSoporteId = tickSopId;
		end $$
delimiter ;

delimiter $$
	create procedure sp_BuscarTicketSoporte (in tickSopId int)
		begin 
			select
				TicketSoporte.descripcionTicket,
                TicketSoporte.estatuts,
                TicketSoporte.clienteId,
                TicketSoporte.facturaId
					from TicketSoporte
						where ticketSoporteId = tickSopId;
		end $$
delimiter ;

delimiter $$
	create procedure sp_EditarTicketSoporte (in tickSopId int, in descTick varchar (250), in est varchar (30), in cliId int, in facId int)
		begin
			update TicketSoporte
				set	
					descripcionTicket = descTick,
					estatuts = est,
					clienteId = cliId,
					facturaId = facId
					where ticketSoporteId = tickSopId;
		end $$
delimiter ;
set global time_zone = '-6:00';
