package com.slms.jdbc;

import java.io.InputStream;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.junit.Test;

import com.slms.javabeans.Student;

public class JDBCTools {

	//�������ݿ�
	public static Connection getConnection() throws Exception {
		// 1. ׼���������ݿ�� 4 ���ַ���.
		// 1). ���� Properties ����
		Properties properties = new Properties();

		// 2). ��ȡ jdbc.properties ��Ӧ��������
		InputStream in = JDBCTools.class.
				getClassLoader().getResourceAsStream("jdbc.properties");

		// 3). ���� 2) ��Ӧ��������
		properties.load(in);

		// 4). ������� user, password ��4 ���ַ���.
		String user = properties.getProperty("user");
		String password = properties.getProperty("password");
		String jdbcUrl = properties.getProperty("jdbcUrl");
		String driver = properties.getProperty("driver");

		// 2. �������ݿ���������(��Ӧ�� Driver ʵ��������ע�������ľ�̬�����.)
		Class.forName(driver);

		// 3. ͨ�� DriverManager �� getConnection() ������ȡ���ݿ�����.
		Connection connection = DriverManager.getConnection(jdbcUrl, user, password);

		return connection;
	}

	/**
	 * ִ�� SQL ���, ʹ�� PreparedStatement
	 * @param sql
	 * @param args: ��д SQL ռλ���Ŀɱ����
	 */
	// ��ɾ��
	public static void update(String sql, Object... args) {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = JDBCTools.getConnection();
			preparedStatement = connection.prepareStatement(sql);

			for (int i = 0; i < args.length; i++) {
				preparedStatement.setObject(i + 1, args[i]);
			}

			preparedStatement.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTools.releaseDB(null, preparedStatement, connection);
		}
	}
	
	
	/*@Test
	public void testStudent() {
		String sql = "SELECT student_id studentId, class_name className, academy, password "
				+ "FROM student WHERE student_id=55555555";
		List<Student> list = JDBCTools.query(Student.class, sql);
		//list.forEach(System.out::println);
		Student stu1 = list.get(0);
		if( (stu1.getStudentId()==55555555) && (stu1.getPassword().equals("1234")) ) {
			System.out.println("��½�ɹ�");
		}else {
			System.out.println("��½ʧ��");
		}
	}*/
	
	
	//��ѯ
	public static <T> List<T> query(Class<T> clazz,String sql, Object...args){
		T entity = null;
		List<T> list = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection(); 
			ps = conn.prepareStatement(sql);
			for (int i = 0; i < args.length; i++) {
                ps.setObject(i + 1, args[i]);
            }
            rs = ps.executeQuery();

			//���� ResultSetMetaData ��������ݿ����ֶ�����Ԫ����
			ResultSetMetaData rsmd = rs.getMetaData();
			// ����һ�� Map<String, Object> ����
            // ��: SQL ��ѯ���еı���
            // ֵ: SQL ��ѯ���е�ֵ
			Map<String, Object> map = new HashMap<>();
			//�����ѯ�õ�������
			list = new ArrayList<>();
			
			while(rs.next()){
				map.clear();
				for(int i=0; i < rsmd.getColumnCount(); i++) {
					String columnLabel = rsmd.getColumnLabel(i+1);
					Object columnValue = rs.getObject(columnLabel);
					map.put(columnLabel,columnValue);
				}
				//�� Map ��Ϊ�ռ�, ���÷��䴴�� tClass ��Ӧ�Ķ���
				if(!map.isEmpty()) {
					try {
						entity = clazz.newInstance();
						
						/*Map��java�еĽӿڣ�Map.Entry��Map��һ���ڲ��ӿڡ�
						Map�ṩ��һЩ���÷�������keySet()��entrySet()�ȷ�����
						keySet()��������ֵ��Map��keyֵ�ļ��ϣ�entrySet()�ķ���ֵҲ�Ƿ���һ��Set���ϣ��˼��ϵ�����ΪMap.Entry��*/

						for(Map.Entry<String, Object> entry:map.entrySet()) {
							String name = entry.getKey();
							Object value = entry.getValue();
							try {
                                //���÷�������ʵ������ֶ�
                                Field field = clazz.getDeclaredField(name);
                                field.setAccessible(true);
                                field.set(entity, value);
                            } catch (NoSuchFieldException e) {
                                e.printStackTrace();
                            }
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					list.add(entity);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			releaseDB(rs, ps, conn);
		}
		return list;
	}
	
	//ѧ����¼
	public static boolean loginCheck(String username, String password) throws Exception{
		boolean status = false;
		Connection conn = getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from student where studentId= '" 
			+ username + "' and password= '" + password + "'" );
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				conn.close();
				stmt.close();
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return status;
	}
	
	//��ʦ��¼
	public static boolean teacherLoginCheck(String teacherId, String password) throws Exception{
		boolean status = false;
		Connection conn = getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from teacher where teacherId= '" 
			+ teacherId + "' and password= '" + password + "'" );
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				conn.close();
				stmt.close();
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return status;
	}
	
	
	// �ر�����
	public static void releaseDB(ResultSet rs, PreparedStatement preparedStatement, Connection conn) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (preparedStatement != null) {
			try {
				preparedStatement.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

}
