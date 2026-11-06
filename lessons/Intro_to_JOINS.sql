SELECT
    jpf.job_id,
    jpf.job_title_short,
    cd.company_id,
    cd.name AS company_name,
    jpf.job_location
FROM 
    job_postings_fact AS jpf
LEFT JOIN company_dim AS cd
    ON jpf.company_id = cd.company_id;
LIMIT 10;

SELECT 
    COUNT(*)
FROM job_postings_fact;

SELECT
    jpf.job_id,
    jpf.job_title_short,
    cd.company_id,
    cd.name AS company_name,
    jpf.job_location
FROM
    job_postings_fact AS jpf
FULL JOIN  
    company_dim AS cd
ON 
    jpf.company_id = cd.company_id
LIMIT 10;

SELECT 
    jpf.job_id,
    jpf.job_title_short,
    sjd.skill_id,
    sd.skills
FROM 
    job_postings_fact AS jpf
LEFT JOIN 
    skills_job_dim AS sjd
ON 
    jpf.job_id = sjd.job_id
LEFT JOIN 
    skills_dim AS sd
ON 
    sjd.skill_id = sd.skill_id
LIMIT 10;

select * FROM skills_dim LIMIT 10;


SELECT * FROM job_postings_fact LIMIT 10;


EXPLAIN ANALYZE
SELECT
    COUNT(jpf.job_id) AS job_count,
    cd.name AS company_name
FROM job_postings_fact AS jpf
LEFT JOIN company_dim AS cd
ON jpf.company_id = cd.company_id
WHERE jpf.job_country = 'United States'
GROUP BY cd.name
HAVING COUNT(jpf.job_id) > 3000
ORDER BY job_count DESC
LIMIT 20;



--

EXPLAIN 
select *
from job_postings_fact ;
