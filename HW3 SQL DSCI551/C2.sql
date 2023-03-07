select distinct manf as Manufacturer, avg(price) as Average from Beers2Bars group by manf;

/*
+----------------+---------+
| Manufacturer   | Average |
+----------------+---------+
| Anheuser-Busch |       3 |
| Heineken       |       2 |
| Pete's         |     3.5 |
+----------------+---------+
*/

