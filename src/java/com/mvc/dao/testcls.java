/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

/**
 *
 * @author bator
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class testcls {
   public static void main(String args[]) {
      Connection c = null;
            Statement stmt = null;
      try {
         Class.forName("org.postgresql.Driver");
         c = DriverManager
            .getConnection("jdbc:postgresql://localhost:5432/buk",
            "admin", "admin");
         
         c.setAutoCommit(false);
         System.out.println("Opened database successfully");

         stmt = c.createStatement();
         String sql = "insert into uzytkownik(login, haslo, imie, nazwisko, e_mail, telefon, uprawnienia_id)"
            + "VALUES ('asdasd', '111111', 'aaaaa', 'aaaa', 'aaa@aaa.com', 12312312312, 2);";
         stmt.executeUpdate(sql);

         

         stmt.close();
         c.commit();
         c.close();
         
      } catch (Exception e) {
         e.printStackTrace();
         System.err.println(e.getClass().getName()+": "+e.getMessage());
         System.exit(0);
      }
      System.out.println("Opened database successfully");
   }
}

