-- Challenge Deliverable 1
SELECT emp_no,
	first_name,
	last_name,
	title,
	from_date,
	salary
INTO emp_title_info
FROM
	(SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	ti.title,
	ti.from_date,
	ti.to_date,
	s.salary, ROW_NUMBER() OVER
 (PARTITION BY (e.emp_no)
 ORDER BY ti.to_date DESC) rn
 FROM employees as e
	INNER JOIN salaries as s
		ON (e.emp_no = s.emp_no)
	INNER JOIN titles as ti
		ON (e.emp_no = ti.emp_no)
 ) tmp
WHERE rn = 1 AND (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (to_date = '9999-01-01')
ORDER BY emp_no;

SELECT COUNT(eti.emp_no), eti.title
INTO challenge_1_1
FROM emp_title_info as eti
GROUP BY eti.title;

SELECT emp_no,
	first_name,
	last_name,
	title,
	from_date,
	salary
INTO total_emp_title_info
FROM
	(SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	ti.title,
	ti.from_date,
	ti.to_date,
	s.salary, ROW_NUMBER() OVER
 (PARTITION BY (e.emp_no)
 ORDER BY ti.to_date DESC) rn
 FROM employees as e
	INNER JOIN salaries as s
		ON (e.emp_no = s.emp_no)
	INNER JOIN titles as ti
		ON (e.emp_no = ti.emp_no)
 ) tmp
WHERE rn = 1
AND (to_date = '9999-01-01')
ORDER BY emp_no;

SELECT COUNT(teti.emp_no), teti.title
INTO challenge_1_2
FROM total_emp_title_info as teti
GROUP BY teti.title;

-- Challenge Deliverable 2
SELECT emp_no,
	first_name,
	last_name,
	title,
	from_date,
	salary
--INTO emp_title_info
FROM
	(SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	ti.title,
	ti.from_date,
	ti.to_date,
	s.salary, ROW_NUMBER() OVER
 (PARTITION BY (e.emp_no)
 ORDER BY ti.to_date DESC) rn
 FROM employees as e
	INNER JOIN salaries as s
		ON (e.emp_no = s.emp_no)
	INNER JOIN titles as ti
		ON (e.emp_no = ti.emp_no)
 ) tmp
WHERE rn = 1 AND (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (to_date = '9999-01-01')
ORDER BY emp_no;