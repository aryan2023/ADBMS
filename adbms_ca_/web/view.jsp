<%-- 
    Document   : view
    Created on : 2 Sep, 2023, 2:57:27 PM
    Author     : ARYAN
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="db.DatabaseConnection" %>
<%@include file="DatabaseUtils.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View To-Do List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #333; /* Change background color to a darker shade */
            color: #fff; /* Change text color to white */
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #444; /* Change container background color */
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Darken box shadow */
        }

        h1 {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #777; /* Darken border color */
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #222; /* Darken column title background color */
            color: #fff; /* Column title text color */
        }

        tr:nth-child(even) {
            background-color: #222; /* Darken even row background color */
        }

        .message {
            text-align: center;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp" />
    <div class="container">
        <h1>To-Do List</h1>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Task</th>
                    <th>Due Date</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection connection = null;
                    connection = getConnection();
                    String selectQuery = "{Call get_todo()}";
                    PreparedStatement preparedStatement = connection.prepareStatement(selectQuery);
                    ResultSet resultSet = preparedStatement.executeQuery();

                    // Process and display the result set, e.g., in a table
                    while (resultSet.next()) {
                        int id = resultSet.getInt("id");
                        String name = resultSet.getString("task");
                        String type = resultSet.getString("due_date");
                        String description = resultSet.getString("status");

                        out.println("<tr><td>" + id + "</td><td>" + name + "</td><td>" + type + "</td><td>" + description + "</td></tr>");
                    }
                    out.println("</table>");

                    resultSet.close();
                    preparedStatement.close();
                    connection.close();
                %>
            </tbody>
        </table>
        <div class="message">
            <%-- You can display success or error messages here --%>
        </div>
    </div>
</body>
</html>
