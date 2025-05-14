SELECT  
CONCAT ( CAST(id_cliente_core AS STRING), CAST(fecha_proceso AS STRING)) as id,
CDT.cod_banco as cod_banco ,
CDT.desc_banco as desc_banco    ,
id_cliente_core ,
estado_cliente ,
marca_empleado ,
marca_compra_cartera ,
marca_base_negativa ,
marca_cuentas_orden ,
marca_sucesiones_indivisas ,
CUIT_grupo_economico ,
grupo_economico ,
marca_vinculados_GP,
fecha_proceso
FROM de_$ENTIDAD_3ref.clientes_datos_tipificacion AS CDT
;

-- NOMBRE DE TABLA: clientes_datos_tipificacion