--Get the date, batting team id and number of pairs of back-to-back home runs 
select game_dt, to_date(to_char(game_dt,'99999999'),'YYYYMMDD'), e1.bat_team_id, count(*)
from events e1
join events e2
on e1.game_id = e2.game_id and e1.inn_ct = e2.inn_ct and e1.bat_team_id = e2.bat_team_id and e1.inn_pa_ct + 1 = e2.inn_pa_ct
join games
on e1.game_id = games.game_id
where e1.event_cd = '23' and e2.event_cd = '23'
group by game_dt, e1.bat_team_id, e1.event_cd, e2.event_cd
order by game_dt desc;