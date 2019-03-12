CREATE TABLE SUPPLIERS(   
    sid integer, 
   sname varchar2(10), 
   address varchar2(10), 
    CONSTRAINT S_PK PRIMARY KEY (SID)
);

CREATE TABLE PARTS(   
    pid integer, 
   pName varchar2(10), 
   color varchar2(10), 
    CONSTRAINT P_PK PRIMARY KEY (PID)
);

CREATE TABLE CATALOG(
    sid integer,
    pid integer,
    cost real,
    CONSTRAINT C_FK_SID FOREIGN KEY(SID) REFERENCES SUPPLIERS(sid),
    CONSTRAINT C_FK_PID FOREIGN KEY(PID) REFERENCES PARTS(pid)
);
INSERT INTO SUPPLIERS (sid, sname, address) VALUES ('10', 'suName1', 'ads1');
INSERT INTO SUPPLIERS (sid, sname, address) VALUES ('20', 'suName2', 'ads2');
INSERT INTO SUPPLIERS (sid, sname, address) VALUES ('30', 'suName3', 'ads3');
INSERT INTO SUPPLIERS (sid, sname, address) VALUES ('40', 'suName4', 'ads4');

INSERT INTO PARTS (pid, pName, color) VALUES ('11', 'paName1', 'red');
INSERT INTO PARTS (pid, pName, color) VALUES ('21', 'paName2', 'red');
INSERT INTO PARTS (pid, pName, color) VALUES ('31', 'paName3', 'red');
INSERT INTO PARTS (pid, pName, color) VALUES ('41', 'paName4', 'black');
INSERT INTO PARTS (pid, pName, color) VALUES ('51', 'paName5', 'green');
INSERT INTO PARTS (pid, pName, color) VALUES ('61', 'paName6', 'green');
INSERT INTO PARTS (pid, pName, color) VALUES ('71', 'paName7', 'red');

INSERT INTO CATALOG (sid, pid, cost) VALUES ('10', '11', '200');
INSERT INTO CATALOG (sid, pid, cost) VALUES ('10', '21', '200');
INSERT INTO CATALOG (sid, pid, cost) VALUES ('20', '11', '300');
INSERT INTO CATALOG (sid, pid, cost) VALUES ('20', '51', '500');
INSERT INTO CATALOG (sid, pid, cost) VALUES ('20', '51', '700');
INSERT INTO CATALOG (sid, pid, cost) VALUES ('30', '11', '100');
INSERT INTO CATALOG (sid, pid, cost) VALUES ('30', '51', '200');
INSERT INTO CATALOG (sid, pid, cost) VALUES ('40', '11', '300');
INSERT INTO CATALOG (sid, pid, cost) VALUES ('40', '21', '500');
INSERT INTO CATALOG (sid, pid, cost) VALUES ('40', '41', '700');
INSERT INTO CATALOG (sid, pid, cost) VALUES ('40', '51', '500');
INSERT INTO CATALOG (sid, pid, cost) VALUES ('40', '61', '200');
INSERT INTO CATALOG (sid, pid, cost) VALUES ('40', '71', '900');