# ADBMS
Its a ADBMS(advance database management system) project for my college in which i have implemented adbs concepts such as stored procedure, function and sequence on a simple To Do List webpage.

To-Do List Web Application with ADBS Concepts
Table of Contents
Introduction
Features
Installation and Setup
Usage
Project Structure
Database Structure
Contributing
License
1. Introduction
This project is a simple To-Do List web application that has been implemented using NetBeans, JSP pages, and MySQL database. It leverages the concepts of Advanced Database Systems (ADBS) including stored procedures, functions, and sequences to manage and display tasks efficiently. The application allows users to create, read, update, and delete tasks in their to-do list.

2. Features
Add New Tasks: Users can add new tasks with a title and description.
View Tasks: All tasks are displayed on the main page for easy access.
Update Tasks: Users can edit task details, such as title and description.
Delete Tasks: Tasks can be removed from the to-do list.
3. Installation and Setup
To run this To-Do List application on your local machine, follow these steps:

Prerequisites:

NetBeans IDE
MySQL Server
Tomcat Server
Clone or download this repository to your local machine.

Import the project into NetBeans:

Open NetBeans and select "File" > "Open Project..."
Navigate to the project directory and select the project folder.
Set up the MySQL Database:

Create a MySQL database named todo_list.
Execute the SQL script provided in the database_setup.sql file to create the necessary tables, stored procedures, functions, and sequences.
Configure Database Connection:

Open the databaseutils.jsp file and modify the database connection parameters as needed.
Deploy the Application:

Right-click on the project in NetBeans and select "Run" to deploy the application on your Tomcat server.
Access the Application:

Open a web browser and navigate to http://localhost:8080/ToDoList/ to access the To-Do List application.
4. Usage
Add a New Task:

Click the "Add Task" button on the main page.
Fill in the title and description of the task and click "Add Task" to save it.
View Tasks:

All tasks are displayed on the main page with options to edit and delete each task.
Update a Task:

Click the "Edit" button next to the task you want to update.
Modify the title and description and click "Save" to update the task.
Delete a Task:

Click the "Delete" button next to the task you want to remove from the list.
5. Project Structure
index.jsp: The main page of the To-Do List application.
insert.jsp: Page for adding new tasks.
update.jsp: Page for updating existing tasks.
view.jsp: Page for viewing tasks.
delete.jsp: Page for deleting tasks.
databaseutils.jsp: Contains database connection and utility functions.
6. Database Structure
The database structure includes the following tables:

tasks: Stores task data, including task_id, title, description, created_at, and updated_at.
Stored procedures and functions have been implemented for database operations, and sequences have been used to generate unique task IDs.

7. Contributing
Feel free to contribute to this project by submitting issues, feature requests, or pull requests on the GitHub repository.

8. License
This project is licensed under the MIT License - see the LICENSE file for details.

Enjoy using the To-Do List web application with ADBS concepts! If you encounter any issues or have suggestions for improvements, please don't hesitate to reach out and contribute to the project.
