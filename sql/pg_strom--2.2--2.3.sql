/* pg_strom--2.2--2.3.sql */
CREATE OR REPLACE FUNCTION pgstrom.random_setseed(int)
  RETURNS void
  AS 'MODULE_PATHNAME','pgstrom_random_setseed'
  LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION pgstrom.arrow_fdw_precheck_schema()
  RETURNS event_trigger
  AS 'MODULE_PATHNAME','pgstrom_arrow_fdw_precheck_schema'
  LANGUAGE C STRICT;

CREATE EVENT TRIGGER pgstrom_arrow_fdw_precheck_schema
    ON ddl_command_end
  WHEN tag IN ('CREATE FOREIGN TABLE',
               'ALTER FOREIGN TABLE')
EXECUTE FUNCTION pgstrom.arrow_fdw_precheck_schema();

CREATE OR REPLACE FUNCTION pgstrom.arrow_fdw_truncate(regclass)
  RETURNS void
  AS 'MODULE_PATHNAME','pgstrom_arrow_fdw_truncate'
  LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION
pgstrom.arrow_fdw_export_cupy(regclass, text[] = null, int = null)
  RETURNS text
  AS 'MODULE_PATHNAME','pgstrom_arrow_fdw_export_cupy'
  LANGUAGE C CALLED ON NULL INPUT;

CREATE OR REPLACE FUNCTION
pgstrom.arrow_fdw_export_cupy_pinned(regclass, text[] = null, int = null)
  RETURNS text
  AS 'MODULE_PATHNAME','pgstrom_arrow_fdw_export_cupy_pinned'
  LANGUAGE C CALLED ON NULL INPUT;

CREATE OR REPLACE FUNCTION
pgstrom.arrow_fdw_unpin_gpu_buffer(text)
  RETURNS bool
  AS 'MODULE_PATHNAME','pgstrom_arrow_fdw_unpin_gpu_buffer'
  LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION
pgstrom.arrow_fdw_put_gpu_buffer(text)
  RETURNS bool
  AS 'MODULE_PATHNAME','pgstrom_arrow_fdw_put_gpu_buffer'
  LANGUAGE C STRICT;




--
-- Drop PL/CUDA support functions (deprecated)
--


--
-- Drop Gstore_Fdw support functions (deprecated)
--


--
-- Drop matrix support functions (deprecated)
--
DROP FUNCTION IF EXISTS pgstrom.array_matrix_accum(internal, variadic bool[]) CASCADE;
DROP FUNCTION IF EXISTS pgstrom.array_matrix_accum(internal, variadic int2[]) CASCADE;
DROP FUNCTION IF EXISTS pgstrom.array_matrix_accum(internal, variadic int4[]) CASCADE;
DROP FUNCTION IF EXISTS pgstrom.array_matrix_accum(internal, variadic int8[]) CASCADE;
DROP FUNCTION IF EXISTS pgstrom.array_matrix_accum(internal, variadic real[]) CASCADE;
DROP FUNCTION IF EXISTS pgstrom.array_matrix_accum(internal, variadic float[]) CASCADE;
DROP FUNCTION IF EXISTS pgstrom.array_matrix_accum_varbit(internal, bit) CASCADE;
DROP FUNCTION IF EXISTS pgstrom.varbit_to_int4_array(bit) CASCADE;
DROP CAST IF EXISTS (bit AS int4[]) CASCADE;
DROP FUNCTION IF EXISTS pgstrom.int4_array_to_varbit(int4[]) CASCADE;
DROP CAST IF EXISTS (int4[] AS bit) CASCADE;
DROP FUNCTION IF EXISTS pgstrom.array_matrix_final_bool(internal) CASCADE;
DROP FUNCTION IF EXISTS pgstrom.array_matrix_final_int2(internal) CASCADE;
DROP FUNCTION IF EXISTS pgstrom.array_matrix_final_int4(internal) CASCADE;
DROP FUNCTION IF EXISTS pgstrom.array_matrix_final_int8(internal) CASCADE;
DROP FUNCTION IF EXISTS pgstrom.array_matrix_final_float4(internal) CASCADE;
DROP FUNCTION IF EXISTS pgstrom.array_matrix_final_float8(internal) CASCADE;

DROP AGGREGATE IF EXISTS pg_catalog.array_matrix(variadic bool[]) CASCADE;
DROP AGGREGATE IF EXISTS pg_catalog.array_matrix(variadic int2[]) CASCADE;
DROP AGGREGATE IF EXISTS pg_catalog.array_matrix(variadic int4[]) CASCADE;
DROP AGGREGATE IF EXISTS pg_catalog.array_matrix(variadic int8[]) CASCADE;
DROP AGGREGATE IF EXISTS pg_catalog.array_matrix(variadic float4[]) CASCADE;
DROP AGGREGATE IF EXISTS pg_catalog.array_matrix(variadic float8[]) CASCADE;
DROP AGGREGATE IF EXISTS pg_catalog.array_matrix(bit) CASCADE;

DROP FUNCTION IF EXISTS pg_catalog.array_matrix_validation(anyarray) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.array_matrix_height(anyarray) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.array_matrix_width(anyarray) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.matrix_unnest(anyarray) CASCADE;

DROP FUNCTION IF EXISTS pg_catalog.rbind(bool[], bool[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.rbind(int2[], int2[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.rbind(int4[], int4[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.rbind(int8[], int8[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.rbind(float4[], float4[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.rbind(float8[], float8[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.rbind(bool, bool[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.rbind(bool[], bool) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.rbind(int2, int2[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.rbind(int2[], int2) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.rbind(int4, int4[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.rbind(int4[], int4) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.rbind(int8, int8[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.rbind(int8[], int8) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.rbind(float4, float4[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.rbind(float4[], float4) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.rbind(float8, float8[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.rbind(float8[], float8) CASCADE;

DROP FUNCTION IF EXISTS pg_catalog.cbind(bool[], bool[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.cbind(int2[], int2[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.cbind(int4[], int4[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.cbind(int8[], int8[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.cbind(float4[], float4[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.cbind(float8[], float8[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.cbind(bool, bool[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.cbind(bool[], bool) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.cbind(int2, int2[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.cbind(int2[], int2) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.cbind(int4, int4[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.cbind(int4[], int4) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.cbind(int8, int8[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.cbind(int8[], int8) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.cbind(float4, float4[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.cbind(float4[], float4) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.cbind(float8, float8[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.cbind(float8[], float8) CASCADE;

DROP FUNCTION IF EXISTS pgstrom.array_matrix_rbind_accum(internal, anyarray) CASCADE;
DROP FUNCTION IF EXISTS pgstrom.array_matrix_rbind_final_bool(internal) CASCADE;
DROP FUNCTION IF EXISTS pgstrom.array_matrix_rbind_final_int2(internal) CASCADE;
DROP FUNCTION IF EXISTS pgstrom.array_matrix_rbind_final_int4(internal) CASCADE;
DROP FUNCTION IF EXISTS pgstrom.array_matrix_rbind_final_int8(internal) CASCADE;
DROP FUNCTION IF EXISTS pgstrom.array_matrix_rbind_final_float4(internal) CASCADE;
DROP FUNCTION IF EXISTS pgstrom.array_matrix_rbind_final_float8(internal) CASCADE;
DROP AGGREGATE IF EXISTS pg_catalog.rbind(bool[]) CASCADE;
DROP AGGREGATE IF EXISTS pg_catalog.rbind(int2[]) CASCADE;
DROP AGGREGATE IF EXISTS pg_catalog.rbind(int4[]) CASCADE;
DROP AGGREGATE IF EXISTS pg_catalog.rbind(int8[]) CASCADE;
DROP AGGREGATE IF EXISTS pg_catalog.rbind(float4[]) CASCADE;
DROP AGGREGATE IF EXISTS pg_catalog.rbind(float8[]) CASCADE;

DROP FUNCTION IF EXISTS pgstrom.array_matrix_cbind_accum(internal, anyarray) CASCADE;
DROP FUNCTION IF EXISTS pgstrom.array_matrix_cbind_final_bool(internal) CASCADE;
DROP FUNCTION IF EXISTS pgstrom.array_matrix_cbind_final_int2(internal) CASCADE;
DROP FUNCTION IF EXISTS pgstrom.array_matrix_cbind_final_int4(internal) CASCADE;
DROP FUNCTION IF EXISTS pgstrom.array_matrix_cbind_final_int8(internal) CASCADE;
DROP FUNCTION IF EXISTS pgstrom.array_matrix_cbind_final_float4(internal) CASCADE;
DROP FUNCTION IF EXISTS pgstrom.array_matrix_cbind_final_float8(internal) CASCADE;
DROP AGGREGATE IF EXISTS pg_catalog.cbind(bool[]) CASCADE;
DROP AGGREGATE IF EXISTS pg_catalog.cbind(int2[]) CASCADE;
DROP AGGREGATE IF EXISTS pg_catalog.cbind(int4[]) CASCADE;
DROP AGGREGATE IF EXISTS pg_catalog.cbind(int8[]) CASCADE;
DROP AGGREGATE IF EXISTS pg_catalog.cbind(float4[]) CASCADE;
DROP AGGREGATE IF EXISTS pg_catalog.cbind(float8[]) CASCADE;

DROP FUNCTION IF EXISTS pg_catalog.transpose(bool[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.transpose(int2[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.transpose(int4[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.transpose(int8[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.transpose(float4[]) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.transpose(float8[]) CASCADE;

DROP FUNCTION IF EXISTS pg_catalog.float4_as_int4(float4) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.int4_as_float4(int4) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.float8_as_int8(float8) CASCADE;
DROP FUNCTION IF EXISTS pg_catalog.int8_as_float8(int8) CASCADE;


