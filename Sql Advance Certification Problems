## Q1> Cryto Market Report 

-- Solution

WITH quarterly_volume as (

SELECT 
        algorithm,
        SUM(volume) as volume,
        datepart(quarter,dt) as quarters
        
FROM    coins c
JOIN    transactions t ON t.coin_code = c.code
WHERE   datepart(year,dt) = 2020
GROUP BY algorithm, datepart(quarter,dt)

)
SELECT
       c.algorithm,
       qv1.volume as transactions_Q1,
       qv2.volume as transactions_Q2,
       qv3.volume as transactions_Q3,
       qv4.volume as transactions_Q4
FROM   coins c 
LEFT JOIN quarterly_volume qv1 
on c.algorithm = qv1.algorithm
AND qv1.quarters = 1  
LEFT JOIN quarterly_volume qv2 
on c.algorithm = qv2.algorithm
AND qv2.quarters = 2  
LEFT JOIN quarterly_volume qv3 
on c.algorithm = qv3.algorithm
AND qv3.quarters = 3
LEFT JOIN quarterly_volume qv4 
on c.algorithm = qv4.algorithm
AND qv4.quarters = 4
WHERE c.code NOT LIKE 'DOGE'
ORDER BY algorithm

## Q2> Weekend Working Hours

--Solution

WITH hours_worked as (
  
SELECT
      emp_id,
  	   CASE 
       WHEN datepart(minute,TIMESTAMP) >= datepart(minute,lag(TIMESTAMP) OVER(PARTITION BY CAST(TIMESTAMP AS date),emp_id ORDER BY TIMESTAMP)) then datepart(hour,timestamp) - datepart(hour,lag(TIMESTAMP) OVER(PARTITION BY CAST(TIMESTAMP AS date),emp_id ORDER BY TIMESTAMP)) 
  	   ELSE datepart(hour,timestamp) - datepart(hour,lag(TIMESTAMP) OVER(PARTITION BY CAST(TIMESTAMP AS date),emp_id ORDER BY TIMESTAMP)) - 1
       END AS hours_worked
FROM   attendance
-- only weekends
WHERE  datepart(weekday,TIMESTAMP) IN(7,1)
)
SELECT
   emp_id,
      SUM(hours_worked) as hours_worked
FROM  hours_worked
GROUP BY emp_id
ORDER BY hours_worked desc


























