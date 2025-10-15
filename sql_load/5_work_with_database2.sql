-- CASE, WHEN, ELSE
SELECT COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY location_category;
-- SELECT IN SELECT
SELECT *
FROM (
        SELECT *
        FROM job_postings_fact
        WHERE EXTRACT(
                MONTH
                FROM job_posted_date
            ) = 1
    ) AS january_jobs;
-- UNION AND UNION ALL(WITH DUBLICATE)
SELECT job_title_short,
    company_id,
    job_location
FROM january_jobs
UNION ALL
SELECT job_title_short,
    company_id,
    job_location
FROM february_jobs
UNION ALL
SELECT job_title_short,
    company_id,
    job_location
FROM march_jobs