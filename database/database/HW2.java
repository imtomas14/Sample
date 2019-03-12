package database;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.Scanner;
import java.util.StringTokenizer;

public class HW2 {

	public static void main(String args[]) {

		createTable();
		@SuppressWarnings("resource")
		Scanner scan = new Scanner(System.in);
		String fileName, tableName;
		int inputindex;
		while (true) {
			inputindex = scan.nextInt();
			switch (inputindex) {
			case 1:
				fileName = scan.next();
				insertTable(fileName);
				break;
			case 2:
				tableName = scan.next();
				printTable(tableName);
				break;
				
			}
		}
	}

	public static void createTable() {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String createquery = "drop table student cascade constraints;" + "drop table faculty cascade constraints;"
				+ "drop table class cascade constraints;" + "drop table enrolled cascade constraints;"
				+ "drop table emp cascade constraints;" + "drop table works cascade constraints;"
				+ "drop table dept cascade constraints;" + "drop table flights cascade constraints;"
				+ "drop table aircraft cascade constraints;" + "drop table certified cascade constraints;"
				+ "drop table employees cascade constraints;" + "drop table suppliers cascade constraints;"
				+ "drop table parts cascade constraints;" + "drop table catalog cascade constraints;"
				+ "drop table sailors cascade constraints;" + "drop table sailors cascade constraints;"
				+ "create table student(" + "snum number(9,0) primary key," + "sname varchar2(30),"
				+ "major varchar2(25)," + "standing varchar2(2)," + "age number(3,0)" + ");" + "create table faculty("
				+ "fid number(9,0) primary key," + "fname varchar2(30)," + "deptid number(2,0)" + ");"
				+ "create table class(" + "name varchar2(40) primary key," + "meets_at varchar2(20),"
				+ "room varchar2(10)," + "fid number(9,0)," + "foreign key(fid) references faculty" + ");"
				+ "create table enrolled(" + "snum number(9,0)," + "cname varchar2(40)," + "primary key(snum,cname),"
				+ "foreign key(snum) references student," + "foreign key(cname) references class(name)" + ");"
				+ "create table emp(" + "eid number(9,0) primary key," + "ename varchar2(30)," + "age number(3,0),"
				+ "salary number(10,2)" + ");" + "create table dept(" + "did number(2,0) primary key,"
				+ "dname varchar2(20)," + "budget number(10,2)," + "managerid number(9,0),"
				+ "foreign key(managerid) references emp(eid)" + ");" + "create table works(" + "eid number(9,0),"
				+ "did number(2,0)," + "pct_time number(3,0)," + "primary key(eid,did),"
				+ "foreign key(eid) references emp," + "foreign key(did) references dept" + ");"
				+ "create table flights(" + "flno number(4,0) primary key," + "origin varchar2(20),"
				+ "destination varchar2(20)," + "distance number(6,0)," + "departs date," + "arrives date,"
				+ "price number(7,2)" + ");" + "create table aircraft(" + "aid number(9,0) primary key,"
				+ "aname varchar2(30)," + "crusingrange number(6,0)" + ");" + "create table employees("
				+ "eid number(9,0) primary key," + "ename varchar2(30)," + "salary number(10,2)" + ");"
				+ "create table certified(" + "eid number(9,0)," + "aid number(9,0)," + "primary key(eid,aid),"
				+ "foreign key(eid) references employees," + "foreign key(aid) references aircraft" + ");"
				+ "create table suppliers(" + "sid number(9,0) primary key," + "sname varchar2(30),"
				+ "address varchar2(50)" + ");" + "create table parts(" + "pid number(9,0) primary key,"
				+ "pname varchar2(40)," + "color varchar2(15)" + ");" + "create table catalog(" + "sid number(9,0),"
				+ "pid number(9,0)," + "cost number(10,2)," + "primary key(sid,pid),"
				+ "foreign key(sid) references suppliers," + "foreign key(pid) references parts" + ");"
				+ "create table sailors(" + "sid number(9,0) primary key," + "sname varchar2(30),"
				+ "rating number(2,0)," + "age number(4,1)" + ");";

		StringTokenizer st = new StringTokenizer(createquery, ";");
		while (st.hasMoreTokens()) {
			try {
				conn = HW2DBConnection.getConnection();
				pstm = conn.prepareStatement(st.nextToken());
				rs = pstm.executeQuery();
				ResultSetMetaData rsmd = rs.getMetaData();
				rsmd.getColumnType(1);
			} catch (SQLException sqle) {
			} finally {
				// Disconnect DB.
				try {
					if (rs != null)
						rs.close();
					if (pstm != null)
						pstm.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
					throw new RuntimeException(e.getMessage());
				}
			}
		}
	}

	public static void insertTable(String fileName) {
		StringTokenizer fn = new StringTokenizer(fileName, ".");
		String tableName = fn.nextToken();
		String selectQuery = "SELECT * FROM " + tableName;
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		ResultSetMetaData rsmd = null;
		String tableSchema = "(";
		String insQuery;
		int schemaIndex;
		try {
			String path = HW2.class.getResource("").getPath();
			File file = new File(path + fileName);
			FileReader filereader = new FileReader(file);
			BufferedReader bufReader = new BufferedReader(filereader);
			String fileLine;
			try {
				conn = HW2DBConnection.getConnection();
				pstm = conn.prepareStatement(selectQuery);
				rs = pstm.executeQuery();
				rsmd = rs.getMetaData();
				tableSchema += rsmd.getColumnLabel(1);
				for (int tableIndex = 2; tableIndex <= rsmd.getColumnCount(); tableIndex++) {
					tableSchema += ",";
					tableSchema += rsmd.getColumnLabel(tableIndex);
				}
				tableSchema += ")";
				tableSchema = "INSERT INTO " + tableName + tableSchema + "VALUES (";

				while ((fileLine = bufReader.readLine()) != null) {
					schemaIndex = 2;
					StringTokenizer st = new StringTokenizer(fileLine, ",");
					insQuery = tableSchema + "'" + st.nextToken() + "'";
					while (st.hasMoreTokens()) {
						if (rsmd.getColumnTypeName(schemaIndex) == "DATE") {
							String tmp = st.nextToken();
							insQuery += ",'" + tmp.substring(0, 4) + "-" + tmp.substring(5, 7) + "-"
									+ tmp.substring(8, 10) + "'";
						} else
							insQuery += ",'" + st.nextToken() + "'";
						schemaIndex++;
					}
					insQuery += ")";
					pstm = conn.prepareStatement(insQuery);
					rs = pstm.executeQuery();
				}
			} catch (SQLException sqle) {
				pirntErrCode(sqle);
			} finally {
				// Disconnect DB.
				try {
					if (rs != null)
						rs.close();
					if (pstm != null)
						pstm.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
					throw new RuntimeException(e.getMessage());
				}
			}
		} catch (FileNotFoundException e) {
		} catch (IOException e) {
			System.out.println(e);
		}
	}

	public static void pirntErrCode(SQLException sqle) {
		switch (sqle.getErrorCode()) {
		case 942:
			System.out.println("No record inserted yet");
			break;
		default:
			sqle.printStackTrace();
			break;
		}
	}

	@SuppressWarnings("resource")
	public static void printTable(String tableName) {
		String selectQuery = "SELECT * FROM " + tableName;
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		ResultSetMetaData rsmd = null;
		String header, contents;
		int printSize;

		try {
			conn = HW2DBConnection.getConnection();
			pstm = conn.prepareStatement(selectQuery);
			rs = pstm.executeQuery();
			rsmd = rs.getMetaData();
			if (rsmd.getPrecision(1) < rsmd.getColumnLabel(1).length())
				header = String.format("%-" + String.format("%s", rsmd.getColumnLabel(1).length() + 2) + "s",
						rsmd.getColumnName(1));
			else
				header = String.format("%-" + String.format("%s", rsmd.getPrecision(1) + 2) + "s",
						rsmd.getColumnName(1));
			for (int schemaIndex = 2; schemaIndex <= rsmd.getColumnCount(); schemaIndex++) {
				printSize = rsmd.getPrecision(schemaIndex);
				if (rsmd.getPrecision(schemaIndex) < rsmd.getColumnLabel(schemaIndex).length())
					printSize = rsmd.getColumnLabel(schemaIndex).length();
				if (rsmd.getColumnTypeName(schemaIndex) == "DATE")
					printSize = 10;
				if(schemaIndex == rsmd.getColumnCount())
					header += String.format("%" + String.format("%s", printSize) + "s",
							rsmd.getColumnName(schemaIndex));
				else
					header += String.format("%-" + String.format("%s", printSize + 2) + "s",
							rsmd.getColumnName(schemaIndex));
			}
			String line = "";
			for (int i = 1; i <= header.length(); i++)
				line += "=";

			selectQuery += " ORDER BY " + rsmd.getColumnLabel(1);
			pstm = conn.prepareStatement(selectQuery);
			rs = pstm.executeQuery();
			rsmd = rs.getMetaData();
			if (!rs.next())
				throw new SQLException("No record inserted yet");

			System.out.println(header);
			System.out.println(line);
			try {
				do {
					for (int schemaIndex = 1; schemaIndex <= rsmd.getColumnCount(); schemaIndex++) {
						printSize = rsmd.getPrecision(schemaIndex);
						if (rsmd.getPrecision(schemaIndex) < rsmd.getColumnLabel(schemaIndex).length())
							printSize = rsmd.getColumnLabel(schemaIndex).length();

						switch (rsmd.getColumnTypeName(schemaIndex)) {
						case "NUMBER":
							if (schemaIndex == 1 || schemaIndex == rsmd.getColumnCount())
								contents = "%" + String.format("%d", printSize);
							else
								contents = "%-" + String.format("%d", printSize + 2);
							contents += "d";
							if (schemaIndex == 1)
								contents += "  ";
							System.out.print(String.format(contents, rs.getInt(schemaIndex)));
							break;
						case "DATE":
							System.out.print(rs.getString(schemaIndex).substring(0, 10) + "  ");
							break;
						case "VARCHAR2":
							if (schemaIndex == 1 || schemaIndex == rsmd.getColumnCount())
								contents = "%" + String.format("%d", printSize);
							else
								contents = "%-" + String.format("%d", printSize + 2);
							contents += "s";
							if (schemaIndex == 1)
								contents += "  ";
							System.out.print(String.format(contents, rs.getString(schemaIndex)));
							break;
						}
					}
					System.out.print("\n");
				} while (rs.next());
			} catch (SQLException sqle) {
				pirntErrCode(sqle);
			}
		} catch (SQLException sqle) {
			pirntErrCode(sqle);
		} finally {
			// DB 연결을 종료한다.
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}

		}
	}
}

class HW2DBConnection {
	public static Connection dbConn;

	public static Connection getConnection() {
		Connection conn = null;
		try {
			String user = "imtomas"; 
            String pw = "imtomas423";
            String url = "jdbc:oracle:thin:@localhost:1521:tyuioper";

			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pw);

			// DB connect Success.

		} catch (ClassNotFoundException cnfe) {
			System.out.println("DB 드라이버 로딩 실패 :" + cnfe.toString());
		} catch (SQLException sqle) {
			System.out.println("DB 접속실패 : " + sqle.toString());
		} catch (Exception e) {
			System.out.println("Unkonwn error");
			e.printStackTrace();
		}
		return conn;
	}
}