select e.first_name, e.last_name, t.title from employees e, titles t where t.from_date = '2000-3-23' and t.title like '%Engineer%' and t.emp_no = e.emp_no;

/*
+------------+---------------+-----------------+
| first_name | last_name     | title           |
+------------+---------------+-----------------+
| Nahla      | Silva         | Engineer        |
| Uli        | Lichtner      | Senior Engineer |
| Matk       | Schlegelmilch | Senior Engineer |
| Mayuko     | Luff          | Engineer        |
| Masami     | Panienski     | Senior Engineer |
| Tzvetan    | Brodie        | Senior Engineer |
| Kerhong    | Pappas        | Senior Engineer |
| Xiaoshan   | Keirsey       | Senior Engineer |
| Jiakeng    | Baaleh        | Senior Engineer |
| Fox        | Begiun        | Senior Engineer |
+------------+---------------+-----------------+
*/
