//RegisterDao.java
package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.mvc.bean.RegisterBean;
import com.mvc.util.DBConnection;
import java.util.logging.Level;
import java.util.logging.Logger;

public class RegisterDao {

    public String registerUser(RegisterBean registerBean) {
        String name = registerBean.getName();
        String surname = registerBean.getSurname();
        String email = registerBean.getEmail();
        String userName = registerBean.getUserName();
        String password = registerBean.getPassword();
        String phone = registerBean.getPhone();
        Connection con = null;
        PreparedStatement preparedStatement = null;
        try {
            con = DBConnection.createConnection();
            String query = "insert into uzytkownik(login, haslo, imie, nazwisko, e_mail, telefon, uprawnienia_id) values (?,?,?,?,?,?,?)"; //Insert user details into the table 'USERS'
            preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, name);
            preparedStatement.setString(4, surname);
            preparedStatement.setString(5, email);
            preparedStatement.setString(6, phone);
            preparedStatement.setInt(7, 3);

            int i = preparedStatement.executeUpdate();
            if (i != 0) //Just to ensure data has been inserted into the database
            {
                return "SUCCESS";
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        return password;  // On failure, send a message from here.
    }
}
