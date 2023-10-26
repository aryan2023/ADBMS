<%-- 
    Document   : index
    Created on : 2 Sep, 2023, 3:11:07 PM
    Author     : ARYAN
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>To-Do List</title>
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

        ul {
            list-style-type: none;
            padding: 0;
            text-align: center;
        }

        li {
            margin-bottom: 10px;
        }

        a.button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 3px;
            transition: background-color 0.3s;
        }

        a.button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>To-Do List</h1>
        <ul>
            <li><a href="insert.jsp" class="button">Add To-Do Item</a></li>
            <li><a href="view.jsp" class="button">View To-Do List</a></li>
            <li><a href="update.jsp" class="button">Update To-Do Item</a></li>
            <li><a href="delete.jsp" class="button">Delete To-Do Item</a></li>
        </ul>
    </div>
</body>
</html>
