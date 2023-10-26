<%-- 
    Document   : DatabseUtils
    Created on : 2 Sep, 2023, 3:26:08 PM
    Author     : ARYAN
--%>
<%@page import="java.sql.*"%>
<%! 
    static Connection getConnection() throws SQLException, ClassNotFoundException {
        String url = "jdbc:mysql://localhost:3306/adbms";
        String username = "root";
        String password = "root1";
        
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(url, username, password);
    }
%>
