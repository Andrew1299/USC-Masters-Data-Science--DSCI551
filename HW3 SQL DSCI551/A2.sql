select e.first_name, e.last_name from employees e, salaries s where e.emp_no = s.emp_no and s.salary >= 150000;

/*
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Tokuyasu   | Pesch     |
| Tokuyasu   | Pesch     |
| Tokuyasu   | Pesch     |
| Tokuyasu   | Pesch     |
| Tokuyasu   | Pesch     |
| Ibibia     | Junet     |
| Xiahua     | Whitcomb  |
| Xiahua     | Whitcomb  |
| Lansing    | Kambil    |
| Willard    | Baca      |
| Willard    | Baca      |
| Tsutomu    | Alameldin |
| Tsutomu    | Alameldin |
| Tsutomu    | Alameldin |
| Tsutomu    | Alameldin |
| Tsutomu    | Alameldin |
| Charmane   | Griswold  |
| Charmane   | Griswold  |
| Weicheng   | Hatcliff  |
| Weicheng   | Hatcliff  |
| Mitsuyuki  | Stanfel   |
| Sanjai     | Luders    |
| Sanjai     | Luders    |
| Sanjai     | Luders    |
| Honesty    | Mukaidono |
| Honesty    | Mukaidono |
| Honesty    | Mukaidono |
| Weijing    | Chenoweth |
| Weijing    | Chenoweth |
| Shin       | Birdsall  |
| Shin       | Birdsall  |
| Mohammed   | Moehrke   |
| Lidong     | Meriste   |
| Lidong     | Meriste   |
| Lidong     | Meriste   |
| Lidong     | Meriste   |
+------------+-----------+
*/
