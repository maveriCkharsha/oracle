DELETE
FROM table 
WHERE rowid IN (SELECT 
   		   r
 		FROM 
    		   (SELECT 
        		rowid r,
        		row_number() over(partition by col1,col2.. order by rowid) as t
    		    FROM 
       			table)
WHERE t>1);

DELETE  FROM
    basket a
        USING basket b
WHERE
    a.id > b.id
    AND a.fruit = b.fruit;

--Incase all records are duplicate

DELETE  FROM
    basket a
        USING basket b
WHERE
    a = b
    AND a.ctid > b.ctid;
    
