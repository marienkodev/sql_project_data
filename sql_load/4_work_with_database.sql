-- ::DATE
SELECT job_title_short AS title,
    job_location AS location,
    job_posted_date::DATE AS date
FROM job_postings_fact;


-- TIME ZONE
SELECT job_title_short,
    job_location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time
FROM job_postings_fact;


-- EXTRACT(MONTH AND YEAR ..)
SELECT job_title_short, job_location,
    EXTRACT(MONTH FROM job_posted_date) AS job_posted_month,
    EXTRACT(YEAR FROM job_posted_date) AS job_posted_year
FROM job_postings_fact;


--ONE MONTH
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1;
    

-- MARCH
CREATE TABLE march_jobs AS
SELECT * 
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT job_posted_date
FROM march_jobs;


-- PRACTICE
SELECT COUNT(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY month
ORDER BY job_posted_count DESC;

