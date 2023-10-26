<%--
    Document   : delete
    Created on : 2 Sep, 2023, 3:07:47 PM
    Author     : ARYAN
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.Connection, java.sql.PreparedStatement, java.sql.SQLException" %>

<%@ include file="DatabaseUtils.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete To-Do Item</title>
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

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        input[type="text"] {
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
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp" />
    <div class="container">
        <h1>Delete To-Do Item</h1>
        <form method="post" action="delete.jsp">
            <label for="id">Item ID:</label>
            <input type="text" id="id" name="id" required>
            <button type="submit">Delete Item</button>
        </form>
        <div class="message">
            <%
            try {
                // Get the item ID to delete from the form
                int idToDelete = Integer.parseInt(request.getParameter("id"));

                // Get the database connection
                Connection connection = null;
                PreparedStatement preparedStatement = null;
                try {
                    connection = getConnection();

                    // Call the delete_todo stored procedure
                      String sql = "SELECT adbms.delete_todo(?) AS rowsAffected";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, idToDelete); // Replace with the item ID you want to delete

        // Execute the query
        ResultSet resultSet = preparedStatement.executeQuery();
        
        int rowsAffected = 0;
        if (resultSet.next()) {
            rowsAffected = resultSet.getInt("rowsAffected");
        }

                    if (rowsAffected > 0) {
                        %>
                        <div class="message">To-Do item with ID <%= idToDelete %> has been deleted successfully.</div>
                        <%
                    } else {
                        %>
                        <div class="message">Failed to delete To-Do item with ID <%= idToDelete %>. Please check the ID.</div>
                        <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    %>
                    <div class="message">An error occurred while deleting the To-Do item. Please try again later.</div>
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
