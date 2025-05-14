-----------------3REF-----------------
------------------BSJ-----------------
--A EJECUTAR
DROP TABLE IF EXISTS de_bsj_3ref.clientes_datos_tipificacion;

CREATE EXTERNAL TABLE de_bsj_3ref.clientes_datos_tipificacion(
	cod_banco int, 
	desc_banco string, 
    id_cliente_core VARCHAR(13),
    estado_cliente VARCHAR(50),
    marca_empleado VARCHAR(4),
    marca_compra_cartera VARCHAR(4),
    marca_base_negativa VARCHAR(1),
    marca_cuentas_orden VARCHAR(1),
    marca_sucesiones_indivisas VARCHAR(4),
    CUIT_grupo_economico VARCHAR(11),
    grupo_economico VARCHAR(50),
    marca_vinculados_GP VARCHAR(1))
PARTITIONED BY ( 
  fecha_proceso varchar(8))
STORED AS PARQUET
LOCATION
  'hdfs://edh-master-01d.root.corp:8020/user/admin/dev/bsj/03-ref/omnicanalidad/cyberbank/clientes_datos_tipificacion'
;


-----------------3REF-----------------
------------------BER-----------------
--TABLA CREADA, PENDIENTE EL INSERT--
DROP TABLE IF EXISTS de_ber_3ref.clientes_datos_tipificacion;

CREATE EXTERNAL TABLE de_ber_3ref.clientes_datos_tipificacion(
	cod_banco int, 
	desc_banco string, 
    id_cliente_core VARCHAR(13),
    estado_cliente VARCHAR(50),
    marca_empleado VARCHAR(4),
    marca_compra_cartera VARCHAR(4),
    marca_base_negativa VARCHAR(1),
    marca_cuentas_orden VARCHAR(1),
    marca_sucesiones_indivisas VARCHAR(4),
    CUIT_grupo_economico VARCHAR(11),
    grupo_economico VARCHAR(50),
    marca_vinculados_GP VARCHAR(1))
PARTITIONED BY ( 
  fecha_proceso varchar(8))
STORED AS PARQUET
LOCATION
  'hdfs://edh-master-01d.root.corp:8020/user/admin/dev/ber/03-ref/omnicanalidad/cyberbank/clientes_datos_tipificacion'
;



-----------------3REF-----------------
------------------BSC-----------------
--A EJECUTAR
DROP TABLE IF EXISTS de_bsc_3ref.clientes_datos_tipificacion;

CREATE EXTERNAL TABLE de_bsc_3ref.clientes_datos_tipificacion(
	cod_banco int, 
	desc_banco string, 
    id_cliente_core VARCHAR(13),
    estado_cliente VARCHAR(50),
    marca_empleado VARCHAR(4),
    marca_compra_cartera VARCHAR(4),
    marca_base_negativa VARCHAR(1),
    marca_cuentas_orden VARCHAR(1),
    marca_sucesiones_indivisas VARCHAR(4),
    CUIT_grupo_economico VARCHAR(11),
    grupo_economico VARCHAR(50),
    marca_vinculados_GP VARCHAR(1))
PARTITIONED BY ( 
  fecha_proceso varchar(8))
STORED AS PARQUET
LOCATION
  'hdfs://edh-master-01d.root.corp:8020/user/admin/dev/bsc/03-ref/omnicanalidad/cyberbank/clientes_datos_tipificacion'
;



----------------------------------------------------------------
----------------------------------------------------------------
DROP TABLE IF EXISTS de_bsf_3ref.clientes_datos_tipificacion;

CREATE EXTERNAL TABLE de_bsf_3ref.clientes_datos_tipificacion(
	cod_banco int, 
	desc_banco string, 
    id_cliente_core VARCHAR(13),
    estado_cliente VARCHAR(50),
    marca_empleado VARCHAR(4),
    marca_compra_cartera VARCHAR(4),
    marca_base_negativa VARCHAR(1),
    marca_cuentas_orden VARCHAR(1),
    marca_sucesiones_indivisas VARCHAR(4),
    CUIT_grupo_economico VARCHAR(13),
    grupo_economico VARCHAR(50),
    marca_vinculados_GP VARCHAR(1))
PARTITIONED BY ( 
  fecha_proceso varchar(8))
STORED AS PARQUET
LOCATION
  'hdfs://edh-master-01d.root.corp:8020/user/admin/dev/bsf/03-ref/omnicanalidad/cyberbank/clientes_datos_tipificacion'
;

