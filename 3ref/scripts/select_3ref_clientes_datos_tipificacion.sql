INSERT INTO de_bsj_3ref.clientes_datos_tipificacion (
    cod_banco, 
	  desc_banco, 
    id_cliente_core ,
    estado_cliente ,
    marca_empleado ,
    marca_compra_cartera ,
    marca_base_negativa ,
    marca_cuentas_orden ,
    marca_sucesiones_indivisas ,
    CUIT_grupo_economico ,
    grupo_economico ,
    marca_vinculados_GP ,
	fecha_proceso
)
SELECT DISTINCT
	45 AS cod_banco,
	'BSJ' AS desc_banco,
	BSMCL.id_cliente_core AS id_cliente_core, 
	EST.desc_larga AS estado_cliente, 
	'NULL' AS marca_empleado, 
	'NULL' AS marca_compra_cartera, 
	CASE WHEN BSMEC.id_persona IS NOT NULL AND BSMCL.id_estado_persona_bcra not in (1) THEN 'S' 
		ELSE 'N' END AS marca_base_negativa, 
	CASE 
		WHEN BSMEC_2.cuentas_orden = "1" AND BSMEC.id_persona IS NOT NULL AND BSMCL.id_estado_persona_bcra not in (1) THEN 'S' 
		ELSE 'N' END AS marca_cuentas_orden,
	'NULL' AS marca_sucesiones_indivisas, 
	BSA.nro_doc AS CUIT_grupo_economico, 
	CASE WHEN (
		INT(BSMCL.subtipo_persona) = 14 
		AND id_grupo_economico = 'S' 
		AND INT(BSA.tipo_doc) = 35
		) THEN BSMCL.nombre_completo ELSE NULL END AS grupo_economico, 
	CASE WHEN BSRCL.id_cliente_core_rel IS NOT NULL THEN 'S' ELSE 'N' END AS marca_vinculados_GP,
	'20241219' AS fecha_proceso
FROM 
  de_bsj_2cur.clientes_bsmcl_snap BSMCL 
  LEFT JOIN de_bsj_3ref.clientes_datos_basicos basicos ON BSMCL.id_cliente_core = basicos.id_cliente_core 
  and basicos.fecha_proceso = '20250131' 
  LEFT JOIN de_bsj_2cur.clientes_bsmec BSMEC --64343
  ON basicos.cuit = BSMEC.id_persona 
  AND BSMEC.cod_anteced is not null -- nuevo
  AND BSMEC.fecha_proceso = '20250127' 
  LEFT JOIN (
    SELECT 
      BSMEC_2.id_persona, 
      max(max_cuentas_orden) cuentas_orden 
    FROM 
      (
        SELECT 
          BSMEC_2.id_persona, 
          CASE WHEN BSMEC_2.cod_anteced in (13, 14) THEN '1' ELSE '0' END AS max_cuentas_orden 
        FROM 
          de_bsj_2cur.clientes_bsmec BSMEC_2 
        WHERE 
          BSMEC_2.fecha_proceso = '20250127' 
          AND BSMEC_2.fecha_alta_anteced = (
            SELECT 
              MAX(fecha_alta_anteced) 
            FROM 
              de_bsj_2cur.clientes_bsmec BSMEC_MAX 
            WHERE 
              BSMEC_MAX.fecha_proceso = '20250127' 
              AND BSMEC_MAX.id_persona = BSMEC_2.id_persona
          )
      ) BSMEC_2 
    GROUP BY 
      BSMEC_2.id_persona
  ) BSMEC_2 ON basicos.cuit = BSMEC_2.id_persona 
  LEFT JOIN de_bsj_2cur.clientes_bsado_snap BSA ON BSMCL.id_cliente_core = BSA.id_cliente_core -- se saca el int()
  AND INT(BSMCL.subtipo_persona) = 14 
  AND BSMCL.id_grupo_economico = 'S' 
  AND INT(BSA.tipo_doc) = 35 
  LEFT JOIN de_bsj_2cur.clientes_bsmtg_snap EST ON INT(BSMCL.id_estado_persona_bcra)= INT(EST.id_tabla) 
  AND EST.nombre_tabla = 'ESTCLIEN' 
  LEFT JOIN de_bsj_2cur.clientes_bsrcl BSRCL ON int(BSRCL.id_cliente_core) = int(BSMCL.id_cliente_core) 
  AND BSRCL.fecha_proceso = '20240522'
;

INSERT INTO de_ber_3ref.clientes_datos_tipificacion (
    cod_banco,
    desc_banco,
    id_cliente_core ,
    estado_cliente ,
    marca_empleado ,
    marca_compra_cartera ,
    marca_base_negativa ,
    marca_cuentas_orden ,
    marca_sucesiones_indivisas ,
    CUIT_grupo_economico ,
    grupo_economico ,
    marca_vinculados_GP ,
	fecha_proceso
)
SELECT DISTINCT
	386 AS cod_banco,
	'BER' AS desc_banco,
	BSMCL.id_cliente_core AS id_cliente_core, 
	EST.desc_larga AS estado_cliente, 
	'NULL' AS marca_empleado, 
	'NULL' AS marca_compra_cartera, 
	CASE WHEN BSMEC.id_persona IS NOT NULL AND BSMCL.id_estado_persona_bcra not in (1) THEN 'S' 
		ELSE 'N' END AS marca_base_negativa, 
	CASE 
		WHEN BSMEC_2.cuentas_orden = "1" AND BSMEC.id_persona IS NOT NULL AND BSMCL.id_estado_persona_bcra not in (1) THEN 'S' 
		ELSE 'N' END AS marca_cuentas_orden,
	'NULL' AS marca_sucesiones_indivisas, 
	BSA.nro_doc AS CUIT_grupo_economico, 
	CASE WHEN (
		INT(BSMCL.subtipo_persona) = 14 
		AND id_grupo_economico = 'S' 
		AND INT(BSA.tipo_doc) = 35
		) THEN BSMCL.nombre_completo ELSE NULL END AS grupo_economico, 
	CASE WHEN BSRCL.id_cliente_core_rel IS NOT NULL THEN 'S' ELSE 'N' END AS marca_vinculados_GP,
	'20241219' AS fecha_proceso
FROM 
  de_ber_2cur.clientes_bsmcl_snap BSMCL 
  LEFT JOIN de_ber_3ref.clientes_datos_basicos basicos ON BSMCL.id_cliente_core = basicos.id_cliente_core 
  and basicos.fecha_proceso = '20250131' 
  LEFT JOIN de_ber_2cur.clientes_bsmec BSMEC --64343
  ON basicos.cuit = BSMEC.id_persona 
  AND BSMEC.cod_anteced is not null -- nuevo
  and BSMCL.id_estado_persona_bcra not in (1) -- nuevo
  AND BSMEC.fecha_proceso = '20250127' 
  LEFT JOIN (
    SELECT 
      BSMEC_2.id_persona, 
      max(max_cuentas_orden) cuentas_orden 
    FROM 
      (
        SELECT 
          BSMEC_2.id_persona, 
          CASE WHEN BSMEC_2.cod_anteced in (11,13,28,30) THEN '1' ELSE '0' END AS max_cuentas_orden 
        FROM 
          de_ber_2cur.clientes_bsmec BSMEC_2 
        WHERE 
          BSMEC_2.fecha_proceso = '20250127' 
          AND BSMEC_2.fecha_alta_anteced = (
            SELECT 
              MAX(fecha_alta_anteced) 
            FROM 
              de_ber_2cur.clientes_bsmec BSMEC_MAX 
            WHERE 
              BSMEC_MAX.fecha_proceso = '20250127' 
              AND BSMEC_MAX.id_persona = BSMEC_2.id_persona
          )
      ) BSMEC_2 
    GROUP BY 
      BSMEC_2.id_persona
  ) BSMEC_2 ON basicos.cuit = BSMEC_2.id_persona 
  LEFT JOIN de_ber_2cur.clientes_bsado_snap BSA ON BSMCL.id_cliente_core = BSA.id_cliente_core -- se saca el int()
  AND INT(BSMCL.subtipo_persona) = 14 
  AND BSMCL.id_grupo_economico = 'S' 
  AND INT(BSA.tipo_doc) = 35 
  LEFT JOIN de_ber_2cur.clientes_bsmtg_snap EST ON INT(BSMCL.id_estado_persona_bcra)= INT(EST.id_tabla) 
  AND EST.nombre_tabla = 'ESTCLIEN' 
  LEFT JOIN de_ber_2cur.clientes_bsrcl BSRCL ON int(BSRCL.id_cliente_core) = int(BSMCL.id_cliente_core) 
  AND BSRCL.fecha_proceso = '20241219'
;


INSERT INTO de_bsc_3ref.clientes_datos_tipificacion (
    cod_banco,
    desc_banco,
    id_cliente_core ,
    estado_cliente ,
    marca_empleado ,
    marca_compra_cartera ,
    marca_base_negativa ,
    marca_cuentas_orden ,
    marca_sucesiones_indivisas ,
    CUIT_grupo_economico ,
    grupo_economico ,
    marca_vinculados_GP ,
	fecha_proceso
)
SELECT DISTINCT
	86 AS cod_banco,
	'BSC' AS desc_banco,
	BSMCL.id_cliente_core AS id_cliente_core, 
	EST.desc_larga AS estado_cliente, 
	'NULL' AS marca_empleado, 
	'NULL' AS marca_compra_cartera, 
	CASE WHEN BSMEC.id_persona IS NOT NULL AND BSMCL.id_estado_persona_bcra not in (1) THEN 'S' 
		ELSE 'N' END AS marca_base_negativa, 
	CASE 
		WHEN BSMEC_2.cuentas_orden = "1" AND BSMEC.id_persona IS NOT NULL AND BSMCL.id_estado_persona_bcra not in (1) THEN 'S' 
		ELSE 'N' END AS marca_cuentas_orden,
	'NULL' AS marca_sucesiones_indivisas, 
	BSA.nro_doc AS CUIT_grupo_economico, 
	CASE WHEN (
		INT(BSMCL.subtipo_persona) = 14 
		AND id_grupo_economico = 'S' 
		AND INT(BSA.tipo_doc) = 35
		) THEN BSMCL.nombre_completo ELSE NULL END AS grupo_economico, 
	CASE WHEN BSRCL.id_cliente_core_rel IS NOT NULL THEN 'S' ELSE 'N' END AS marca_vinculados_GP,
	'20241219' AS fecha_proceso
FROM 
  de_bsc_2cur.clientes_bsmcl_snap BSMCL 
  LEFT JOIN de_bsc_3ref.clientes_datos_basicos basicos ON BSMCL.id_cliente_core = basicos.id_cliente_core 
  and basicos.fecha_proceso = '20250131' 
  LEFT JOIN de_bsc_2cur.clientes_bsmec BSMEC --64343
  ON basicos.cuit = BSMEC.id_persona 
  AND BSMEC.cod_anteced is not null -- nuevo
  and BSMCL.id_estado_persona_bcra not in (1) -- nuevo
  AND BSMEC.fecha_proceso = '20250127' 
  LEFT JOIN (
    SELECT 
      BSMEC_2.id_persona, 
      max(max_cuentas_orden) cuentas_orden 
    FROM 
      (
        SELECT 
          BSMEC_2.id_persona, 
          CASE WHEN BSMEC_2.cod_anteced = 14 THEN '1' ELSE '0' END AS max_cuentas_orden 
        FROM 
          de_bsc_2cur.clientes_bsmec BSMEC_2 
        WHERE 
          BSMEC_2.fecha_proceso = '20250127' 
          AND BSMEC_2.fecha_alta_anteced = (
            SELECT 
              MAX(fecha_alta_anteced) 
            FROM 
              de_bsc_2cur.clientes_bsmec BSMEC_MAX 
            WHERE 
              BSMEC_MAX.fecha_proceso = '20250127' 
              AND BSMEC_MAX.id_persona = BSMEC_2.id_persona
          )
      ) BSMEC_2 
    GROUP BY 
      BSMEC_2.id_persona
  ) BSMEC_2 ON basicos.cuit = BSMEC_2.id_persona 
  LEFT JOIN de_bsc_2cur.clientes_bsado_snap BSA ON BSMCL.id_cliente_core = BSA.id_cliente_core -- se saca el int()
  AND INT(BSMCL.subtipo_persona) = 14 
  AND BSMCL.id_grupo_economico = 'S' 
  AND INT(BSA.tipo_doc) = 35 
  LEFT JOIN de_bsc_2cur.clientes_bsmtg_snap EST ON INT(BSMCL.id_estado_persona_bcra)= INT(EST.id_tabla) 
  AND EST.nombre_tabla = 'ESTCLIEN' 
  LEFT JOIN de_bsc_2cur.clientes_bsrcl BSRCL ON int(BSRCL.id_cliente_core) = int(BSMCL.id_cliente_core) 
  AND BSRCL.fecha_proceso = '20241223'
;


INSERT INTO de_bsf_3ref.clientes_datos_tipificacion (
    cod_banco,
    desc_banco,
    id_cliente_core ,
    estado_cliente ,
    marca_empleado ,
    marca_compra_cartera ,
    marca_base_negativa ,
    marca_cuentas_orden ,
    marca_sucesiones_indivisas ,
    CUIT_grupo_economico ,
    grupo_economico ,
    marca_vinculados_GP ,
	fecha_proceso
)
SELECT DISTINCT
    330 AS cod_banco,
	  'BSF' AS desc_banco,
    sbmaeclbf.id_cliente_core  AS id_cliente_core,
    "N/A"  AS estado_cliente,
    CASE WHEN emp.id_empleado IS NOT NULL THEN 'S' ELSE 'N' END AS marca_empleado, 
    CASE WHEN crmaeprbf.id_cliente_core IS NOT NULL OR gmmaemobf.cliente IS NOT NULL THEN 'S'ELSE 'N' END AS marca_compra_cartera,
    CASE WHEN doapdo.id_cliente_core IS NOT NULL THEN 'S'ELSE 'N' END AS marca_base_negativa,
    CASE WHEN mcta.cliente IS NOT NULL THEN 'S'ELSE 'N' END AS marca_cuentas_orden,
    CASE WHEN sbmaeclbf.id_tipo_sociedad  = 34 THEN 'S'ELSE 'N' END AS marca_sucesiones_indivisas,
    CASE WHEN sbmaeclbf.grupo <> 0 THEN 
    (case when  sbmaeclbf.nro_cuit =0 then SB.id_cliente_core else  sbmaeclbf.nro_cuit end ) ELSE NULL END AS CUIT_grupo_economico,
    CASE WHEN sbmaeclbf.grupo = 0 THEN NULL ELSE sb.nombre_completo END AS grupo_economico,
    CASE WHEN sbmaeclbf.vinculacion = 1 THEN 'S'ELSE 'N' END AS marca_vinculados_GP,
	20241226 AS fecha_proceso
FROM de_bsf_2cur.clientes_sbmaeclbf_snap sbmaeclbf
LEFT JOIN de_bsf_3ref.rrhh_perfil_colaborador_dim_empleado emp
       ON CAST(sbmaeclbf.nro_cuit AS STRING)=emp.cuil_emp
       AND emp.fecha_proceso='20240625'
LEFT JOIN de_bsf_2cur.productos_crmaeprbf crmaeprbf
       ON CAST(sbmaeclbf.id_cliente_core AS STRING) = CAST(crmaeprbf.id_cliente_core AS STRING)
      AND id_linea IN (8405, 8415)
      AND mpcodestado = 0
      and crmaeprbf.FECHA_PROCESO='20240805'
LEFT JOIN de_bsf_2cur.productos_gmmaemobf gmmaemobf
       ON CAST(sbmaeclbf.id_cliente_core AS STRING) = CAST(gmmaemobf.cliente AS STRING)
      AND gmmaemobf.linea IN (8405, 8415)
      AND gmmaemobf.estado = 0
      and gmmaemobf.FECHA_PROCESO='20240812'
LEFT JOIN de_bsf_2cur.productos_gmmaemobf mcta
       ON sbmaeclbf.id_cliente_core  = CAST(mcta.cliente AS STRING)
      AND mcta.linea IN (9000, 9001, 9002, 9005, 9500, 9501)
      AND mcta.estado = 0
      and mcta.FECHA_PROCESO='20240812'
LEFT JOIN de_bsf_2cur.ant_neg_doapdo doapdo
       ON sbmaeclbf.id_cliente_core = doapdo.id_cliente_core
       and doapdo.cod_problema is not null
       and doapdo.fecha_proceso='20241107'
LEFT JOIN de_bsf_2cur.clientes_sbmaeclbf_snap sb  
      ON sbmaeclbf.grupo= SB.id_cliente_core;