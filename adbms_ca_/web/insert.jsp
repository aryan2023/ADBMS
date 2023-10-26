<%--
Document   : insert
Created on : 2 Sep, 2023, 2:51:07 PM
Author     : ARYAN
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ include file="DatabaseUtils.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add To-Do Item</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #333; /* Change background color to a darker shade */
            color: #fff; /* Change text color to white */
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            padding: 20px 0; /* Add padding to the title for spacing */
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #444; /* Change container background color */
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Darken box shadow */
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
        }

        input[type="text"],
        input[type="date"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #777; /* Darken border color */
            border-radius: 3px;
            background-color: #555; /* Change input background color */
            color: #fff; /* Change input text color */
        }

        button[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            display: block;
            margin: 0 auto; /* Center-align the button */
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }

        .message {
            text-align: center;
            font-weight: bold;
            margin-top: 10px;
        }

        .success-message {
            color: green;
        }

        .error-message {
            color: red;
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp" />
    <div class="container">
        <h1>Add To-Do Item</h1>
        <form method="post" action="insert.jsp">
            <div class="form-group">
                <label for="task">Task:</label>
                <input type="text" id="task" name="task" required>
            </div>
            <div class="form-group">
                <label for="dueDate">Due Date:</label>
                <input type="date" id="dueDate" name="dueDate">
            </div>
            <div class="form-group">
                <label for="status">Status:</label>
                <select id="status" name="status">
                    <option value="Incomplete">Incomplete</option>
                    <option value="Complete">Complete</option>
                </select>
            </div>
            <button type="submit">Add Item</button>
        </form>
        <div class="message">
           <%
                // Get the item ID to delete from the form
                if (request.getMethod().equals("POST")) {
                String task = request.getParameter("task");
                String duedate = request.getParameter("dueDate");
                String status = request.getParameter("status");

                // Get the database connection
                Connection connection = null;
                PreparedStatement preparedStatement = null;
             
                    connection = getConnection();

                    // Call the delete_todo stored procedure
                     String deleteQuery = "{Call insert_todo(?,?,?)}";
                         preparedStatement= connection.prepareStatement(deleteQuery);
                       
                        preparedStatement.setString(1, task);
                        preparedStatement.setString(2, duedate);
                        preparedStatement.setString(3, status);
                       
                        int rowsAffected = preparedStatement.executeUpdate();

                    if (rowsAffected > 0) {
                        %>
                        <div class="success-message">To-Do item has been updated successfully.</div>
                        <%
                    } else {
                        %>
                        <div class="error-message">Failed to Update To-Do. Please check the ID.</div>
                        <%
                    }
}
            %>
        </div>
    </div>
</body>
</html>
