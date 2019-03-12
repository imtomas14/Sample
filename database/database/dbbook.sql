DROP TABLE student;
DROP TABLE faculty;
DROP TABLE class;
DROP TABLE enrolled;
DROP TABLE emp;
DROP TABLE works;
DROP TABLE dept;
DROP TABLE flights;
DROP TABLE aircraft;
DROP TABLE certified;
DROP TABLE employees;
DROP TABLE suppliers;
DROP TABLE parts;
DROP TABLE catalog;
DROP TABLE sailors;

CREATE TABLE student(
	sNum number(9,0) PRIMARY KEY,
	sName varchar2(30),
	sMajor varchar2(25),
	standing varchar2(2),
	age number(3,0)
	);
CREATE TABLE faculty(
	fid number(9,0) PRIMARY KEY,
	fname varchar2(30),
	deptid number(2,0)
	);
CREATE TABLE class(
	name varchar2(40) PRIMARY KEY,
	meets_at varchar2(20),
	room varchar2(10),
	fid number(9,0),
	FOREIGN KEY(fid) REFERENCES faculty
	);
CREATE TABLE enrolled(
	snum number(9,0),
	cname varchar2(40),
	PRIMARY KEY(snum,cname),
	FOREIGN KEY(snum) REFERENCES student,
	FOREIGN KEY(cname) REFERENCES class(name)
	);
CREATE TABLE emp(
	eid number(9,0) PRIMARY KEY,
	ename varchar2(30),
	age number(3,0),
	salary number(10,2)
	);
CREATE TABLE dept(
	did number(2,0) PRIMARY KEY,
	dname varchar2(20),
	budget number(10,2),
	managerid number(9,0),
	FOREIGN KEY(managerid) REFERENCES emp(eid)
	);
CREATE TABLE works(
	eid number(9,0),
	did number(2,0),
	pct_time number(3,0),
	PRIMARY KEY(eid,did),
	FOREIGN KEY(eid) REFERENCES emp,
	FOREIGN KEY(did) REFERENCES dept
	);
CREATE TABLE flights(
	flno number(4,0) PRIMARY KEY,
	origin varchar2(20),
	destination varchar2(20),
	distance number(6,0),
	departs DATE,
	arrives DATE,
	price number(7,2)
	);
CREATE TABLE aircraft(
	aid number(9,0) PRIMARY KEY,
	aname varchar2(30),
	crusingrange number(6,0)
	);
CREATE TABLE employees(
	eid number(9,0) PRIMARY KEY,
	ename varchar2(30),
	salary number(10,2)
	);
CREATE TABLE certified(
	eid number(9,0),
	aid number(9,0),
	PRIMARY KEY(eid,aid),
	FOREIGN KEY(eid) REFERENCES employees,
	FOREIGN KEY(aid) REFERENCES aircraft
	);
CREATE TABLE suppliers(
	sid number(9,0) PRIMARY KEY,
	sname varchar2(30),
	address varchar2(40)
	);
CREATE TABLE parts(
	pid number(9,0) PRIMARY KEY,
	pname varchar2(40),
	color varchar2(15)
	);
CREATE TABLE catalog(
	sid number(9,0),
	pid number(9,0),
	cost number(10,2),
	PRIMARY KEY(sid,pid),
	FOREIGN KEY(sid) REFERENCES suppliers,
	FOREIGN KEY(pid) REFERENCES parts
	);
CREATE TABLE sailors(
	sid number(9,0) PRIMARY KEY,
	sname varchar2(30),
	rating number(2,0),
	age number(4,1)
	);
