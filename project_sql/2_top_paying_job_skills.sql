/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment trends and salary expectations in the field.
*/

WITH top_paying_jobs AS(
    SELECT
        job_id,
        job_title,
        salary_year_avg,
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
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;

/*
SQL is universal: it appears in all 8 postings. It's the baseline skill for these roles, not a differentiator.
Python is close behind at 7/8, and R shows up in 4. Most of these roles expect at least one programming language on top of SQL.
Tableau leads visualization at 6/8, ahead of Power BI (2) and Excel (3). At this pay level it's the most requested BI tool.
Cloud and data warehouse skills recur: Snowflake (3), Azure (2), AWS (2), and Databricks/PySpark at AT&T. Higher-paid roles lean toward working directly with cloud data platforms.
Collaboration tooling is a cluster: Jira, Confluence, Bitbucket and Atlassian always appear together, at both Motional and Inclusively. GitLab and Git show up too, so version control is part of the job at the senior end.
The top-paying role asks for the broadest stack: AT&T at $255.8K lists 13 skills. The ERM role at $184K lists only SQL, Python and R. Even so, Pinterest pays $232K with just 5 skills, so breadth alone doesn't set salary.
*/