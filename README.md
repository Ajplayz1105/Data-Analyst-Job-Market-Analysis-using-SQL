# 📊 Data Analyst Job Market Analysis using SQL

## 📌 Introduction
📊 Explore the data analyst job market through SQL-driven analysis!  
This project focuses on uncovering 💰 top-paying jobs, 🔥 in-demand skills, and 📈 the intersection of high demand and high salary in the data analytics field.

---

## 📊 Background
This project was developed to better understand the data analyst job market and identify the most valuable skills for career growth.

The dataset includes job postings with details such as:
- Job titles  
- Salaries  
- Locations  
- Required skills  

### Key questions addressed:
1. What are the top-paying data analyst jobs?  
2. What skills are required for these top-paying jobs?  
3. What skills are most in demand?  
4. Which skills are associated with higher salaries?  
5. What are the most optimal skills to learn?  

---

## 🛠️ Tools Used
- **SQL** – Core analysis tool for querying and extracting insights  
- **PostgreSQL** – Database system used to store and manage job data  
- **Visual Studio Code (VS Code)** – Used to write and execute SQL queries  
- **Git & GitHub** – Version control and project sharing  

---

## 📈 The Analysis

### 1. Top Paying Data Analyst Jobs
Identified the highest-paying roles by filtering job postings based on salary.

```sql
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
LEFT JOIN
    company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```

**Insights:**
- Salaries vary widely, showing strong earning potential  
- High-paying roles exist across multiple industries  
- Senior roles dominate top salaries  

---

### 2. Skills for Top Paying Jobs
Analyzed which skills are required for high-paying roles.

```sql
WITH
    top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN
        company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

select
    top_paying_jobs.*,
    skills
from
    top_paying_jobs
INNER JOIN
    skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC
```

**Insights:**
- SQL and Python are consistently required  
- Visualization tools like Tableau are common  
- Advanced tools increase salary potential  

---

### 3. Top Demanded Skills
Measured skill demand based on job postings.

```sql
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
```

**Insights:**
- SQL and Excel are foundational  
- Python is highly valued  
- BI tools are increasingly required  

---

### 4. Top Paying Skills
Calculated average salary associated with each skill.

```sql
SELECT 
    skills,
    round(avg(salary_year_avg), 0) AS Avg_salary
from
    job_postings_fact
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills 
ORDER BY
    Avg_salary DESC
LIMIT 25
```

**Insights:**
- Niche and technical skills command higher salaries  
- Cloud and big data tools are highly valued  
- Engineering-related tools increase pay  

---

### 5. Optimal Skills (High Demand + High Salary)
Combined demand and salary to find the most valuable skills.

```sql
select
    skills_dim.skill_id,
    skills_dim.skills,
    count(skills_job_dim.job_id) as demand_count,
    round(avg(job_postings_fact.salary_year_avg), 0) as avg_salary
from
    job_postings_fact
inner join
    skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join
    skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where
    job_title_short = 'Data Analyst'
    and salary_year_avg is not null
    and job_work_from_home = true
group by
    skills_dim.skill_id
having
    count(skills_job_dim.job_id) > 10
order by
    avg_salary desc,
    demand_count desc
limit 25;
```

**Insights:**
- Cloud platforms (AWS, Azure) are strong assets  
- Data engineering tools add significant value  
- Balanced skills (demand + salary) are best for career growth  

---

## 📚 What I Learned
- Writing advanced SQL queries using:
  - JOINs  
  - CTEs  
  - Aggregations (COUNT, AVG)  
- Converting raw data into actionable insights  
- Understanding job market trends  
- Difference between high-demand and high-paying skills  
- Importance of combining datasets for deeper analysis  

---

## ✅ Conclusions

### Key Insights
1. SQL is the most essential skill for data analysts  
2. High-paying roles require advanced skills  
3. Demand and salary don’t always align  
4. Cloud and big data tools increase earning potential  
5. Optimal skills = High Demand + High Salary  

---

### Final Thoughts
This project strengthened my SQL skills and provided insights into the data analyst job market. It highlights how data-driven analysis can guide better career decisions and skill development.