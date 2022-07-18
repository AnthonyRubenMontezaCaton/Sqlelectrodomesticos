create database dbElectrodomesticos;
use dbElectrodomesticos;

create table CLIENTE
(
	CODCLI char(4),
    NOMCLI varchar(60),
    APECLI varchar(80),
    EMACLI varchar(80),
    CELCLI char(9),
    DIRCLI varchar(70),
    ESTCLI char(1) not null default 'A',
    constraint CODCLI_PK primary key(CODCLI)
);

create table VENDEDOR
(
	CODVEND char(4),
    NOMVEND varchar(60),
    APEVEND varchar(80),
    EMAVEND varchar(80),
    CELVEND char(9),
    DIRVEND varchar(70),
    ESTVEND char(1) not null default 'A',
    constraint CODVEND_PK primary key(CODVEND)
);

create table PRODUCTO
(
	CODPRO char(5),
    DESCPRO varchar(80),
    CATPRO char(1),
    PREPRO decimal(8,2),
    STOCKPRO int,
    ESTPRO char(1) not null default 'A',
    constraint CODPRO_PK primary key (CODPRO)
);

create table PROVEEDOR
(
	CODPROV char(5),
    RAZSOCPROV varchar(90),
    RUCPROV varchar(11),
    EMAPROV varchar(70),
    ESTPROV char(1) not null default 'A',
    constraint CODPROV_PK primary key(CODPROV)
);

create table VENTA
(
	CODVEN char(5),
    FECVEN datetime,
	CODCLI char(4),
    CODVEND char(4),
    ESTVEN char(1) not null default 'A',
    constraint CODVEN_PK primary key(CODVEN)
);

create table VENTADETALLE
(
	IDVENDET int,
	CODVEN char(5),
	CODPRO char(5),
	CANTPRO int,
	constraint IDVENDET_PK primary key (IDVENDET)
);

create table COMPRA
(
	CODCOM char(5),
    FECCOM datetime,
    CODVEND char(4),
    CODPROV char(5),
    ESTCOM char(1) not null default 'A',
    constraint CODCOM_PK primary key(CODCOM)
);

create table COMPRADETALLE
(
	IDCOMDET int auto_increment,
    CODCOM char(5),
    CODPRO char(5),
    CANTPRO int,
    constraint IDCOMDET_PK primary key(IDCOMDET)
);

/* Relacionar VENDEDOR_COMPRA */
ALTER TABLE COMPRA 
	ADD CONSTRAINT COMPRA_VENDEDOR FOREIGN KEY COMPRA_VENDEDOR (CODVEND)REFERENCES VENDEDOR (CODVEND);

/* Relacionar VENDEDOR_VENTA */
ALTER TABLE VENTA 
	ADD CONSTRAINT VENTA_VENDEDOR FOREIGN KEY VENTA_VENDEDOR (CODVEND)REFERENCES VENDEDOR (CODVEND);

/* Relacionar CLIENTE_VENTA */
ALTER TABLE VENTA 
	ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY VENTA_CLIENTE (CODCLI)REFERENCES CLIENTE (CODCLI);
    
/* Relacionar VENTADETALLE_VENTA */
ALTER TABLE VENTADETALLE 
	ADD CONSTRAINT VENTADETALLE_VENTA FOREIGN KEY VENTADETALLE_VENTA(CODVEN)REFERENCES VENTA (CODVEN);

/* Relacionar VENTADETALLE_PRODUCTO */
ALTER TABLE VENTADETALLE 
ADD CONSTRAINT VENTADETALLE_PRODUCTO FOREIGN KEY VENTADETALLE_PRODUCTO (CODPRO) REFERENCES PRODUCTO (CODPRO);

/* Relacionar COMPRADETALLE_PRODUCTO */
ALTER TABLE COMPRADETALLE 
	ADD CONSTRAINT COMPRADETALLE_PRODUCTO FOREIGN KEY COMPRADETALLE_PRODUCTO (CODPRO) REFERENCES PRODUCTO (CODPRO);

/* Relacionar COMPRADETALLE_COMPRA */
ALTER TABLE COMPRADETALLE 
	ADD CONSTRAINT COMPRADETALLE_COMPRA FOREIGN KEY COMPRADETALLE_COMPRA (CODCOM)REFERENCES COMPRA (CODCOM);
    
 /* Relacionar COMPRA_PROVEEDOR */   
ALTER TABLE COMPRA 
	ADD CONSTRAINT COMPRA_PROVEEDOR FOREIGN KEY COMPRA_PROVEEDOR (CODPROV)REFERENCES PROVEEDOR (CODPROV);

INSERT INTO CLIENTE
(CODCLI, NOMCLI, APECLI, EMACLI, CELCLI, DIRCLI)
VALUES
("CLO1","Juana","Campos Ortiz","juana.campos@gmail.com","987485152","AV. Miraflores"),
("CLO2","Sofia","Barrios Salcedo","sofia.barrientos@gmail.com","","Jr. Huallaga"),
("CLO3","Claudio","Perez luna","claudio.perez@gmail.com","984512147","AV. Libertadores"),
("CLO4","Marcos","Avlia Marcos","marcos.avila@gmail.com","","Calle Huallaga"),
("CLO5","Anastacio","Salomon inti","anastacio.solano@gmail.com","","JR. San Martin");

INSERT INTO VENDEDOR
(CODVEND, NOMVEND, APEVEND, EMAVEND, CELVEND, DIRVEND)
VALUES
("VEN1","Gloria","Carrizales Perez","gloria.carrizlaes@gmail.com","984574123","Calle las Beingoleas"),
("VEN2","Gabriel","Lozano Lombardi","gabriel.loazada@gmail.com","974512368","AV. LOS Girasoles"),
("VEN3","Gilberto","Martinez Guerra","gilverto.martinez@gmail.com","","JR. Los palomares");

INSERT INTO PROVEEDOR
(CODPROV, RAZSOCPROV, RUCPROV, EMAPROV)
VALUES
("PRV01","LG Corportation","87542136951","informes@lg.com.pe"),
("PRV02","SONY","45213698741","informes@sony.com.pe"),
("PRV03","SAMSUNG","85321697661","informes@samsung.com.pe"),
("PRV04","OSTER SRL","55663214478","informes@oster.com.pe"),
("PRV05","ASUS","99663325478","informes@asus.com.pe");

INSERT INTO PRODUCTO
(CODPRO, DESCPRO, CATPRO, PREPRO,STOCKPRO)
VALUES
("PRO01","Refrigeradora LG side by side","1","4149","15"),
("PRO02","Refrigeradora SBS 602L","1","3599","10"),
("PRO03","Refrigeradora top mount 500l","1","2799","8"),
("PRO04","TV Samsumg UHD 55' ","2","1799","25"),
("PRO05","Televisor 65' LG UHD 4K","2","2999","20"),
("PRO06","TV CRYSTAL UDH 55' ","2","2299","7"),
("PRO07","ASUS X415KJA Core i3 10ºGen 14'","3","1099","17"),
("PRO08","Lenovo idealpat 5i Intel core i7 14'","3","3099","10"),
("PRO09","Laptop HP 15-DW1085la Intel Core i3","3","1600","15"),
("PRO10","Galaxi A52 128GB","4","1200","25"),
("PRO11","iPhone 11 64GB Morado","4","2600","30"),
("PRO12","Poco X3 GT 5G 256GB 8GB","4","1450","20");

/* consulta: Datos del cliente, producto comprado, dinero canselado */
select
CODCLI, 
NOMCLI,
APECLI
CODPRO,
DESCPRO,
PREPRO
from CLIENTE 
INNER JOIN PRODUCTO;

/* consulta: Datos de los proveedores, productos con la respectiva cantidad comprada */
select 
CODPROV,
RAZSOCPROV,
DESCPRO,
PREPRO,
STOCKPRO
from
PROVEEDOR 
inner join PRODUCTO;

/* consulta: Datos de los vendedores con los respectivos montos totales de venta realizados. */
select 
NOMVEND,
APEVEND,
EMAVEND,
CODVEN
from
VENDEDOR 
inner join VENTA;