/*
Questions: What are the most in-demand skills for Data Analyst?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a Data Analyst
- Focus on all job postings.
- Why? Retrieves insights into the most valuable skills for job seekers.
    providing insights into the most valuable skills for job seekers.
*/

SELECT 
    skills,
    count(skills_job_dim.job_id) AS demand_count
from
    job_postings_fact
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skills 
ORDER BY
    demand_count DESC
LIMIT 5

/*
SQL dominates as the core skill
Your data aligns with market evidence—SQL consistently appears as the most requested skill in job postings because it’s the primary way analysts access and manipulate data in databases .
👉 Insight: Data access > everything else — without SQL, other skills lose value.
Strong “foundation + scaling” stack trend
Excel + SQL + Python together show a clear progression:
Excel → quick analysis & business usage
SQL → handling structured databases
Python → advanced analysis & automation
👉 Insight: Employers want versatility—from basic reporting to scalable analytics.
Visualization tools are now mandatory, not optional
Tableau and Power BI demand indicates that analysis alone isn’t enough—companies expect dashboarding and storytelling as standard skills .
👉 Insight: The role is shifting from “data cruncher” → “decision communicator.”

[
  {
    "skills": "sql",
    "demand_count": "92628"
  },
  {
    "skills": "excel",
    "demand_count": "67031"
  },
  {
    "skills": "python",
    "demand_count": "57326"
  },
  {
    "skills": "tableau",
    "demand_count": "46554"
  },
  {
    "skills": "power bi",
    "demand_count": "39468"
  }
]
*/