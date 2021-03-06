package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://127.0.0.1:3306/prac";
			String dbID = "root";
			String dbPassword="1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int login(String userID, String userPass) {
		String SQL="SELECT user_pass FROM USER WHERE userID= ?";
		try {
			pstmt= conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				if (rs.getString(1).equals(userPass)) {
					return 1;
				}
				else
					return 0;
			}else
				return -1;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}

	public int signUp(User user) {
		String SQL="INSERT INTO USER VALUES (?,?,?,?,?)";
		try {
			pstmt= conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPass());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();

		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}