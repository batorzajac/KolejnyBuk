//DBConnection.java
package com.mvc.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection createConnection() {
        Connection con = null;
        String url = "jdbc:postgresql://sigma.pwsz.krosno.pl:5432/buk"; //MySQL URL followed by the database name
        String username = "postgres"; //MySQL username
        String password = "26!D$196eF85"; //MySQL password
        try {
            try {
                Class.forName("org.postgresql.Driver"); //loading MySQL drivers. This differs for database servers 
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
            System.out.println("Printing connection object " + con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
