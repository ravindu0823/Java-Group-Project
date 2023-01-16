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

    <title>ABC Cinemas - User Feedbacks</title>
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
                <h2 class="text-center mb-4">User Feedbacks</h2>
                <% try {
                    Statement statement = connection.createStatement();
                    ResultSet resultSet = statement.executeQuery("SELECT * FROM movie.feedback where status = 1");

                    while (resultSet.next()) {
                %>
                <div class="mx-5">
                    <form action="../FeedbackDeleteServlet" method="post" style="width: 100% !important;">
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Feedback Number</label>
                            <input type="text" name="feedback_id" class="form-control" id="exampleFormControlInput1"
                                   value="<%=resultSet.getInt(1)%>" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlTextarea1" class="form-label">Feedback</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="10"
                                      style="height: 100px" readonly><%=resultSet.getString(2)%></textarea>
                        </div>
                        <input type="submit" class="btn btn-danger" value="Delete Feedback">
                        <hr>
                    </form>
                </div>
                <% }
                } catch (Exception e) {
                    out.print(e.getMessage());
                }

                %>

            </div>
        </div>

    </div>
</div>
</body>
</html>