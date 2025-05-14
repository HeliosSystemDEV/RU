SELECT 
  id, 
  cod_banco, 
  desc_banco, 
  id_cliente_core, 
  cod_motivo_base_negativa, 
  desc_motivo_base_negativa, 
  fecha_base_negativa 
FROM 
  $SUBENTORNO_$ENTIDAD_4con.clientes_ru_datos_base_negativa
WHERE 
	fecha_proceso = '$FECHA_PROCESO';