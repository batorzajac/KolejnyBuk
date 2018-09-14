package com.login.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.login.bean.LoginBean;
import com.mvc.util.DBConnection;

public class LoginDao {

    public String authenticateUser(LoginBean loginBean) {
        String userName = loginBean.getUserName();
        String password = loginBean.getPassword();
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String userNameDB = "";
        String passwordDB = "";
        int roleDB;
        try {
            con = DBConnection.createConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("select login,haslo,uprawnienia_id from uzytkownik");
            while (resultSet.next()) {
                userNameDB = resultSet.getString("login");
                passwordDB = resultSet.getString("haslo");
                roleDB = resultSet.getInt("uprawnienia_id");
                if (userName.equals(userNameDB) && password.equals(passwordDB) && roleDB == 1) {
                    return "Admin_Role";
                } else if (userName.equals(userNameDB) && password.equals(passwordDB) && roleDB == 2) {
                    return "Editor_Role";
                } else if (userName.equals(userNameDB) && password.equals(passwordDB) && roleDB == 3) {
                    return "User_Role";
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "Invalid user credentials";
    }
}
