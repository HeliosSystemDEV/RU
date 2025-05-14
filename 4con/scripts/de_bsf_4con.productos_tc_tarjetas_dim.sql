CREATE EXTERNAL TABLE de_bsf_4con.productos_tc_tarjetas_dim (
  nro_tarjeta VARCHAR(16) NOT NULL COMMENT ' Número de Tarjeta', 
  cod_marca SMALLINT NULL COMMENT 'Código marca', 
  desc_marca VARCHAR(6) NULL COMMENT 'Descripcion marca - Visa/Master', 
  id_tarjeta VARCHAR(50) NULL COMMENT 'ID_Tarjeta',
  id_cuenta_tc VARCHAR(50) NULL COMMENT 'Id cuenta relación de tc',
  nro_cuenta BIGINT NULL COMMENT 'Número de Cuenta de la TC', 
  cod_estado_tarjeta SMALLINT NULL COMMENT 'Código Estado Tarjeta', 
  desc_estado_tarjeta VARCHAR(50) NULL COMMENT 'Descripción Estado Tarjeta', 
  marca_tarjeta_vigente VARCHAR(10) NULL COMMENT 'Marca Tarjeta Vigente', 
  fecha_emision_tc DATE NULL COMMENT 'Fecha de emisión de la TC', 
  fecha_renovacion DATE NULL COMMENT 'Fecha de Renovación', 
  cod_titularidad_tc VARCHAR(1) NULL COMMENT 'Código de Titularidad de la TC', 
  desc_titularidad_tc VARCHAR(10) NULL COMMENT 'Descripción Titularidad de la TC', 
  cod_producto VARCHAR(4) NULL COMMENT 'Código de Producto', 
  desc_producto VARCHAR(30) NULL COMMENT 'Descripción Código de Producto', 
  PRIMARY KEY (nro_tarjeta)
) PARTITION BY HASH (nro_tarjeta) PARTITIONS 4 COMMENT 'Datos Básicos de la tarjeta para TC' STORED AS KUDU TBLPROPERTIES (
  'external.table.purge' = 'TRUE', 'kudu.master_addresses' = 'edh-master-01kc.root.corp,edh-master-02kc.root.corp,edh-master-03kc.root.corp', 
  'kudu.num_tablet_replicas' = '3'
)

-------------INSERTKUDU Query a insertar---------------------

with final as (
  SELECT 
    dbt.nro_tarjeta AS nro_tarjeta, 
    cast(dbt.cod_marca AS SMALLINT) AS cod_marca, 
    dbt.desc_marca AS desc_marca, 
    dbt.id_tarjeta AS id_tarjeta, 
    dbt.id_cuenta_tc AS id_cuenta_tc,
    cast(dbt.nro_cuenta AS bigInt) AS nro_cuenta, 
    cast(
      dbt.cod_estado_tarjeta AS SMALLINT
    ) AS cod_estado_tarjeta, 
    dbt.desc_estado_tarjeta AS desc_estado_tarjeta, 
    dbt.marca_tarjeta_vigente AS marca_tarjeta_vigente, 
    cast(
      dbt.fecha_emision_tc AS varchar(10)
    ) AS fecha_emision_tc, 
    cast(
      dbt.fecha_renovacion AS varchar(10)
    ) AS fecha_renovacion, 
    dbt.cod_titularidad_tc AS cod_titularidad_tc, 
    dbt.desc_titularidad_tc AS desc_titularidad_tc, 
    dbt.cod_producto AS cod_producto, 
    dbt.desc_producto AS desc_producto 
  FROM 
    --PARA VISA $SUBENTORNO_$ENTIDAD_3ref.dim_productos_tc_visa_datos_basicos_tarjeta dbt
    --PARA MASTER $SUBENTORNO_$ENTIDAD_3ref.dim_productos_tc_master_datos_basicos_tarjeta dbt
) 
select 
  * 
from 
  final;
