delete from ventas where venta_id >= 0;
delete from productos_x_materiales where materialpp_id >= 0;
delete from productos_producidos where producto_mat_id >= 0;
delete from productos where producto_id >= 0;
delete from materiales_para_producto where materialpp_id >= 0;
delete from recursos_materiales where recurso_id >= 0;
delete from desecho_movimientos where w_mov_id >= 0;
delete from proceso where proceso_id >= 0;
delete from contrato where contrato_id >= 0;
delete from usuarios where user_id >= 0;
delete from tipo_recipientes where tiporec_id >= 0;
delete from tipo_movimiento where tipomov_id >= 0;
delete from local_ev where ev_id >= 0;
delete from recolectores where recolector_id >= 0;
delete from productores_residuos where productor_id >= 0;
delete from contacto_x_actor where actor_id >= 0
delete from contacto_value where contacto_id >= 0;
delete from actores_x_contrato where actor_id >=0;
delete from actores where actor_id >= 0;
delete from tipo_contactos where tipo_id >= 0;
delete from desechos where desecho_id >= 0;
delete from tipo_desecho where tipodes_id >= 0;
delete from regiones where region_id >= 0;
delete from ubicaciones where ubicacion_id >= 0;
delete from paises where pais_id >= 0;
delete from Estado where estado_id >= 0;
delete from ciudades where ciudad_id >= 0;


DBCC CHECKIDENT(ventas, RESEED, 0);

DBCC CHECKIDENT(ciudades, RESEED, 0);
insert into ciudades (nombre, zipcode) values ('Los Angeles', '10011');
insert into ciudades (nombre, zipcode) values ('San Jose', '20311');
insert into ciudades (nombre, zipcode) values ('Stopera', '51101');


DBCC CHECKIDENT(Estado, RESEED, 0);
insert into Estado (nombre, ciudad_id) values ('San Jose', 2);
insert into Estado (nombre, ciudad_id) values ('Califronia', 1);
insert into Estado (nombre, ciudad_id) values ('Amsterdam', 3);

DBCC CHECKIDENT(paises, RESEED, 0);
insert into paises (nombre, estado_id) values ('Costa Rica', 1);
insert into paises (nombre, estado_id) values ('Holanda', 3);
insert into paises (nombre, estado_id) values ('USA', 2);

DBCC CHECKIDENT(ubicaciones, RESEED, 0);
insert into ubicaciones (pais_id, descripcion) values (1, 'Atlantico');
insert into ubicaciones (pais_id, descripcion) values (2, 'Pacifico');
insert into ubicaciones (pais_id, descripcion) values (3, 'Medio Oeste');

DBCC CHECKIDENT(regiones, RESEED, 0);
insert into regiones (nombre, ciudad_id, estado_id, pais_id) values ('Atlantico', 2, 1, 1);
insert into regiones (nombre, ciudad_id, estado_id, pais_id) values ('Pacifico', 3, 3, 2);
insert into regiones (nombre, pais_id) values ('Medio Oeste', 3);

DBCC CHECKIDENT(tipo_desecho, RESEED, 0);
insert into  tipo_desecho (nombre, reciclable) values ('plasticos', 1);
insert into  tipo_desecho (nombre, reciclable) values ('nuclear', 1);
insert into  tipo_desecho (nombre, reciclable) values ('organico', 1);

DBCC CHECKIDENT(desechos, RESEED, 0);
insert into desechos (nombre, unidad, tipodes_id) values ('botella', 'unitario', 1);
insert into desechos (nombre, unidad, tipodes_id) values ('uranio', 'kg', 2);
insert into desechos (nombre, unidad, tipodes_id) values ('cascaras de banana', 'kg', 3);

DBCC CHECKIDENT(tipo_contactos, RESEED, 0);
insert into tipo_contactos (nombre) values ('telefono');
insert into tipo_contactos (nombre) values ('correo');
insert into tipo_contactos (nombre) values ('fax');

DBCC CHECKIDENT(actores, RESEED, 0);
insert into actores (descripcion, region_id, balance) values ('gobierno', 1, 99999.99);
insert into actores (descripcion, region_id, balance) values ('municipalidad', 2, 100000.10);
insert into actores (descripcion, region_id, balance) values ('ayuntamiento', 3, 312.12);

DBCC CHECKIDENT(contacto_value, RESEED, 0);
insert into contacto_value (tipo_id, value, posttime, enable) values (2, 'hola@gmail.com', '2003-03-12 12:12:00', 1);
insert into contacto_value (tipo_id, value, posttime, enable) values (1, '22317508', '2004-03-12 01:12:00', 1);
insert into contacto_value (tipo_id, value, posttime, enable) values (3, '27671111', '2005-03-12 00:12:00', 1);


insert into contacto_x_actor (actor_id, contacto_id) values (1, 2);
insert into contacto_x_actor (actor_id, contacto_id) values (2, 3);
insert into contacto_x_actor (actor_id, contacto_id) values (1, 3);

DBCC CHECKIDENT(productores_residuos, RESEED, 0);
insert into productores_residuos (nombre, horario, porcentaje_carbon, balance, ubicaicon_id, contacto_id) values ('Taco Bell', '00:12:00', '0.3', '500000.80', 2, 1);
insert into productores_residuos (nombre, horario, porcentaje_carbon, balance, ubicaicon_id, contacto_id) values ('KFC', '12:30:00', '0.8', '1100000.80', 3, 2);
insert into productores_residuos (nombre, horario, porcentaje_carbon, balance, ubicaicon_id, contacto_id) values ('Barcelo', '21:15:00', '0.8', '90012100.5', 1, 3);

-- falta correr
DBCC CHECKIDENT(recolectores, RESEED, 3);
insert into recolectores (productor_id, nombre, ubicacion_id, balance) values (1, 'CoopeSan', 1, 1000.50);
insert into recolectores (productor_id, nombre, ubicacion_id, balance) values (2, 'TranSan', 3, 8000.0);
insert into recolectores (productor_id, nombre, ubicacion_id, balance) values (3, 'NationTran', 2, 302.11);

DBCC CHECKIDENT(local_ev, RESEED, 0);
insert into local_ev (telefono, ubicacion_id) values (24097689, 1);
insert into local_ev (telefono, ubicacion_id) values (22097689, 1);
insert into local_ev (telefono, ubicacion_id) values (79093, 2);
insert into local_ev (telefono, ubicacion_id) values (7809348, 2);
insert into local_ev (telefono, ubicacion_id) values (1290934, 3);

DBCC CHECKIDENT(tipo_movimiento, RESEED, 0);
insert into tipo_movimiento (mov_tipo, descripcion) values (1, 'recolección satisfactoria');
insert into tipo_movimiento (mov_tipo, descripcion) values (2, 'recolección con daños');
insert into tipo_movimiento (mov_tipo, descripcion) values (3, 'recolección no aprobada');
insert into tipo_movimiento (mov_tipo, descripcion) values (4, 'chequeo en sitio');
insert into tipo_movimiento (mov_tipo, descripcion) values (5, 'chequeo en planta');

-- CAMBIAR EL TIPO DE DATO DE MEDIDA A VARCHAR
DBCC CHECKIDENT(tipo_recipientes, RESEED, 0);
insert into tipo_recipientes (nombre, capacidad, medida, marca, modelo, cant_uso, cant_out, cant_reparacion, cant_disponible) values ('Químicos', 1, 'Litros', 'BRAND', '2.0', 25, 12, 43, 260);
insert into tipo_recipientes (nombre, capacidad, medida, marca, modelo, cant_uso, cant_out, cant_reparacion, cant_disponible) values ('Cartón', 10, 'Kg', 'BRAND', '3.1.0', 42, 3, 56, 764);
insert into tipo_recipientes (nombre, capacidad, medida, marca, modelo, cant_uso, cant_out, cant_reparacion, cant_disponible) values ('Papel', 50, 'Kg', 'BRAND', '1.0', 65, 12, 23, 500);
insert into tipo_recipientes (nombre, capacidad, medida, marca, modelo, cant_uso, cant_out, cant_reparacion, cant_disponible) values ('Orgánico', 50, 'Kg', 'BRAND', '2.0', 74, 10, 54, 946);

DBCC CHECKIDENT(usuarios, RESEED, 0);
insert into usuarios (nombre, apellido, apellido2, email, [enable]) values ('Erika','Cerdas','Mejias','ecerdas@gmail.com', 1);
insert into usuarios (nombre, apellido, apellido2, email, [enable]) values ('Kevin','Chang','Chang','kchang@gmail.com', 1);
insert into usuarios (nombre, apellido, apellido2, email, [enable]) values ('Carlos','Mejias','Mejias','mejias2@gmail.com', 1);

DBCC CHECKIDENT(contrato, RESEED, 9);
insert into contrato (descripcion, recolector_id, ubicacion_id, porcentaje) values ('Contrato entre KFC y esencial verde', 6, 3, 0.1);
insert into contrato (descripcion, recolector_id, ubicacion_id, porcentaje) values ('Contrato entre TacoBell y esencial verde', 5, 1, 0.25);
insert into contrato (descripcion, recolector_id, ubicacion_id, porcentaje) values ('Contrato entre Barcelo y esencial verde', 4, 2, 0.05);

DBCC CHECKIDENT(proceso, RESEED, 3);
insert into proceso (volumen, clasificacion, ev_id, fecha, estado, costo, contrato_id) values (400000.00, 1, 1, '2023-05-01 09:45:00','en proceso', 80, 12);
insert into proceso (volumen, clasificacion, ev_id, fecha, estado, costo, contrato_id) values (350000.00, 2, 2, '2022-05-02 10:45:00','en proceso', 25, 10);
insert into proceso (volumen, clasificacion, ev_id, fecha, estado, costo, contrato_id) values (670000.00, 1, 5, '2022-02-13 09:45:00','terminado', 14, 11);

DBCC CHECKIDENT(desecho_movimientos, RESEED, 6);
insert into desecho_movimientos (posttime, responsible_name, ubicacion_id, recolector_id, productor_id, ev_id, tipomov_id, tiporec_id, reci_desecho_cantidad, user_id, computer,[user], proceso_id) values ('2023-04-30 07:45:00', 'Karla Sanchez', 1, 4, 3, 1, 1, 1, 1.6, 1, 'localhost', 'root', 6);
insert into desecho_movimientos (posttime, responsible_name, ubicacion_id, recolector_id, productor_id, ev_id, tipomov_id, tiporec_id, reci_desecho_cantidad, user_id, computer,[user], proceso_id) values ('2023-05-01 07:45:00', 'Carlos Arias',  2, 6, 1, 3, 2, 2, 9, 2, 'localhost', 'root', 4);
insert into desecho_movimientos (posttime, responsible_name, ubicacion_id, recolector_id, productor_id, ev_id, tipomov_id, tiporec_id, reci_desecho_cantidad, user_id, computer,[user], proceso_id) values ('2023-04-30 07:45:00', 'Jesus Sanchez', 3, 5, 2, 5, 3, 3, 45, 3, 'localhost', 'root', 5);

DBCC CHECKIDENT(recursos_materiales, RESEED, 3);
insert into recursos_materiales (descripcion) values ('Papel');
insert into recursos_materiales (descripcion) values ('Carton');
insert into recursos_materiales (descripcion) values ('plastico');

DBCC CHECKIDENT(materiales_para_producto, RESEED, 3);
insert into materiales_para_producto (posttime, cantidad, recurso_id, medida, w_mov_id) values ('2003-03-12 12:12:00', 12.1, 5, 'gramos', 8);
insert into materiales_para_producto (posttime, cantidad, recurso_id, medida, w_mov_id) values ('2004-03-11 07:12:00', 15.1, 6, 'gramos', 9);
insert into materiales_para_producto (posttime, cantidad, recurso_id, medida, w_mov_id) values ('2003-12-11 00:12:00', 11.4, 4, 'gramos', 7);

DBCC CHECKIDENT(productos, RESEED, 1);
insert into productos (descripcion, precio) values ('Papel', 510.12);
insert into productos (descripcion, precio) values ('Botella', 301.21);
insert into productos (descripcion, precio) values ('Caja', 100.5);

DBCC CHECKIDENT(productos_producidos, RESEED, 0);
insert into productos_producidos (cantidad, posttime, computer, [user], producto_id, user_id, contrato_id) values (10, '2003-03-12 12:12:00', 'localhost', 'root', 2, 1, 10);
insert into productos_producidos (cantidad, posttime, computer, [user], producto_id, user_id, contrato_id) values (10, '2004-03-11 07:12:00', 'localhost', 'root', 3, 2, 11);
insert into productos_producidos (cantidad, posttime, computer, [user], producto_id, user_id, contrato_id) values (10, '2003-12-11 00:12:00', 'localhost', 'root', 4, 2, 12);

insert into productos_x_materiales (materialpp_id, producto_mat_id, cantidad) values (4, 2, 13.12);
insert into productos_x_materiales (materialpp_id, producto_mat_id, cantidad) values (5, 3, 100.1);
insert into productos_x_materiales (materialpp_id, producto_mat_id, cantidad) values (6, 3, 1234.12);

--use [caso3.1]

