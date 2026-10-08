/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
GROUP BY
        skills
ORDER BY
        avg_salary DESC
LIMIT 25

/*
- Big data pays the most. PySpark is #1 at $208K, about $19K above #2. Databricks ($142K), 
Airflow ($126K) and Scala ($125K) also make the list, so analysts who can work with large datasets in distributed systems earn the most.
- Engineering and DevOps tools show up a lot. Bitbucket ($189K), GitLab ($155K), Linux, Kubernetes, Jenkins and Atlassian are all here. 
Pay rises as analyst roles overlap with data engineering, using version control, pipelines and deployment.
- The Python data science stack ranks high. Jupyter, Pandas and NumPy all average $143K–$153K, and scikit-learn is at $126K. Python beyond basic scripting adds value.
- ML and AI platforms are worth a premium. Watson ($161K) and DataRobot ($155K) suggest that analysts working near machine learning get paid more.
- The most in-demand skills are missing. SQL, Excel, Tableau and Power BI aren't in the top 25. Because almost every posting lists them, they're expected rather than rewarded with higher pay.