/*
Question: what are the most optimal skills for data engineers-balancing both demand and salary?
. Create a ranking column that combines demand count and median salary to identify the most valuable skills.
. Focus only on remote Data Engineer positions with specified annual salaries.
. Why?
	. This approach highlights skills that balance market demand and financial reward.
	  It weights core skills appropriately, rather than letting rare, outlier skills distort the results.

*/

SELECT
  sd.skills,
  ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
  COUNT(jpf.*) AS demand_count,
  COUNT(jpf.salary_year_avg) AS corrrect_demand_count
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
HAVING
    COUNT(jpf.*) > 100
ORDER BY
  median_salary DESC
LIMIT 25;


SELECT
  sd.skills,
  ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
  COUNT(jpf.salary_year_avg) AS demand_count,
  MEDIAN(jpf.salary_year_avg) * COUNT(jpf.salary_year_avg) AS optimal_score,
  median_salary * demand_count
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
HAVING
    COUNT(jpf.*) > 100
ORDER BY
  optimal_score DESC
LIMIT 25;

SELECT
  sd.skills,
  ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
  COUNT(jpf.salary_year_avg) AS demand_count,
  MEDIAN(jpf.salary_year_avg) * COUNT(jpf.salary_year_avg) AS optimal_score
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
HAVING
    COUNT(jpf.*) > 100
ORDER BY
  optimal_score DESC
LIMIT 25;

SELECT
  sd.skills,
  ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
  COUNT(jpf.salary_year_avg) AS demand_count,
  LN(COUNT(jpf.salary_year_avg)) AS demand_count,
  MEDIAN(jpf.salary_year_avg) * COUNT(jpf.salary_year_avg) AS optimal_score
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
HAVING
    COUNT(jpf.*) > 100
ORDER BY
  optimal_score DESC
LIMIT 25;

SELECT
  sd.skills,
  ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
  COUNT(jpf.salary_year_avg) AS demand_count,
  LN(COUNT(jpf.*)) AS demand_count,
  MEDIAN(jpf.salary_year_avg) * COUNT(jpf.salary_year_avg) AS optimal_score
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
  ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
  ON sjd.skill_id = sd.skill_id
WHERE
  jpf.job_title_short = 'Data Engineer'
  AND jpf.job_work_from_home = True
  AND jpf.salary_year_avg IS NOT NULL
GROUP BY 
  sd.skills
HAVING
    COUNT(jpf.*) > 100
ORDER BY
  optimal_score DESC
LIMIT 25;

SELECT
  sd.skills,
  ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
  COUNT(jpf.*) AS demand_count,
  LN(COUNT(jpf.*)) AS demand_count,
  MEDIAN(jpf.salary_year_avg) * COUNT(jpf.*) AS optimal_score
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
  ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
  ON sjd.skill_id = sd.skill_id
WHERE
  jpf.job_title_short = 'Data Engineer'
  AND jpf.job_work_from_home = True
  AND jpf.salary_year_avg IS NOT NULL
GROUP BY 
  sd.skills
HAVING
    COUNT(jpf.*) > 100
ORDER BY
  optimal_score DESC
LIMIT 25;


SELECT
  sd.skills,
  ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
  -- COUNT(jpf.*) AS demand_count,
  ROUND(LN(COUNT(jpf.*)), 1) AS demand_count,
  (MEDIAN(jpf.salary_year_avg) * LN(COUNT(jpf.*)))/1_000_000 AS optimal_score
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
  ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
  ON sjd.skill_id = sd.skill_id
WHERE
  jpf.job_title_short = 'Data Engineer'
  AND jpf.job_work_from_home = True
  AND jpf.salary_year_avg IS NOT NULL
GROUP BY 
  sd.skills
HAVING
    COUNT(jpf.*) > 100
ORDER BY
  optimal_score DESC
LIMIT 25;

SELECT
  sd.skills,
  ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
  -- COUNT(jpf.*) AS demand_count,
  ROUND(LN(COUNT(jpf.*)), 1) AS demand_count,
  ROUND((MEDIAN(jpf.salary_year_avg) * LN(COUNT(jpf.*)))/1_000_000, 2) AS optimal_score
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
  ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
  ON sjd.skill_id = sd.skill_id
WHERE
  jpf.job_title_short = 'Data Engineer'
  AND jpf.job_work_from_home = True
  AND jpf.salary_year_avg IS NOT NULL
GROUP BY 
  sd.skills
HAVING
    COUNT(jpf.*) > 100
ORDER BY
  optimal_score DESC
LIMIT 25;


SELECT
  sd.skills,
  ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
  COUNT(jpf.*) AS demand_count,
  ROUND(LN(COUNT(jpf.*)), 1) AS ln_demand_count,
  ROUND((MEDIAN(jpf.salary_year_avg) * LN(COUNT(jpf.*)))/1_000_000, 2) AS optimal_score
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
  ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
  ON sjd.skill_id = sd.skill_id
WHERE
  jpf.job_title_short = 'Data Engineer'
  AND jpf.job_work_from_home = True
  AND jpf.salary_year_avg IS NOT NULL
GROUP BY 
  sd.skills
HAVING
    COUNT(jpf.*) > 100
ORDER BY
  optimal_score DESC
LIMIT 25;

/*

Here's a breakdown of the most optimal skills for Data Engineers, based on both high demand and high salaries:

Top skills by Optimal Score:
- terraform leads the list with a $184k median salary and 193 postings, resulting in the highest overall "optimal score" of 0.97.
- Python and SQL dominate demand (over 1100 postings each) with strong median salaries of $135k and $130k respectively, yielding optimal scores of 0.95 and 0.91.
- AWS (783 postings, $137 median), Spark (503 postings, $140 median) and Airflow (386 postings, $150K median) are also highly valuable skills, balancing both demand and salary.
- Kafka offers high compesation ($145k median) and solid demand (292postings).
- Tools like Snowflake, Azure, and Databricks each have 250-475 postings and median salaries between $128-$137k.

┌────────────┬───────────────┬──────────────┬─────────────────┬───────────────┐
│   skills   │ median_salary │ demand_count │ ln_demand_count │ optimal_score │
│  varchar   │    double     │    int64     │     double      │    double     │
├────────────┼───────────────┼──────────────┼─────────────────┼───────────────┤
│ terraform  │      184000.0 │          193 │             5.3 │          0.97 │
│ python     │      135000.0 │         1133 │             7.0 │          0.95 │
│ aws        │      137320.0 │          783 │             6.7 │          0.91 │
│ sql        │      130000.0 │         1128 │             7.0 │          0.91 │
│ airflow    │      150000.0 │          386 │             6.0 │          0.89 │
│ spark      │      140000.0 │          503 │             6.2 │          0.87 │
│ kafka      │      145000.0 │          292 │             5.7 │          0.82 │
│ snowflake  │      135500.0 │          438 │             6.1 │          0.82 │
│ azure      │      128000.0 │          475 │             6.2 │          0.79 │
│ java       │      135000.0 │          303 │             5.7 │          0.77 │
│ scala      │      137290.0 │          247 │             5.5 │          0.76 │
│ git        │      140000.0 │          208 │             5.3 │          0.75 │
│ kubernetes │      150500.0 │          147 │             5.0 │          0.75 │
│ databricks │      132750.0 │          266 │             5.6 │          0.74 │
│ redshift   │      130000.0 │          274 │             5.6 │          0.73 │
│ gcp        │      136000.0 │          196 │             5.3 │          0.72 │
│ nosql      │      134415.0 │          193 │             5.3 │          0.71 │
│ hadoop     │      135000.0 │          198 │             5.3 │          0.71 │
│ pyspark    │      140000.0 │          152 │             5.0 │           0.7 │
│ mongodb    │      135750.0 │          136 │             4.9 │          0.67 │
│ docker     │      135000.0 │          144 │             5.0 │          0.67 │
│ r          │      134775.0 │          133 │             4.9 │          0.66 │
│ go         │      140000.0 │          113 │             4.7 │          0.66 │
│ bigquery   │      135000.0 │          123 │             4.8 │          0.65 │
│ github     │      135000.0 │          127 │             4.8 │          0.65 │
└────────────┴───────────────┴──────────────┴─────────────────┴───────────────┘
  25 rows                                                           5 columns
*/


select ln(0)