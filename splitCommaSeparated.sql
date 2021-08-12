select regexp_substr('A1,A2,A4','[^,]+', 1, level) 
   from dual 
   connect BY regexp_substr('A1,A2,A4', '[^,]+', 1, level) 
   is not null
