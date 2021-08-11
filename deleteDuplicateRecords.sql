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
