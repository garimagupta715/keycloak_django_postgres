BEGIN;
    SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'underwriting' and pid != pg_backend_pid();
END;
