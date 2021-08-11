https://oracle-base.com/articles/11g/recursive-subquery-factoring-11gr2

https://oracle-base.com/articles/misc/hierarchical-queries


create table dummy_table( emp_no number, ename varchar2(5), job varchar2(9), 
manager_no number );

insert into dummy_table 
SELECT 10, 'A1', 'CEO',null  FROM DUAL UNION ALL
SELECT 11, 'B1', 'VP', 10  FROM DUAL UNION ALL
SELECT 12, 'B2', 'VP', 10  FROM DUAL UNION ALL
SELECT 13, 'B3', 'VP', 10  FROM DUAL UNION ALL
SELECT 14, 'C1', 'DIRECTOR', 13  FROM DUAL UNION ALL
SELECT 15, 'C2', 'DIRECTOR', 13  FROM DUAL UNION ALL
SELECT 16, 'D1', 'MANAGER', 15  FROM DUAL UNION ALL
SELECT 17 ,'E1', 'ENGINEER', 11  FROM DUAL UNION ALL
SELECT 18, 'E2', 'ENGINEER', 11 FROM DUAL;

SELECT 
    emp_no,
    ename,
    job,
    manager_no,
    level,
    SYS_CONNECT_BY_PATH(job, '-') AS path,
    CONNECT_BY_ISLEAF AS leaf
FROM
   dummy_table
   START WITH manager_no IS NULL
   CONNECT BY manager_no = PRIOR emp_no
ORDER BY emp_no 
