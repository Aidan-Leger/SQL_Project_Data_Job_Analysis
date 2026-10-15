/*
Answer: What are the most optimal skills to learn (aka it's high demand and a high paying skill)?
    - Identify skills in high demand and associated with high average salaries for Data Analyst roles
    - Concentrates on remote positions with specified salaries
    - Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
        offering strategic insights for career development in data analysts
*/

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY skills_dim.skill_id;

/*
- SQL is the foundation. It’s in 398 postings, more than any other skill (Excel is next at 256), and pays a solid $97K. It’s the clearest must-have.
- Python is the best all-rounder. It’s third in demand (236) and one of the few high-demand skills over $100K ($101K).
- Office tools are common but pay less. Excel, PowerPoint and Word are widely requested but average $83K–$89K, the lowest of the popular skills.
- Cloud and big-data tools pay a premium. Snowflake ($113K), Azure ($111K), AWS ($108K) and Hadoop ($113K) each appear in 20–37 postings and pay $10K–$15K more than SQL.
- Databricks has the highest pay with real demand, at $142K across 10 postings.
- The very top salaries are unreliable. PySpark ($208K) and Bitbucket ($189K) come from only 2 postings each, and 58 of the 120 skills have fewer than 5 postings.
- The data has duplicates. SAS, MongoDB and Ruby each appear twice under different skill_ids, which splits their counts in skills_dim.