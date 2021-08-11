--How to write sql query for the below scenario
I/p:ORACLE

O/p:
O
R
A
C
L
E
i.e, splitting into multiple columns a string using sql.

Answer:

Select Substr(‘ORACLE’,Level,1) From Dual
Connect By Level<= Length(‘ORACLE’);


