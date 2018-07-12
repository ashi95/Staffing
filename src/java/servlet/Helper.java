/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author LENOVO T440S
 */
public class Helper {
  static int id;
     static String result;
      static int count;
   public static int getId(String row,String table,String table2,String value) throws ClassNotFoundException, SQLException
    {
        Class.forName("com.mysql.jdbc.Driver");
                // loads driver
                
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
                String selectsql="SELECT "+row+" from "+table+" where "+table2+"=?";
                PreparedStatement statement =  c.prepareStatement(selectsql);
 statement.setString(1,value);
                ResultSet rs = statement.executeQuery();
                
                while (rs.next()) {
                id = rs.getInt(1);
                 
                }
                return id;
       
    }
   public static String getValue(String row,String table,String table2,String value) throws ClassNotFoundException, SQLException
    {
        Class.forName("com.mysql.jdbc.Driver");
                // loads driver
                
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
                String selectsql="SELECT "+row+" from "+table+" where "+table2+"=?";
                PreparedStatement statement =  c.prepareStatement(selectsql);
 statement.setString(1,value);
                ResultSet rs = statement.executeQuery();
                
                while (rs.next()) {
                result = rs.getString(1);
                 
                }
                return result;
       
    }
   public static int getCount(String row,String table,String table2,String value) throws ClassNotFoundException, SQLException
   {
        Class.forName("com.mysql.jdbc.Driver");
                // loads driver
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
            String selectsql="SELECT Count("+row+") from "+table+" where "+table2+"=?";
                PreparedStatement statement =  c.prepareStatement(selectsql);
 statement.setString(1,value);
                ResultSet rs = statement.executeQuery();
                
                while (rs.next()) {
                count = rs.getInt(1);
                 
                }
                return count;
       
    }
   public static String toJavascriptArray(String[] arr){
    StringBuffer sb = new StringBuffer();
    sb.append("[");
    for(int i=0; i<arr.length; i++){
        sb.append("\"").append(arr[i]).append("\"");
        if(i+1 < arr.length){
            sb.append(",");
        }
    }
    sb.append("]");   
    return sb.toString();
}
}
