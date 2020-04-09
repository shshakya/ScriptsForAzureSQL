SELECT DISTINCT qsq.query_id
	,qsrts.plan_id
	,qsq.query_hash
	,qsrts.execution_type
	,qsp.query_plan_hash
	,qsrts.first_execution_time
	,qsrts.last_execution_time
	,qsrts.count_executions
	,qsrts.avg_duration
	,qsrts.avg_cpu_time
	,qsrts.avg_logical_io_reads
	,qsrts.avg_logical_io_writes
	,qsrts.avg_physical_io_reads
	,qsrts.avg_log_bytes_used
	,qsp.avg_compile_duration
	,qsp.last_compile_duration
	,qsp.plan_forcing_type
	,qsqt.query_sql_text
FROM [sys].[query_store_runtime_stats] qsrts
INNER JOIN [sys].[query_store_plan] qsp ON qsrts.plan_id = qsp.plan_id
INNER JOIN [sys].[query_store_query] qsq ON qsp.query_id = qsq.query_id
INNER JOIN [sys].[query_store_query_text] qsqt ON qsq.query_text_id = qsqt.query_text_id
WHERE qsq.query_hash = 0xA3B419525BA0BFEF