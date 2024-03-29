<%@ page import="com.pusl2024.movieticketbookingsystem.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: dhanu
  Date: 1/13/2023
  Time: 12:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <title>ABC Cinemas - Update User</title>
    <link rel="icon" type="image/png" href="../img/logo-white.png"/>
    <!-- Include CSS File Here -->
    <link href="assets/css/mystle.css" rel="stylesheet">
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
    />
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            defer
    ></script>
</head>
<body class="bgcol">
<%

    int adminId = 0;

    Cookie cookies[] = request.getCookies();

    for (Cookie c : cookies) {
        if (c.getName().equals("admin_id")) {
            adminId = Integer.parseInt(c.getValue());
        }
    }

    if (adminId == 0) {
        response.sendRedirect("AdminLogIn.jsp");
    }

%>


<%
    int userId = Integer.parseInt(request.getParameter("user_id"));

    DBConnection dBConnection = new DBConnection();
    Connection connection = dBConnection.getConnection();
    PreparedStatement preparedStatement;

%>

<div class="container_1">
    <div class="sidebar">
        <ul>
            <li>
                <a href="Adminpan.jsp">
                    <i class="fas fa-clinic-medical"></i>
                    <div class="title">ABC CINEMA</div>
                </a>
            </li>
            <li>
                <a href="Adminpan.jsp">
                    <i class="fas fa-th-"></i>
                    <div class="title">Dashboard</div>
                </a>
            </li>
            <li>
                <a href="movies.jsp">
                    <i class="fas fa-"></i>
                    <div class="title">Movies</div>
                </a>
            </li>
            <li>
                <a href="user.jsp">
                    <i class="fas fa"></i>
                    <div class="title">Users</div>
                </a>
            </li>
            <li>
                <a href="feedback.jsp">
                    <i class="fas fa"></i>
                    <div class="title">Feedbacks</div>
                </a>
            </li>


            <li>
                <a href="../AdminLogOutServlet">
                    <i class="fas fa"></i>
                    <div class="title text-danger">Log Out</div>
                </a>
            </li>


        </ul>
    </div>
    <div class="main">
        <div class="wrapper">

            <div class="inner">
                <form action="../UserUpdateServlet" name="update_user" method="POST">
                    <h3>User Details</h3>

                    <div class="form-wrapper">
                        <b><label for="">User ID</label></b>
                        <input type="text" name="user_id" class="form-control" value="<%=userId%>" required readonly>
                    </div>

                    <% try {
                        Statement statement = connection.createStatement();
                        ResultSet resultSet = statement.executeQuery("SELECT * FROM movie.customer where cusid = " + userId + "");

                        resultSet.next();
                    %>
                    <div class="form-wrapper">
                        <b> <label for="">Name</label></b>
                        <input type="text" name="user_name" class="form-control" value="<%=resultSet.getString(2)%>"
                               required>
                    </div>
                    <div class="form-wrapper">
                        <b> <label for="">Email</label></b>
                        <input type="text" name="user_email" class="form-control" value="<%=resultSet.getString(4)%>"
                               required>
                    </div>
                    <div class="form-wrapper">
                        <b> <label for="">Phone Number</label></b>
                        <input type="text" name="phone_number" class="form-control" value="<%=resultSet.getInt(3)%>"
                               required>
                    </div>
                    <%
                        } catch (Exception e) {
                            out.print(e.getMessage());
                        }

                    %>
                    <div>
                        <br>
                        <br>
                    </div>
                    <button class="btn btn-primary" type="submit">Update User</button>
                </form>

            </div>
        </div>
    </div>
</div>
</body>
</html>