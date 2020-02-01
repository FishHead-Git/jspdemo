package sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class DBUtill implements SqlDao{
	final private String url="jdbc:mysql://localhost:3306/jspdemo?"+
				"serverTimezone=UTC&useSSL=false&characterEncoding=utf-8";
	final private String user = "root";
	final private String pwd = "123456";
	final private String driver = "com.mysql.cj.jdbc.Driver";
	Connection conn;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new DBUtill();
	}
	
	public DBUtill() {
		// TODO Auto-generated constructor stub
		try {
			// ������
			Class.forName(driver);
			// �������ݿ�
			conn = DriverManager.getConnection(url, user, pwd);	
			// ���û�д��������ı�������
			this.createLoginTable();
			this.createCourseTable();
			this.createScoreTable();
			this.createStudentTable();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	@Override
	public ResultSet selectexecute(String Sql, Map<String, String> values) {
		// TODO Auto-generated method stub
		PreparedStatement stmt;
		try {
			// Sql = 'select * from tablename'
			StringBuffer stb = new StringBuffer(Sql);
			// �����ɸѡ�������ͽ���ɸѡ��û�о�ȫ��ɨ��
			if(values != null) {
				stb.append(" where ");
				boolean flag = true;
				// ȡ�����е� key=value
				for(Map.Entry<String, String> entry:values.entrySet()){
					if(flag) {
						flag = false;
						stb.append(entry.getKey()+"='"+entry.getValue()+"' ");
					}
					stb.append("and "+entry.getKey()+"='"+entry.getValue()+"' ");
				}
			}
			// ��sql���Ԥ����
			stmt = conn.prepareStatement(stb.toString());
			// ����sql��䴦����
			return stmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public int insertexecute(String Sql, String[] arg) {
		// TODO Auto-generated method stub
		PreparedStatement stmt;
		try {
			// Sql = 'insert into logintable values (?, ?)'
			// ��sql���Ԥ����
			stmt = conn.prepareStatement(Sql);
			// ��ÿ��ֵ���ڶ�Ӧλ��
			for(int i=0;i<arg.length;i++)
				stmt.setString(i+1, arg[i]);
			// �޸ĺͲ���ʹ��executeUpdate()
			return stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public int updateexecute(String Sql) {
		// TODO Auto-generated method stub
		PreparedStatement stmt;
		try {
			// ��sql���Ԥ����
			stmt = conn.prepareStatement(Sql);
			// ����sql��䴦����
			return stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	

	private void createLoginTable() {
		String SQL_TABLE = "create table if not exists LoginTable(" +
				"username varchar(30) not null primary key," + 
				"password varchar(255) not null" + 
				")ENGINE=InnoDB default charset=utf8;";
		try {
			PreparedStatement s = conn.prepareStatement(SQL_TABLE);
			s.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	private void createStudentTable() {
		String SQL_TABLE = "create table if not exists StudentTable(" +
				"studentname varchar(30) not null," + 
				"studentid int not null primary key," +
				"phone varchar(11)," + 
				"email varchar(255)" + 
				")ENGINE=InnoDB default charset=utf8;";
		try {
			PreparedStatement s = conn.prepareStatement(SQL_TABLE);
			s.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	private void createCourseTable() {
		String SQL_TABLE = "create table if not exists CourseTable(" +
				"classname varchar(30) not null," + 
				"classid int not null primary key" + 
				")ENGINE=InnoDB default charset=utf8;";
		try {
			PreparedStatement s = conn.prepareStatement(SQL_TABLE);
			s.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	private void createScoreTable() {
		String SQL_TABLE = "create table if not exists ScoreTable(" +
				"scoreid varchar(30) not null primary key," + 
				"classid int not null," + 
				"studentid int not null," +
				"score int not null" +
				")ENGINE=InnoDB default charset=utf8;";
		try {
			PreparedStatement s = conn.prepareStatement(SQL_TABLE);
			s.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void close() {
		// TODO Auto-generated method stub
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
