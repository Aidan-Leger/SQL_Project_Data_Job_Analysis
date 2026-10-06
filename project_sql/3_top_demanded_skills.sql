/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for data analyst,
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market,
        providing insights into the most valuable skills for job seekers.
*/

SELECT
        skills,
        COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
        job_title_short = 'Data Analyst' AND
        job_work_from_home = TRUE
GROUP BY
        skills
ORDER BY
        demand_count DESC
LIMIT 5

/*
- SQL is far ahead of everything else. It appears in 7,291 postings, about 1.6× as many as Excel at #2. 
  It makes up roughly 32% of all mentions across these five skills.
- Excel, Python and Tableau form a close second tier. Excel has 4,611 postings, Python 4,330 and Tableau 3,745. 
  Excel and Python are only about 6% apart, so spreadsheets still matter as much as coding for getting hired.
- Tableau beats Power BI by about 44%. That's 3,745 postings against 2,609, the same lead it had among the top-paying roles.
- What's in demand isn't the same as what pays most. Excel is #2 in demand but showed up in only 3 of the 8 top-paying jobs. 
  Power BI was in just 2. Those roles leaned instead toward Python, cloud platforms (Snowflake, AWS, Azure) and Git tooling.