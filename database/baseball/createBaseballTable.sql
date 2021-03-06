CREATE TABLE PITCHERS(
    pid varchar2(4),
    pName varchar2(20),
    salary integer,
    CONSTRAINT P_PK PRIMARY KEY (pid)    
);
CREATE TABLE TEAMS(
    tid varchar2(20),
    location varchar2(20),
    manager varchar2(20),
    CONSTRAINT T_PK PRIMARY KEY (tid)
);
CREATE TABLE RECORDS(
    rid varchar2(10),
    home_team_id varchar2(10),
    away_team_id varchar2(10),
    starting_pitcher_home varchar2(10),
    starting_pitcher_away varchar2(10), 
    CONSTRAINT R_PK PRIMARY KEY (rid),
    CONSTRAINT R_FK_homeTeamId FOREIGN KEY(home_team_id) REFERENCES Teams(tid),
    CONSTRAINT R_FK_awayTeamId FOREIGN KEY(away_team_id) REFERENCES Teams(tid),
    CONSTRAINT R_FK_homeStartPitcher FOREIGN KEY(starting_pitcher_home) REFERENCES Pitchers(pid),
    CONSTRAINT R_FK_awayStartPitcher FOREIGN KEY(starting_pitcher_away) REFERENCES Pitchers(pid)
);


INSERT INTO PITCHERS (pid, pName, salary) VALUES ('p01', 'pName01', '500');
INSERT INTO PITCHERS (pid, pName, salary) VALUES ('p02', 'pName02', '400');
INSERT INTO PITCHERS (pid, pName, salary) VALUES ('p03', 'pName03', '300');
INSERT INTO PITCHERS (pid, pName, salary) VALUES ('p04', 'pName04', '200');
INSERT INTO PITCHERS (pid, pName, salary) VALUES ('p05', 'pName05', '500');
INSERT INTO PITCHERS (pid, pName, salary) VALUES ('p06', 'pName06', '900');
INSERT INTO PITCHERS (pid, pName, salary) VALUES ('p07', 'pName08', '400');
INSERT INTO PITCHERS (pid, pName, salary) VALUES ('p08', 'pName09', '300');
INSERT INTO PITCHERS (pid, pName, salary) VALUES ('p09', 'pName10', '100');
INSERT INTO PITCHERS (pid, pName, salary) VALUES ('p10', 'pName11', '400');
INSERT INTO PITCHERS (pid, pName, salary) VALUES ('p11', 'pName12', '700');

INSERT INTO Teams (tid, location, manager) VALUES ('t1', 't1Name', 't1Manager');
INSERT INTO Teams (tid, location, manager) VALUES ('t2', 't2Name', 't2Manager');
INSERT INTO Teams (tid, location, manager) VALUES ('t3', 't3Name', 't3Manager');
INSERT INTO Teams (tid, location, manager) VALUES ('t4', 't4Name', 't4Manager');
INSERT INTO Teams (tid, location, manager) VALUES ('t5', 't5Name', 't5Manager');
INSERT INTO Teams (tid, location, manager) VALUES ('t6', 't6Name', 't6Manager');

INSERT INTO RECORDS (rid, HOME_TEAM_ID, AWAY_TEAM_ID, STARTING_PITCHER_HOME, STARTING_PITCHER_AWAY) VALUES ('R01', 't2', 't1', 'p01', 'p02');
INSERT INTO RECORDS (rid, HOME_TEAM_ID, AWAY_TEAM_ID, STARTING_PITCHER_HOME, STARTING_PITCHER_AWAY) VALUES ('R02', 't1', 't3', 'p03', 'p01');
INSERT INTO RECORDS (rid, HOME_TEAM_ID, AWAY_TEAM_ID, STARTING_PITCHER_HOME, STARTING_PITCHER_AWAY) VALUES ('R03', 't1', 't2', 'p04', 'p02');
INSERT INTO RECORDS (rid, HOME_TEAM_ID, AWAY_TEAM_ID, STARTING_PITCHER_HOME, STARTING_PITCHER_AWAY) VALUES ('R04', 't3', 't1', 'p02', 'p01');
INSERT INTO RECORDS (rid, HOME_TEAM_ID, AWAY_TEAM_ID, STARTING_PITCHER_HOME, STARTING_PITCHER_AWAY) VALUES ('R05', 't1', 't3', 'p01', 'p03');
INSERT INTO RECORDS (rid, HOME_TEAM_ID, AWAY_TEAM_ID, STARTING_PITCHER_HOME, STARTING_PITCHER_AWAY) VALUES ('R06', 't5', 't2', 'p01', 'p04');
INSERT INTO RECORDS (rid, HOME_TEAM_ID, AWAY_TEAM_ID, STARTING_PITCHER_HOME, STARTING_PITCHER_AWAY) VALUES ('R07', 't1', 't2', 'p03', 'p01');
INSERT INTO RECORDS (rid, HOME_TEAM_ID, AWAY_TEAM_ID, STARTING_PITCHER_HOME, STARTING_PITCHER_AWAY) VALUES ('R08', 't5', 't3', 'p04', 'p02');
INSERT INTO RECORDS (rid, HOME_TEAM_ID, AWAY_TEAM_ID, STARTING_PITCHER_HOME, STARTING_PITCHER_AWAY) VALUES ('R09', 't1', 't2', 'p01', 'p04');
INSERT INTO RECORDS (rid, HOME_TEAM_ID, AWAY_TEAM_ID, STARTING_PITCHER_HOME, STARTING_PITCHER_AWAY) VALUES ('R10', 't1', 't2', 'p02', 'p03');
INSERT INTO RECORDS (rid, HOME_TEAM_ID, AWAY_TEAM_ID, STARTING_PITCHER_HOME, STARTING_PITCHER_AWAY) VALUES ('R11', 't3', 't2', 'p03', 'p01');
INSERT INTO RECORDS (rid, HOME_TEAM_ID, AWAY_TEAM_ID, STARTING_PITCHER_HOME, STARTING_PITCHER_AWAY) VALUES ('R12', 't4', 't2', 'p01', 'p03');
INSERT INTO RECORDS (rid, HOME_TEAM_ID, AWAY_TEAM_ID, STARTING_PITCHER_HOME, STARTING_PITCHER_AWAY) VALUES ('R13', 't2', 't4', 'p01', 'p02');
INSERT INTO RECORDS (rid, HOME_TEAM_ID, AWAY_TEAM_ID, STARTING_PITCHER_HOME, STARTING_PITCHER_AWAY) VALUES ('R14', 't3', 't2', 'p01', 'p04');
INSERT INTO RECORDS (rid, HOME_TEAM_ID, AWAY_TEAM_ID, STARTING_PITCHER_HOME, STARTING_PITCHER_AWAY) VALUES ('R15', 't4', 't3', 'p03', 'p02');
INSERT INTO RECORDS (rid, HOME_TEAM_ID, AWAY_TEAM_ID, STARTING_PITCHER_HOME, STARTING_PITCHER_AWAY) VALUES ('R16', 't1', 't2', 'p03', 'p04');
INSERT INTO RECORDS (rid, HOME_TEAM_ID, AWAY_TEAM_ID, STARTING_PITCHER_HOME, STARTING_PITCHER_AWAY) VALUES ('R17', 't5', 't2', 'p02', 'p04');
INSERT INTO RECORDS (rid, HOME_TEAM_ID, AWAY_TEAM_ID, STARTING_PITCHER_HOME, STARTING_PITCHER_AWAY) VALUES ('R18', 't3', 't2', 'p02', 'p04');
INSERT INTO RECORDS (rid, HOME_TEAM_ID, AWAY_TEAM_ID, STARTING_PITCHER_HOME, STARTING_PITCHER_AWAY) VALUES ('R19', 't4', 't2', 'p01', 'p01');
