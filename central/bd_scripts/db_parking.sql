CREATE DATABASE DB_PARKING;
USE DB_PARKING;


CREATE TABLE T_RESERVA(

CODIGO_RESERVA VARCHAR(8) NOT NULL PRIMARY KEY,

FECHA_INICIO_RESERVA DATE NOT NULL,

HORA_INICIO_RESERVA DATETIME NOT NULL,

FECHA_FIN_RESERVA DATE NOT NULL,

HORA_FIN_RESERVA DATETIME NOT NULL,

NUMERO_PLACA_VEHICULO VARCHAR(7) NOT NULL,

CODIGO_PLAYA VARCHAR(5) NOT NULL,

ESPACIO_ASIGNADO INTEGER NOT NULL,

ESTADO_ESPACIO_ASIGNADO VARCHAR(1) NOT NULL,

ESTADO_RESERVA VARCHAR(1) NOT NULL);

 
set @@sql_mode='no_engine_substitution';

INSERT INTO T_RESERVA VALUES ('RESV0001','21/06/2018','08:00:00','21/06/2018','10:00:00','ABC-123','P0001',44,'O','R');

INSERT INTO T_RESERVA VALUES ('RESV0002','22/06/2018','09:00:00','21/06/2018','12:00:00','ABC-345','P0002',24,'O','R');

INSERT INTO T_RESERVA VALUES ('RESV0003','23/06/2018','10:00:00','21/06/2018','15:00:00','ABC-567','P0002',14,'O','R');

INSERT INTO T_RESERVA VALUES ('RESV0004','24/06/2018','11:00:00','21/06/2018','13:00:00','ABC-789','P0002',54,'O','R');

INSERT INTO T_RESERVA VALUES ('RESV0005','25/06/2018','12:00:00','21/06/2018','14:00:00','CDE-123','P0001',4,'O','R');

INSERT INTO T_RESERVA VALUES ('RESV0006','26/06/2018','13:00:00','21/06/2018','09:00:00','CDE-345','P0001',19,'O','R');

INSERT INTO T_RESERVA VALUES ('RESV0007','27/06/2018','14:00:00','21/06/2018','09:00:00','CDE-567','P0003',33,'O','R');

INSERT INTO T_RESERVA VALUES ('RESV0008','28/06/2018','15:00:00','21/06/2018','09:00:00','CDE-789','P0003',22,'O','R');

INSERT INTO T_RESERVA VALUES ('RESV0009','29/06/2018','16:00:00','21/06/2018','09:00:00','EFG-123','P0003',11,'O','R');

INSERT INTO T_RESERVA VALUES ('RESV0010','30/06/2018','17:00:00','21/06/2018','09:00:00','EFG-345','P0003',10,'O','R');

 

CREATE TABLE T_PLAYA_ESTACIONAMIENTO(

CODIGO_PLAYA VARCHAR(5) NOT NULL PRIMARY KEY,

DIRECCION_PLAYA VARCHAR(200) NOT NULL,

REFERENCIA_PLAYA VARCHAR(200) NOT NULL,

DISTRITO VARCHAR(100) NOT NULL,

LONGITUD_PLAYA DECIMAL(10,2) NOT NULL,

LATITUD_PLAYA DECIMAL(10,2) NOT NULL,

TIPO_PLAYA VARCHAR(20) NOT NULL,

CANTIDAD_DE_PISOS INTEGER NOT NULL,

ESPACIOS_TOTALES INTEGER NOT NULL,

ESPACIOS_A_RESERVAR INTEGER NOT NULL,

ESPACIOS_ABONADOS INTEGER NOT NULL);

 

INSERT INTO T_PLAYA_ESTACIONAMIENTO VALUES ('P0001','AV. AREQUIPA 4651', 'ALTURA DE ATV','MIRAFLORES',10.2,10.3,'MANUAL', 2, 100, 80, 20);

INSERT INTO T_PLAYA_ESTACIONAMIENTO VALUES ('P0002','AV. BENAVIDES 495', 'POR LA CLINICA SAN PABLO','MIRAFLORES', 10.2,10.3,'MANUAL', 2, 50, 40, 10);

INSERT INTO T_PLAYA_ESTACIONAMIENTO VALUES ('P0003','MALECON BALTA 626', 'POR EL COYOTE TATOO','MIRAFLORES', 10.2,10.3,'MANUAL', 2, 70, 60, 10);

 

CREATE TABLE T_CONDUCTOR (

DNI_CONDUCTOR VARCHAR(8) NOT NULL,

PASSWORD_CONDUCTOR VARCHAR(10) NOT NULL,

NOMBRE_CONDUCTOR VARCHAR(200) NOT NULL,

FECHA_NACIMIENTO DATE NOT NULL,

EMAIL_CONDUCTOR VARCHAR(200) NOT NULL,

CELULAR_CONDUCTOR VARCHAR(9) NOT NULL,

NUMERO_PLACA_VEHICULO NVARCHAR(200) NOT NULL

);

 

INSERT INTO T_CONDUCTOR VALUES ('12345678','Abc123456$','ALEXANDER OCAMPO HIDALGO','20/06/2018','CENTRALPARKING_DEMO@GMAIL.COM','999999999','ABC-123');

INSERT INTO T_CONDUCTOR VALUES ('22345679','@zy999999A','FRANCISCO DIAZ MANTILLA','21/06/2018','CENTRALPARKING_DEMO2@GMAIL.COM','999999998','CDE-123');

 

 

CREATE TABLE T_TARIFA(

ID_TARIFA INTEGER PRIMARY KEY NOT NULL,

TARIFA_ANTIGUA DECIMAL(10,2) NOT NULL,

FECHA_CREACION DATE NOT NULL,

TARIFA_NUEVA DECIMAL(10,2) NOT NULL,

FECHA_ACTUALIZACION DATE NOT NULL,

OBSERVACION_TARIFA VARCHAR(200) NOT NULL,

TIEMPO_VIGENCIA_TARIFA_ACTUALIZADA INTEGER NOT NULL,

ESTADO_TARIFA VARCHAR(10) NOT NULL,

CODIGO_PLAYA VARCHAR(5) NOT NULL

);

 

INSERT INTO T_TARIFA VALUES (1,10.00,'27/06/2018',8.50,'28/06/2018','LA TARIFA FUE CAMBIADA DEBIDO A...',1,'CAMBIADA','P0001');

INSERT INTO T_TARIFA VALUES (2,8.00,'27/06/2018',4.50,'28/06/2018','LA TARIFA FUE CAMBIADA DEBIDO A...',1,'CAMBIADA','P0002');

INSERT INTO T_TARIFA VALUES (3,9.00,'27/06/2018',5.50,'28/06/2018','LA TARIFA FUE CAMBIADA DEBIDO A...',1,'CAMBIADA','P0003');

 

CREATE TABLE T_AFLUENCIA(

CODIGO_MOVIMIENTO  VARCHAR( 10) NOT NULL PRIMARY KEY,

FECHA_MOVIMIENTO DATE NOT NULL,

PERMANENCIA_15_MINUTOS INTEGER NOT NULL,

PERMANENCIA_30_MINUTOS INTEGER NOT NULL,

PERMANENCIA_45_MINUTOS INTEGER NOT NULL,

PERMANENCIA_1_HORA INTEGER NOT NULL,

PERMANENCIA_2_HORA INTEGER NOT NULL,

PERMANENCIA_3_HORA INTEGER NOT NULL,

PERMANENCIA_4_HORA INTEGER NOT NULL,

CODIGO_PLAYA VARCHAR(8) NOT NULL

);

 

 

INSERT INTO T_AFLUENCIA VALUES ('MOV00001','01/04/2018',28,212,119,217,139,3,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00002','02/04/2018',25,137,133,85,120,11,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00003','03/04/2018',55,160,63,132,102,19,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00004','04/04/2018',33,127,130,76,119,17,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00005','05/04/2018',38,154,128,104,113,17,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00006','06/04/2018',40,168,98,145,117,17,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00007','07/04/2018',30,232,164,182,185,18,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00008','08/04/2018',49,205,208,175,158,8,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00009','09/04/2018',55,129,51,156,127,17,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00010','10/04/2018',49,158,128,73,103,11,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00011','11/04/2018',43,149,88,93,95,12,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00012','12/04/2018',45,137,54,175,136,18,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00013','13/04/2018',48,153,112,193,108,27,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00014','14/04/2018',45,188,180,140,116,12,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00015','15/04/2018',24,212,92,262,195,11,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00016','16/04/2018',55,146,144,75,124,9,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00017','17/04/2018',49,172,94,122,90,17,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00018','18/04/2018',63,145,89,94,95,15,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00019','19/04/2018',70,54,34,172,144,14,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00020','20/04/2018',59,179,98,109,93,32,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00021','21/04/2018',82,122,100,284,145,13,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00022','22/04/2018',46,234,92,260,164,18,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00023','23/04/2018',57,146,97,120,87,19,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00024','24/04/2018',67,142,111,83,97,22,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00025','25/04/2018',68,157,107,101,83,26,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00026','26/04/2018',57,180,100,82,67,16,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00027','27/04/2018',107,152,102,108,102,24,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00028','28/04/2018',71,147,199,207,173,24,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00029','29/04/2018',53,191,81,254,148,9,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00030','30/04/2018',39,123,138,112,128,15,0,'P0001');

INSERT INTO T_AFLUENCIA VALUES ('MOV00031','01/04/2018',149,121,36,14,1,1,0,'P0002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00032','02/04/2018',110,82,52,39,8,2,1,'P0002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00033','03/04/2018',123,103,48,23,6,2,0,'P0002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00034','04/04/2018',123,99,32,21,5,0,0,'P0002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00035','05/04/2018',107,101,42,27,8,3,0,'P0002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00036','06/04/2018',113,113,35,33,5,0,0,'P0002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00037','07/04/2018',162,135,37,38,7,1,0,'P0002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00038','08/04/2018',131,114,37,17,3,0,0,'P0002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00039','09/04/2018',118,97,34,28,7,0,0,'P0002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00040','10/04/2018',106,136,40,23,3,1,0,'P0002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00041','11/04/2018',120,123,39,26,7,1,2,'P00002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00042','12/04/2018',129,103,41,33,16,3,0,'P0002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00043','13/04/2018',163,104,40,22,10,1,0,'P0002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00044','14/04/2018',120,132,47,18,3,1,1,'P0002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00045','15/04/2018',212,136,31,19,5,1,0,'P0002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00046','16/04/2018',199,132,48,32,11,3,0,'P0002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00047','17/04/2018',189,121,44,20,5,0,0,'P0002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00048','18/04/2018',121,113,32,13,7,0,0,'P0002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00049','19/04/2018',118,125,41,20,6,2,0,'P0002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00050','20/04/2018',112,145,36,31,10,0,0,'P0002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00051','21/04/2018',156,144,43,32,11,1,1,'P0002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00052','22/04/2018',141,139,51,27,9,0,0,'P0002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00053','23/04/2018',165,145,52,35,6,0,0,'P0002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00054','24/04/2018',187,123,51,14,10,1,0,'P0002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00055','25/04/2018',193,130,31,22,20,2,0,'P0002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00056','26/04/2018',179,113,46,21,7,3,2,'P0002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00057','27/04/2018',193,101,44,14,10,2,0,'P0002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00058','28/04/2018',146,136,47,33,9,0,0,'P00002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00059','29/04/2018',132,140,39,17,6,0,0,'P00002');

INSERT INTO T_AFLUENCIA VALUES ('MOV00060','30/04/2018',118,116,43,21,11,0,0,'P00002');