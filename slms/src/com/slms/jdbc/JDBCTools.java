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

	//连接数据库
	public static Connection getConnection() throws Exception {
		// 1. 准备连接数据库的 4 个字符串.
		// 1). 创建 Properties 对象
		Properties properties = new Properties();

		// 2). 获取 jdbc.properties 对应的输入流
		InputStream in = JDBCTools.class.
				getClassLoader().getResourceAsStream("jdbc.properties");

		// 3). 加载 2) 对应的输入流
		properties.load(in);

		// 4). 具体决定 user, password 等4 个字符串.
		String user = properties.getProperty("user");
		String password = properties.getProperty("password");
		String jdbcUrl = properties.getProperty("jdbcUrl");
		String driver = properties.getProperty("driver");

		// 2. 加载数据库驱动程序(对应的 Driver 实现类中有注册驱动的静态代码块.)
		Class.forName(driver);

		// 3. 通过 DriverManager 的 getConnection() 方法获取数据库连接.
		Connection connection = DriverManager.getConnection(jdbcUrl, user, password);

		return connection;
	}

	/**
	 * 执行 SQL 语句, 使用 PreparedStatement
	 * @param sql
	 * @param args: 填写 SQL 占位符的可变参数
	 */
	// 增删改
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
			System.out.println("登陆成功");
		}else {
			System.out.println("登陆失败");
		}
	}*/
	
	
	//查询
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

			//创建 ResultSetMetaData 来获得数据库表的字段名等元数据
			ResultSetMetaData rsmd = rs.getMetaData();
			// 创建一个 Map<String, Object> 对象
            // 键: SQL 查询的列的别名
            // 值: SQL 查询的列的值
			Map<String, Object> map = new HashMap<>();
			//保存查询得到的数据
			list = new ArrayList<>();
			
			while(rs.next()){
				map.clear();
				for(int i=0; i < rsmd.getColumnCount(); i++) {
					String columnLabel = rsmd.getColumnLabel(i+1);
					Object columnValue = rs.getObject(columnLabel);
					map.put(columnLabel,columnValue);
				}
				//若 Map 不为空集, 利用反射创建 tClass 对应的对象
				if(!map.isEmpty()) {
					try {
						entity = clazz.newInstance();
						
						/*Map是java中的接口，Map.Entry是Map的一个内部接口。
						Map提供了一些常用方法，如keySet()、entrySet()等方法。
						keySet()方法返回值是Map中key值的集合；entrySet()的返回值也是返回一个Set集合，此集合的类型为Map.Entry。*/

						for(Map.Entry<String, Object> entry:map.entrySet()) {
							String name = entry.getKey();
							Object value = entry.getValue();
							try {
                                //利用反射设置实体类的字段
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
	
	//学生登录
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
	
	//老师登录
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
	
	
	// 关闭连接
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
