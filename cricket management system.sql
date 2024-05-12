create database cricket_management_system;
use cricket_management_system;
create table Coaches(
Coach_ID int primary key,
Coach_Name varchar(50),
Nationality varchar(50),
Role varchar(50),
Experience int,
Speciality varchar(50),
Date_joined date,
Tournament_Wins int,
Current_on_Duty boolean
);

Create table Stadiums (
Stadium_ID int primary key,
Name varchar(50),
Country_Name varchar(50),
Capacity int,
Currently_in_Use boolean,
VIP_Seats int
);


CREATE TABLE Teams(
Team_ID int primary key,
Name varchar(50),
Coach_ID int,
Captain_ID int ,
No_of_Wins int,
No_of_Loses int,
No_od_Draws int,
No_of_Bowlers int,
No_of_Batsman int,
foreign key (Coach_ID) references Coaches (Coach_ID)
);

CREATE TABLE Players(
Player_ID int primary key,
Name  varchar (50),
Date_of_Birth date,
Nationality varchar(50),
Team_ID int,
No_of_Worldcups int,
No_of_Matches int,
Role varchar(50),
Batting_Average float,
Batting_Style varchar(50),
Bowling_Average float,
Bowling_Style varchar(50),
foreign key (Team_ID) references Teams(Team_ID)
);

CREATE TABLE Match_Summery(
	Match_ID int primary key ,
    Match_Name varchar(50),
    Match_Date date,
    Stadium_ID int,
    Team1_ID int,
    Team2_ID int,
    Winner_ID int,
    Man_of_the_Match_ID int,
    foreign key (Stadium_ID) references Stadiums(Stadium_ID),
    foreign key (Team1_ID) references Teams(Team_ID),
     foreign key (Team2_ID) references Teams(Team_ID),
    foreign key (Winner_ID) references Teams(Team_ID),
foreign key (Man_of_the_Match_ID) references Players(Player_ID)
);


CREATE TABLE Bowling_Statistics (
Bowling_Rank int,
Player_ID int,
Match_ID int,
Overs_Bowled float,
Runs_Conceded int,
Wicket_taken int ,
Bowling_Average float,
foreign key (Player_ID)references Players(Player_ID),
foreign key (Match_ID)references Match_Summery (Match_ID)
);

CREATE TABLE Batting_Statistics (
Batting_Rank int,
Player_ID int,
Match_ID int,
Runs_Scored int,
Balls_Faced int,
strike_Rate float ,
Batting_Average float,
foreign key (Player_ID)references Players(Player_ID),
foreign key (Match_ID)references Match_Summery (Match_ID)
);

CREATE TABLE Rankings(
Team_ID int,
Team_Name varchar(50),
Ranking int,
Points int,
foreign key(Team_ID) references Teams(Team_ID)
);


CREATE TABLE Tournaments(
Tournament_ID int primary key,
Nmae varchar(50),
Start_Date date,
End_Date date,
Format varchar(50),
No_of_Teams int,
No_of_Total_Matches int,
No_of_Each_Team_Matches int 
);

CREATE TABLE Umpire (
Umpire_ID int primary key,
Name varchar (50),
Nationality varchar(50),
Experience int,
Umpire_Level varchar (50)
);