select drinker from Likes l1 where beer = 'Bud' and l1.drinker != (select drinker from Likes l2 where l2.beer = 'Summerbrew');

/*
+----------+
| drinker  |
+----------+
| Bill     |
| Jennifer |
+----------+
*/

