/*
Question: What are the most in demand skills for data engineers?
. Identify the top 10 in-demand skills for data engineers
. Focus on remote jobs postings
. Why?
    . Retrieves the top 10 skills with the highest demand in the remote
      Job market, providing insights into the most valuable skills for data
      engineers seeking remote work
*/
SELECT 
  *
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
  ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
  ON sjd.skill_id = sd.skill_id
LIMIT 10;

SELECT 
  sd.skills,
  COUNT(jpf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
  ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
  ON sjd.skill_id = sd.skill_id
GROUP BY
  sd.skills 

LIMIT 10;

SELECT 
  sd.skills,
  COUNT(jpf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
  ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
  ON sjd.skill_id = sd.skill_id
GROUP BY
  sd.skills 
ORDER BY 
  demand_count DESC
LIMIT 10;


SELECT 
  sd.skills,
  COUNT(jpf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
  ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
  ON sjd.skill_id = sd.skill_id
WHERE
  jpf.job_title_short = 'Data Engineer'
  AND jpf.job_work_from_home = True
GROUP BY
  sd.skills 
ORDER BY 
  demand_count DESC
LIMIT 10;

/*
Here's the breakdown of the most demanded skills dor data engineers:
SQL andPython are by far the most in-demand skills, with araound 29.000 job posting each - nearly double the next 
Cloud platforms round out the top skills, with AWS leading at ~18000 postings, followed by Azure at ~14000.
Apache Spark completes the top 5 with nearly  13000 postings, highligthing the important of a big data processing skil

Key takeways:
- SQL and Python remain the foundation skills for data engineers 
- Cloud platforms (AWS, Azure) are critical for moderna data engineering
- Big Data tools (Airflow, Snowflake, Databricks)show growing demand
- Java and GCP round out the top 10 most request skills 
┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
└────────────┴──────────────┘
  10 rows         2 columns
*/
