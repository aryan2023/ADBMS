<%--
    Document   : update
    Created on : 2 Sep, 2023, 2:58:58 PM
    Author     : ARYAN
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@include file="DatabaseUtils.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update To-Do Item</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #333; /* Change background color to a darker shade */
            color: #fff; /* Change text color to white */
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #444; /* Change container background color */
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Darken box shadow */
        }

        h1 {
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 10px;
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

        button {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            display: block;
            margin: 0 auto;
        }

        button:hover {
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
        <h1>Update To-Do Item</h1>
        
        <form method="post" action="update.jsp">
            
            <label for="id">Item ID:</label>
            <input type="text" id="id" name="id" required>

            <label for="task">Task:</label>
            <input type="text" id="task" name="task" required>

            <label for="dueDate">Due Date:</label>
            <input type="date" id="dueDate" name="dueDate">

            <label for="status">Status:</label>
            <select id="status" name="status">
                <option value="Incomplete">Incomplete</option>
                <option value="Complete">Complete</option>
            </select>

            <button type="submit">Update</button>
        
        </form>

        <div class="message">
           <%
            try {
                // Get the item ID to delete from the form
                
                int id = Integer.parseInt(request.getParameter("id"));
                String task = request.getParameter("task");
                String duedate = request.getParameter("dueDate");
                String status = request.getParameter("status");

                // Get the database connection
                Connection connection = null;
                PreparedStatement preparedStatement = null;
                try {
                    connection = getConnection();

                    // Call the delete_todo stored procedure
                     String deleteQuery = "{CALL update_todo(?,?,?,?)}";
                         preparedStatement= connection.prepareStatement(deleteQuery);
                        preparedStatement.setInt(1, id);
                        preparedStatement.setString(2, task);
                        preparedStatement.setString(3, duedate);
                        preparedStatement.setString(4, status);
                       
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
                } catch (SQLException e) {
                    e.printStackTrace();
                    %>
                    <div class="error-message">An error occurred while updating the To-Do item. Please try again later.</div>
                    <%
                } finally {
                    // Close the prepared statement
                    if (preparedStatement != null) {
                        try {
                            preparedStatement.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }

                    // Close the connection
                    if (connection != null) {
                        try {
                            connection.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }
            } catch (NumberFormatException e) {
                %>
                <%
            }
            %>
        </div>
    </div>
</body>

</html>
