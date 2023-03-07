select manf as Manufacturer from Beers group by manf having count(name) >= 3;

/* 
+----------------+
| Manufacturer   |
+----------------+
| Anheuser-Busch |
+----------------+
*/

