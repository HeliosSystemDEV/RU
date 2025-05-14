------------------------------------RAW---------------------------------------------

------------------------------------BER-------------------------------------
--PARA HACER UN DROP TABLE, PRIMERO HAY QUE ELIMINAR LOS ARCHIVOS INGESTADOS, NO HACERLO

--DROP TABLE IF EXISTS de_ber_1raw.sfb_bsrcl 

CREATE EXTERNAL TABLE de_ber_1raw.sfb_bsrcl(
	  glb_dtime string COMMENT '', 
	  sco_ident string COMMENT 'Código Cliente', 
	  sco_idere string COMMENT 'Código Cliente Relacionado', 
	  scotiredi string COMMENT 'Tipo_relación', 
	  estado string COMMENT 'Estado Relación ', 
	  scotirein string COMMENT 'Tipo Relación Inversa')
COMMENT ""
PARTITIONED BY (fecha_proceso VARCHAR(8)) 
STORED AS PARQUET 
LOCATION "hdfs://nameservice1/gp_datalake/ber/01-raw/sfb_bsrcl" 

------------------------------------BSC-------------------------------------
--PARA HACER UN DROP TABLE, PRIMERO HAY QUE ELIMINAR LOS ARCHIVOS INGESTADOS, NO HACERLO

--DROP TABLE IF EXISTS de_bsc_1raw.sfb_bsrcl 

CREATE EXTERNAL TABLE de_bsc_1raw.sfb_bsrcl(
	  glb_dtime string COMMENT '', 
	  sco_ident string COMMENT 'Código Cliente', 
	  sco_idere string COMMENT 'Código Cliente Relacionado', 
	  scotiredi string COMMENT 'Tipo_relación', 
	  estado string COMMENT 'Estado Relación ', 
	  scotirein string COMMENT 'Tipo Relación Inversa')
COMMENT ""
PARTITIONED BY (fecha_proceso VARCHAR(8)) 
STORED AS PARQUET 
LOCATION "hdfs://nameservice1/gp_datalake/bsc/01-raw/sfb_bsrcl" 

------------------------------------BSJ-------------------------------------
--PARA HACER UN DROP TABLE, PRIMERO HAY QUE ELIMINAR LOS ARCHIVOS INGESTADOS, NO HACERLO

--DROP TABLE IF EXISTS de_bsj_1raw.sfb_bsrcl 

CREATE EXTERNAL TABLE de_bsj_1raw.sfb_bsrcl(
	  glb_dtime string COMMENT '', 
	  sco_ident string COMMENT 'Código Cliente', 
	  sco_idere string COMMENT 'Código Cliente Relacionado', 
	  scotiredi string COMMENT 'Tipo_relación', 
	  estado string COMMENT 'Estado Relación ', 
	  scotirein string COMMENT 'Tipo Relación Inversa')
COMMENT ""
PARTITIONED BY (fecha_proceso VARCHAR(8)) 
STORED AS PARQUET 
LOCATION "hdfs://nameservice1/gp_datalake/bsj/01-raw/sfb_bsrcl" 

------------------------------------BSF-------------------------------------
--PARA HACER UN DROP TABLE, PRIMERO HAY QUE ELIMINAR LOS ARCHIVOS INGESTADOS, NO HACERLO

--DROP TABLE IF EXISTS de_bsf_1raw.sfb_bsrcl 

CREATE EXTERNAL TABLE de_bsf_1raw.sfb_bsrcl(
	  glb_dtime string COMMENT '', 
	  sco_ident string COMMENT 'Código Cliente', 
	  sco_idere string COMMENT 'Código Cliente Relacionado', 
	  scotiredi string COMMENT 'Tipo_relación', 
	  estado string COMMENT 'Estado Relación ', 
	  scotirein string COMMENT 'Tipo Relación Inversa')
COMMENT ""
PARTITIONED BY (fecha_proceso VARCHAR(8)) 
STORED AS PARQUET 
LOCATION "hdfs://nameservice1/gp_datalake/bsf/01-raw/sfb_bsrcl" 
