<%@ page import="com.pusl2024.movieticketbookingsystem.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
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

    <title>ABC Cinemas - User</title>
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

    <script
            src="https://kit.fontawesome.com/1f15b717d8.js"
            crossorigin="anonymous" defer
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

<% DBConnection dBConnection = new DBConnection();
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
                <h2 class="text-center">User Details</h2>
                <table class="table px-3 mt-5">
                    <thead>
                    <tr>
                        <th scope="col">Customer Id</th>
                        <th scope="col">Customer Name</th>
                        <th scope="col">Mobile Number</th>
                        <th scope="col">Email Address</th>
                        <th colspan="2" class="text-center">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        try {
                            preparedStatement = connection.prepareStatement("SELECT * FROM movie.customer where status = 1");
                            ResultSet resultSet = preparedStatement.executeQuery();

                            while (resultSet.next()) {
                    %>
                    <tr>
                        <th scope="row"><%=resultSet.getInt(1)%>
                        </th>
                        <td><%=resultSet.getString(2)%>
                        </td>
                        <td><%=resultSet.getInt(3)%>
                        </td>
                        <td><%=resultSet.getString(4)%>
                        </td>
                        <td>
                            <a href="updateUser.jsp?user_id=<%=resultSet.getInt(1)%>">
                                <input type="button" name="update" class="btn btn-primary" value="Update User">
                            </a>
                        </td>
                        <td>
                            <a href="../UserDeleteServlet?user_id=<%=resultSet.getInt(1)%>">
                                <input type="button" name="delete" class="btn btn-danger" value="Delete User">
                            </a>
                        </td>
                    </tr>
                    <% }
                    } catch (Exception e) {
                        out.println(e.getMessage());
                    }

                    %>
                    </tbody>
                </table>

            </div>
        </div>

    </div>
</div>
</body>
</html>