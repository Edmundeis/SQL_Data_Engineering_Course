SELECT
    job_id,
    job_title_short,
    salary_year_avg,
    company_id
FROM
    job_postings_fact
LIMIT 10;

SELECT
    company_id,
    name,
FROM
    company_dim
LIMIT 10;

SELECT
    *
FROM
    company_dim
WHERE
    name in ('Facebook', 'Meta');

SELECT *
FROM skills_job_dim
LIMIT 5;

SELECT *
FROM skills_dim
LIMIT 5;

SELECT *
FROM information_schema.tables;

SELECT *
FROM information_schema.columns
WHERE table_name = 'job_postings_fact';

SELECT *
FROM information_schema.columns
WHERE table_catalog = 'data_jobs';

SELECT table_name, column_name, data_type
FROM information_schema.columns
WHERE table_catalog = 'data_jobs';

PRAGMA table_info('job_postings_fact');

PRAGMA show_tables;
PRAGMA show_tables_expanded;

DESCRIBE job_postings_fact;

/* 
USUARIO@DESKTOP-SGTDA4D MINGW64 ~

USUARIO@DESKTOP-SGTDA4D MINGW64 ~
$ source .bashrc

USUARIO@DESKTOP-SGTDA4D MINGW64 ~
$ $motherduck_token
bash: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImVkbXBpZUBnbWFpbC5jb20iLCJtZFJlZ2lvbiI6ImF3cy11cy1lYXN0LTEiLCJzZXNzaW9uIjoiZWRtcGllLmdtYWlsLmNvbSIsInBhdCI6IlNXOEs1aFlqei1yX1RoWVc1NUMwMHJELWhzbHFLbHFtNk9QT1pJbTFST0kiLCJ1c2VySWQiOiJlY2ZjZGVjZC1jNWQ3LTQ2NDItYmYwNC0yN2NmNzE5YmZmNjQiLCJpc3MiOiJtZF9wYXQiLCJyZWFkT25seSI6ZmFsc2UsInRva2VuVHlwZSI6InJlYWRfd3JpdGUiLCJpYXQiOjE3ODk1MTgyMDJ9.-q2wfvcjn_cDdirQt7vfrjjDJwIzOZawisbpBVyP-jA: command not found

USUARIO@DESKTOP-SGTDA4D MINGW64 ~
$ duckdb md:data_jobs
DuckDB v1.5.5 (Variegata)
Enter ".help" for usage hints.
data_jobs D SELECT
                job_id,
                job_title_short,
                salary_year_avg,
                company_id
            FROM
                job_postings_fact
            LIMIT 10;
┌────────┬─────────────────────┬─────────────────┬────────────┐
│ job_id │   job_title_short   │ salary_year_avg │ company_id │
│ int32  │       varchar       │     double      │   int32    │
├────────┼─────────────────────┼─────────────────┼────────────┤
│   4593 │ Data Analyst        │            NULL │       4593 │
│   4594 │ Data Analyst        │            NULL │       4594 │
│   4595 │ Data Analyst        │            NULL │       4595 │
│   4596 │ Senior Data Analyst │            NULL │       4596 │
│   4597 │ Data Analyst        │            NULL │       4597 │
│   4598 │ Data Analyst        │            NULL │       4598 │
│   4599 │ Data Analyst        │            NULL │       4599 │
│   4600 │ Data Analyst        │            NULL │       4600 │
│   4601 │ Senior Data Analyst │            NULL │       4601 │
│   4602 │ Business Analyst    │            NULL │       4602 │
└────────┴─────────────────────┴─────────────────┴────────────┘
  10 rows                                           4 columns
 */