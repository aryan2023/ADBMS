<%-- 
    Document   : navbar
    Created on : 2 Sep, 2023, 3:40:22 PM
    Author     : ARYAN
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
    .navbar {
        background-color: #333; /* Change background color to a darker shade */
        color: #fff; /* Change text color to white */
        padding: 10px 0;
    }

    .navbar-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
    }

    .logo {
        font-size: 24px;
        font-weight: bold;
        text-decoration: none;
        color: #fff;
    }

    .nav-links {
        list-style-type: none;
        padding: 0;
        margin: 0;
        display: flex;
    }

    .nav-links li {
        margin-right: 20px;
    }

    .nav-links li:last-child {
        margin-right: 0;
    }

    .nav-links a {
        text-decoration: none;
        color: #fff;
        font-size: 16px;
        transition: color 0.3s;
    }

    .nav-links a:hover {
        color: #0056b3;
    }
</style>
<nav class="navbar">
    <div class="navbar-container">
        <a href="index.jsp" class="logo">Your Logo</a>
        <ul class="nav-links">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="insert.jsp">Add Item</a></li>
            <li><a href="view.jsp">View List</a></li>
            <li><a href="update.jsp">Update Item</a></li>
            <li><a href="delete.jsp">Delete Item</a></li>
        </ul>
    </div>
</nav>
