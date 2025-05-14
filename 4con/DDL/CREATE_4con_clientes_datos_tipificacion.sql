--------------------------------------
------------------BSF----------------- 
DROP TABLE IF EXISTS de_bsf_4con.clientes_datos_tipificacion;

CREATE  TABLE de_bsf_4con.clientes_datos_tipificacion (
    id VARCHAR(255) NOT NULL,
    fecha_proceso varchar(8) NOT NULL,
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
    marca_vinculados_GP VARCHAR(1),
	PRIMARY KEY (id, fecha_proceso)
)
PARTITION BY HASH (id, fecha_proceso) PARTITIONS 16
COMMENT 'Datos Tipificacion'
STORED AS KUDU
TBLPROPERTIES (
    'kudu.master_addresses' = 'edh-master-01kc.root.corp, edh-master-02kc.root.corp, edh-master-03kc.root.corp',
    'kudu.num_tablet_replicas' = '3'
);

--------------------------------------
------------------BSJ----------------- 
DROP TABLE IF EXISTS de_bsj_4con.clientes_datos_tipificacion;

CREATE  TABLE de_bsj_4con.clientes_datos_tipificacion (
    id VARCHAR(255) NOT NULL,
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
    marca_vinculados_GP VARCHAR(1),
	PRIMARY KEY (id)
)
PARTITION BY HASH (id) PARTITIONS 16
COMMENT 'Datos Tipificacion'
STORED AS KUDU
TBLPROPERTIES (
    'kudu.master_addresses' = 'edh-master-01kc.root.corp, edh-master-02kc.root.corp, edh-master-03kc.root.corp',
    'kudu.num_tablet_replicas' = '3'
);

--------------------------------------
------------------BSC----------------- 

DROP TABLE IF EXISTS de_bsc_4con.clientes_datos_tipificacion;

CREATE TABLE de_bsc_4con.clientes_datos_tipificacion (
    id VARCHAR(255) NOT NULL,
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
    marca_vinculados_GP VARCHAR(1),
	PRIMARY KEY (id)
)
PARTITION BY HASH (id) PARTITIONS 16
COMMENT 'Datos Tipificacion'
STORED AS KUDU
TBLPROPERTIES (
    'kudu.master_addresses' = 'edh-master-01kc.root.corp, edh-master-02kc.root.corp, edh-master-03kc.root.corp',
    'kudu.num_tablet_replicas' = '3'
);

--------------------------------------
------------------BER----------------- 

DROP TABLE IF EXISTS de_ber_4con.clientes_datos_tipificacion;

CREATE TABLE de_ber_4con.clientes_datos_tipificacion (
    id VARCHAR(255) NOT NULL,
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
    marca_vinculados_GP VARCHAR(1),
	PRIMARY KEY (id)
)
PARTITION BY HASH (id) PARTITIONS 16
COMMENT 'Datos Tipificacion'
STORED AS KUDU
TBLPROPERTIES (
    'kudu.master_addresses' = 'edh-master-01kc.root.corp, edh-master-02kc.root.corp, edh-master-03kc.root.corp',
    'kudu.num_tablet_replicas' = '3'
);