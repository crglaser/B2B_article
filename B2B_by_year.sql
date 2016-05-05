--Get the number of back to back home runs by year, sorted by year
select substring(e1.game_id from 4 for 4) as year, count(*)
from events e1
join events e2
on e1.game_id = e2.game_id and e1.inn_ct = e2.inn_ct and e1.bat_team_id = e2.bat_team_id and e1.inn_pa_ct + 1 = e2.inn_pa_ct
join games
on e1.game_id = games.game_id
where e1.event_cd = '23' and e2.event_cd = '23'
group by substring(e1.game_id from 4 for 4)
order by substring(e1.game_id from 4 for 4) desc;