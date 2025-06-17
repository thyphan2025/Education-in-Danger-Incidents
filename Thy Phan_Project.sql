CREATE SCHEMA education_in_danger
CREATE TABLE education_in_danger.education (
    date DATE,
    country VARCHAR(100),
    country_iso VARCHAR(3),
    admin_1 VARCHAR(100),
    latitude NUMERIC(10, 6),
    longitude NUMERIC(10, 6),
    geo_precision VARCHAR(100),
    location_of_event VARCHAR(255),
    reported_perpetrator VARCHAR(100),
    reported_perpetrator_name TEXT,
    weapon_carried_used TEXT,
    type_of_education_facility VARCHAR(100),
    attacks_on_schools INT,
    attacks_on_universities INT,
    military_occupation BOOLEAN,
    arson_attack BOOLEAN,
    forced_entry BOOLEAN,
    damage_destruction BOOLEAN,
    attacks_on_students_teachers BOOLEAN,
    educators_killed INT,
    educators_injured INT,
    educators_kidnapped INT,
    educators_arrested INT,
    students_attacked_in_school INT,
    students_killed INT,
    students_injured INT,
    students_kidnapped INT,
    students_arrested INT,
    sexual_violence_affecting_school_age_children INT,
    sind_event_id INT PRIMARY KEY
);

SELECT
   country, 
    SUM(students_killed) AS total_students_killed
FROM 
    education_in_danger.education
GROUP BY 
   country
ORDER BY 
    total_students_killed DESC
LIMIT 5;

SELECT 
	country, 
    SUM(students_injured) AS total_students_injured
FROM 
    education_in_danger.education
GROUP BY 
    country
ORDER BY 
    total_students_injured DESC
LIMIT 5;

SELECT 
    date,
    country, 
    SUM(sexual_violence_affecting_school_age_children) AS total_sexual_violence
FROM 
    education_in_danger.education
GROUP BY 
    date, country
ORDER BY 
    total_sexual_violence DESC
LIMIT 10;

SELECT 
    date,
    country, 
    SUM(sexual_violence_affecting_school_age_children) AS total_sexual_violence
FROM 
    education_in_danger.education
GROUP BY 
    date, country
ORDER BY 
    total_sexual_violence DESC
LIMIT 5;

SELECT 
    date, 
    COUNT(*) AS total_incidents
FROM 
    education_in_danger.education
GROUP BY 
    date
ORDER BY 
    total_incidents DESC
LIMIT 10;

SELECT 
    EXTRACT(MONTH FROM date) AS month,
    COUNT(*) AS total_incidents
FROM 
    education_in_danger.education
GROUP BY 
    EXTRACT(MONTH FROM date)
ORDER BY 
    total_incidents DESC;












