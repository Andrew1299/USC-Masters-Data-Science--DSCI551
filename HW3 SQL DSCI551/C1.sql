create view Beers2Bars as select s.bar, s.beer, s.price, b.manf from Sells s, Beers b where b.name = s.beer;

select * from Beers2Bars;

/*

+------------+------------+-------+----------------+
| bar        | beer       | price | manf           |
+------------+------------+-------+----------------+
| Bob's bar  | Bud        |     3 | Anheuser-Busch |
| Joe's bar  | Bud        |     3 | Anheuser-Busch |
| Mary's bar | Bud        |  NULL | Anheuser-Busch |
| Joe's bar  | Bud Lite   |     3 | Anheuser-Busch |
| Mary's bar | Bud Lite   |     3 | Anheuser-Busch |
| Mary's bar | Budweiser  |     2 | Heineken       |
| Joe's bar  | Michelob   |     3 | Anheuser-Busch |
| Bob's bar  | Summerbrew |     3 | Pete's         |
| Joe's bar  | Summerbrew |     4 | Pete's         |
+------------+------------+-------+----------------+
*/
