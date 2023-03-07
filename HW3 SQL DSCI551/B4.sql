select bar from Sells where price = (select max(price) from Sells);

/*
+-----------+
| bar       |
+-----------+
| Joe's bar |
+-----------+
*/

