create database SuperKinalDB;

use SuperKinalDB;

create table Clientes(
	clienteId int not null auto_increment,
    nombre varchar(30) not null,
    apellido varchar(30) not null,
    telefono varchar(15) not null,
    direccion varchar(200) not null,
    primary key Pk_clienteId (clienteId)
);

insert into Clientes(nombre, apellido, telefono, direccion) values
	('Mario', 'Godoy', '4455-8899', 'Capital'),
    ('Carlos', 'Perez', '7532-8964', 'Capital'),
    ('Elmer', 'Ruiz', '1234-5678', 'Capital');
    
select * from Clientes;


-- CRUD CLIENTES
-- Agregar
DELIMITER $$
create procedure sp_agregarCliente(nom varchar(30), ape varchar(30), tel varchar(15), dir varchar(200))
BEGIN
	insert into Clientes(nombre, apellido, telefono, direccion) values
		(nom, ape, tel, dir);
END$$
DELIMITER ;

-- Listar
DELIMITER $$
create procedure sp_listarClientes()
BEGIN
	select * from
		Clientes;
END$$
DELIMITER ;

-- Eliminar
DELIMITER $$
create procedure sp_eliminarCliente(cliId int)
BEGIN
	delete from Clientes where clienteId = cliId;
END$$
DELIMITER ;

-- Buscar
DELIMITER $$
create procedure sp_buscarCliente(cliId int)
BEGIN
	select * from Clientes where clienteId = cliId;
END$$
DELIMITER ;

-- Editar
DELIMITER $$
create procedure sp_editarCliente(cliId int, nom varchar(30), ape varchar(30), tel varchar(15), dir varchar(200))
BEGIN
	update Clientes set
		nombre = nom,
        apellido = ape,
        telefono = tel,
        direccion = dir
			where clienteId = cliId;
END$$
DELIMITER ;