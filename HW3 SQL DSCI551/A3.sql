select dept_no, count(emp_no) as employeeNum from dept_emp where from_date = '1988-10-20' group by dept_no;

/*
+---------+-------------+
| dept_no | employeeNum |
+---------+-------------+
| d001    |           4 |
| d002    |           2 |
| d003    |           2 |
| d004    |           9 |
| d005    |          20 |
| d006    |           4 |
| d007    |           9 |
| d008    |           3 |
| d009    |           1 |
+---------+-------------+

*/
