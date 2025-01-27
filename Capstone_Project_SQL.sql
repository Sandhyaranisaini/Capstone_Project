/*create and use database*/
create database capstone;
use capstone;

/*view dataset*/
select *from `football_data_merged_cleaned_data (3)`;

-- 1.find the top 10 players by most goals scored
select player_name_y, SUM(goals) as total_goals from `football_data_merged_cleaned_data (3)` group by player_name_y order by total_goals desc limit 10;
/*Interpretation: 'Christian Pulisic' is the number 1 player by most goals scored (658).*/

-- 2.stadium with attendance more then 50000
select game_id_x,stadium,attendance from`football_data_merged_cleaned_data (3)` where attendance > 50000 order by attendance desc;
/*Interpretation:here we got 1000 rows...these stadiums with attendance more than 50000.*/

-- 3.find the number of players in each home_club.
select home_club_name, COUNT(DISTINCT player_id) as player_count from`football_data_merged_cleaned_data (3)`
where home_club_goals is not null group by home_club_name
order by player_count
desc;
/*Interpretation: here 106 rows returned..here Borussia Dortmund home_club have higher player_count... that is 11. */

-- 4. find the players who haven't scored any goals
select player_name_y from `football_data_merged_cleaned_data (3)` group by player_name_y having SUM(goals)=0;
/*Interpretation:here 4 players haven't scored any goals. */

-- 5.players who  are team captains and have scored goals
select player_name_y,goals,team_captain from `football_data_merged_cleaned_data (3)`
where team_captain =1 and goals>0 order by goals desc;

-- 6.find the number of players in each away_club.
select away_club_name, COUNT(DISTINCT player_id) as player_count from`football_data_merged_cleaned_data (3)`
where away_club_goals is not null group by away_club_name
order by player_count desc;
/*Interpretation: here 103 rows returned..here Borussia Dortmund home_club have higher player_count... that is 8. */

-- 7.highest market value in each  season
select season,max(market_value_in_eur) highest_market_value_in_eur from`football_data_merged_cleaned_data (3)`
group by season order by highest_market_value_in_eur desc;

-- 8.total number of yellow cards given by referee
select referee,sum(yellow_cards) as totalyellowcards from`football_data_merged_cleaned_data (3)`
group by referee having  totalyellowcards > 0 order by totalyellowcards desc;
/*Interpretation:here 36 rows are returned. */

-- 9.find the average market_value_in_eur for players in each country_of_birth.
select country_of_birth,avg(market_value_in_eur) from `football_data_merged_cleaned_data (3)`
group by country_of_birth  order by avg(market_value_in_eur) desc;

-- 10.find total number of referees.
select count(distinct player_id) as total_players from `football_data_merged_cleaned_data (3)`;
/*Interpretation:total number of referees are 24. */