select bar, count(price) as Total from Sells where price>= '2' group by bar;

/*
+------------+-------+
| bar        | Total |
+------------+-------+
| Bob's bar  |     2 |
| Joe's bar  |     4 |
| Mary's bar |     2 |
+------------+-------+
*/

