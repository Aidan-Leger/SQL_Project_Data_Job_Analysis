/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment trends and salary expectations in the field.
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10

/*
- Salaries range from $184K to $650K, with a median of $211K.
- The $650K Mantys role is likely an outlier. It’s a plain “Data Analyst” title paying almost twice the next job (Meta at $336.5K), which suggests a data entry error. Without it, the range is $184K–$336.5K.
- Seniority drives pay. Six of the 10 are senior titles (Director, Associate Director or Principal), and they hold three of the top four spots after Mantys.
- Regular analyst titles can still pay well. Pinterest’s marketing analyst ($232K) and UCLA Health’s analyst ($217K) out-earn several Principal roles.
- Employers span many industries: tech (Meta, Pinterest), telecom (AT&T), healthcare (UCLA Health), finance (SmartAsset) and autonomous vehicles (Motional).
- SmartAsset appears twice, both Principal roles at $186K and $205K, so it’s a consistent high payer.
- All 10 are full-time, and postings are spread across the whole year (January to December), so there’s no seasonal pattern.
/*