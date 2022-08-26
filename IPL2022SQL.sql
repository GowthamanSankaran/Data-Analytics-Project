
                                     #IPL 2022 ANALYSIS


#Getting into the Database Named Project
use project;

#Displaying the list of tables available in the Database
Show tables;

#Describing the table that is used for analysis
describe ipl2022;

#Having an outlook of data in the table
select * from ipl2022 limit 10;

#Dropping the unnecessary Columns for the analysis in the tables
alter table ipl2022 drop column id ;
alter table ipl2022 drop column method;

# City wise count of Matches played 
select  city Place, count(city) as Matches_Played from ipl2022 group by city;

#Stadium wise count of Matches played
select city,venue Stadium_Name ,count(venue) Matches_Played from ipl2022 group by venue;

#List of teams Participating in IPL 2022
select distinct(team1) IPL_Teams from ipl2022 
union 
select distinct (team2) 
from ipl2022 order by IPL_Teams;

#Decision (Batting/Fielding) taken by team on winning toss
select distinct tossDecision,count(TossDecision) from ipl2022 group by tossdecision ;

#Team wise Tosses won count
select distinct tosswinner,count(TossWinner) No_of_Tosses_Won 
	from ipl2022 group by tosswinner order by No_of_Tosses_Won desc;

#Teams opted for Batting first on winning Toss
select  distinct(tosswinner ) Team,count(tossdecision) BatFirst 
	from ipl2022 where tossdecision ='bat'  group by tosswinner order by count(tossdecision) desc;

#Teams opted for Fielding first on winning Toss
select  distinct(tosswinner ) Team,count(tossdecision) FieldFirst from ipl2022
	where tossdecision ='field'  group by tosswinner order by count(tossdecision) desc;

#Count of Super overs happened in IPL 2022 (Note:-N :No)
select superover, count(superover) from ipl2022 group by superover;

#No.of Matches won by each team in IPL 2022
select winningteam Team,count(winningteam) Matches_won 
	from ipl2022 group by winningteam order by count(winningteam) desc;

#Teams going on winning Matches after winning Toss
select winningteam Team,count(winningteam) as `Matches_won where toss won` 
	from ipl2022 where winningteam = tosswinner group by winningteam order by count(winningteam) desc;

#Team wise Victory count on the basis of Toss Decision
select winningteam Team,count(winningteam) as `Matches_won where won toss and batted First` 
	from ipl2022 where winningteam = tosswinner and tossdecision='bat' group by winningteam order by count(winningteam) desc;

select winningteam Team,count(winningteam) as `Matches_won where won toss and Fielded First` 
	from ipl2022 where winningteam = tosswinner and tossdecision='field' group by winningteam order by count(winningteam) desc;

#Team wise Victory count despite lossing Toss
select winningteam Team,count(winningteam) as `Matches_won where toss lost` 
	from ipl2022 where winningteam != tosswinner group by winningteam order by count(winningteam) desc;

#Player wise Man of the Match award count
select distinct Player_of_match, count(player_of_match) No_of_MOM 
	from ipl2022 group by player_of_match order by No_of_MOM desc ;

#Team wise Player of the Match award count
select distinct player_of_match `CSK - P.O.M`, count(player_of_match) as `No.of.P.O.M` from ipl2022 where winningteam=('chennai super kings') group by player_of_match order by count(player_of_match) desc;
select distinct player_of_match  `MI - P.O.M`, count(player_of_match) as `No.of.P.O.M` from ipl2022 where winningteam='Mumbai Indians' group by player_of_match order by count(player_of_match) desc;
select distinct player_of_match  `RCB - P.O.M`, count(player_of_match) as `No.of.P.O.M`from ipl2022 where winningteam='ROyal challengers Bangalore' group by player_of_match order by count(player_of_match) desc;
select distinct player_of_match  `KKR - P.O.M`, count(player_of_match) as `No.of.P.O.M` from ipl2022 where winningteam='kolkata knight riders' group by player_of_match order by count(player_of_match) desc;
select distinct player_of_match  `DC - P.O.M`, count(player_of_match) as `No.of.P.O.M` from ipl2022 where winningteam='Delhi Capitals' group by player_of_match order by count(player_of_match) desc;
select distinct player_of_match  `RR - P.O.M`, count(player_of_match) as `No.of.P.O.M` from ipl2022 where winningteam='Rajasthan Royals' group by player_of_match order by count(player_of_match) desc;
select distinct player_of_match  `SRH - P.O.M`, count(player_of_match) as `No.of.P.O.M` from ipl2022 where winningteam='Sunrisers Hyderabad' group by player_of_match order by count(player_of_match) desc;
select distinct player_of_match  `PK - P.O.M`, count(player_of_match) as `No.of.P.O.M` from ipl2022 where winningteam='Punjab Kings' group by player_of_match order by count(player_of_match) desc;
select distinct player_of_match  `GT - P.O.M`, count(player_of_match) as `No.of.P.O.M` from ipl2022 where winningteam='Gujarat Titans' group by player_of_match order by count(player_of_match) desc;
select distinct player_of_match  `LSG - P.O.M`, count(player_of_match) as `No.of.P.O.M` from ipl2022 where winningteam='Lucknow Super Giants' group by player_of_match order by count(player_of_match) desc;

#List of Officials Umpired along with no. of matches umpired in IPL2022
select distinct umpire1 `Umpire Name`,count(umpire1) `No.Of.Matches Umpired` from ipl2022 group by umpire1  
union
select distinct umpire2,count(umpire2) from ipl2022 group by umpire2  order by `No.Of.Matches Umpired` desc ;