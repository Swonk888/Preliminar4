use caso3;
delete from tipo_cambio where tipo_cambio_id >= 0;
delete from monedas where moneda_id >= 0;
delete from ventas where venta_id >= 0;

DBCC CHECKIDENT(ventas, RESEED, 0);


DBCC CHECKIDENT(monedas, RESEED, 0);
insert into monedas (nombre, simbolo, [default], acronimo, tipo_cambio_actual) values ('Colones', '₡', 1, 'CRC', 1);
insert into monedas (nombre, simbolo, [default], acronimo, tipo_cambio_actual) values ('Dólar Americano', '$', 540, 'USD', 532);
insert into monedas (nombre, simbolo, [default], acronimo, tipo_cambio_actual) values ('Euro', '€', 600, 'EUR', 590);

DBCC CHECKIDENT(tipo_cambio, RESEED, 0);
insert into tipo_cambio (fecha_inicio, fecha_final, moneda_id, [default], tipo_cambio, username, computer) values ('2003-03-12 12:12:00', '2003-05-12 12:12:00', 1, 1, 1, 'root','localhost');
insert into tipo_cambio (fecha_inicio, fecha_final, moneda_id, [default], tipo_cambio, username, computer) values ('2003-03-12 12:12:00', '2003-05-12 12:12:00', 2, 540, 532, 'root','localhost');
insert into tipo_cambio (fecha_inicio, fecha_final, moneda_id, [default], tipo_cambio, username, computer) values ('2003-03-12 12:12:00', '2003-05-12 12:12:00', 3, 600, 590, 'root','localhost');
