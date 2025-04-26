## Q1> Student Analysis

--Solution

SELECT a.roll_number,a.name
FROM student_information a
INNER JOIN examination_marks b
ON a.roll_number = b.roll_number
GROUP BY b.roll_number
HAVING SUM(b.subject_one + b.subject_two + b.subject_three) < 100;


## Q2> Merit Rewards

--Solution

SELECT ei.employee_ID, ei.name
FROM employee_information ei
JOIN last_quarter_bonus b ON b.employee_ID = ei.employee_ID
WHERE ei.division LIKE 'HR'
AND b.bonus >= 5000;

## Q3> Country Codes

--Solution

SELECT a.customer_id,a.name,concat("+",b.country_code,a.phone_number)
FROM customers as a
LEFT join country_codes as b 
ON a.country=b.country
ORDER BY a.customer_id;
