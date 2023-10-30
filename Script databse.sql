create table FACTVUELO (
VUELO_KEY            int                  not null,
ORIGEN_KEY            int                  null,
   DESTINO_KEY              int                  null,
FECHA_KEY              int                  null, 
   AEROLINEA_KEY           int                  null,
   
   
   CANCELADO            NUMERIC             null,
   DESVIADO             NUMERIC             null,
   DEP_RETRASO             NUMERIC             null,
   SEGURIDAD_RETRASO        NUMERIC             null,
   ARR_RETRASO             NUMERIC             null,
   TRANSPORTISTA_RETRASO         NUMERIC                  null,
   RETRASO_CLIMA         NUMERIC                  null,
   NAS_RETRASO             NUMERIC                  null,
   RETRASO_AERONAVE			NUMERIC                  null,
   constraint PK_FACTVUELO primary key (VUELO_KEY)
);


create table DIMFECHA (
   FECHA_KEY              int                  not null,
   FECHA_ID               int                  null,
   FECHA_VUELO           char(18)             null,
   ANIO                 char(4)              null,
   TRIMESTRE              char(4)              null,
   MES               char(4)              null,
   DIA_MES           char(4)              null,
   DIA_SEMANA            char(4)              null,
   constraint PK_DIMFECHA primary key (FECHA_KEY)
);

create table DIMAEROLINEA (
   AEROLINEA_KEY           int                  not null,
   AEROLINEA_ID            int                  null,
   CODIGO                 char(5)              null,
   DESCRIPCION         char(50)             null,
   constraint PK_DIMAEROLINEA primary key (AEROLINEA_KEY)
)


create table DIMDESTINO (
   DESTINO_KEY              int                  not null,
   DESTINO_AEROPUERTO_ID        int                  null,
   DESTINO                 char(50)             null,
   NOMBRE_CIUDAD_DESTINO         char(50)             null,
   ESTADO_DESTINO            char(50)             null,
   constraint PK_DIMDESTINO primary key (DESTINO_KEY)
);



create table DIMORIGEN (
   ORIGEN_KEY            int                  not null,
   AEROPUERTO_ORIGEN_ID      int                  null,
   ORIGEN               char(50)             null,
   NOMBRE_CIUDAD_ORIGEN       char(50)             null,
   NOMBRE_ESTADO_ORIGEN      char(50)             null,
   constraint PK_DIMORIGEN primary key (ORIGEN_KEY)
)


alter table FACTVUELO
   add constraint FK_VUELO_RELATIONS_DIMFECHA foreign key (FECHA_KEY)
      references DIMFECHA (FECHA_KEY)

alter table FACTVUELO
   add constraint FK_VUELO_RELATIONS_DIMAEROLINEA foreign key (AEROLINEA_KEY)
      references DIMAEROLINEA (AEROLINEA_KEY)

alter table FACTVUELO
   add constraint FK_VUELO_RELATIONS_DIMDESTINO foreign key (DESTINO_KEY)
      references DIMDESTINO (DESTINO_KEY)

alter table FACTVUELO
   add constraint FK_VUELO_RELATIONS_DIMORIGEN foreign key (ORIGEN_KEY)
      references DIMORIGEN (ORIGEN_KEY)