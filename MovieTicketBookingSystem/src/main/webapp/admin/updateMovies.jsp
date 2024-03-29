<%@ page import="com.pusl2024.movieticketbookingsystem.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: dhanu
  Date: 1/13/2023
  Time: 12:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>

    <title>ABC Cinemas - Update Movie</title>
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
<body>
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

    int movieId = Integer.parseInt(request.getParameter("movie_id"));

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
                <form action="../MovieUpdateServlet" method="POST" name="movie_update" enctype="multipart/form-data">
                    <h3>Movie Details</h3>
                    <div class="form-wrapper">
                        <b>Movie Id</b>
                        <input type="text" name="movie_id1" class="form-control" value="<%=movieId%>" required>
                    </div>
                    <% try {
                        Statement statement = connection.createStatement();
                        ResultSet resultSet = statement.executeQuery("SELECT * FROM movie.movie where movieid = " + movieId + "");

                        resultSet.next();
                    %>
                    <div class="form-wrapper">
                        <b>Movie Name</b>
                        <input type="text" name="name1" class="form-control" value="<%=resultSet.getString(2)%>" required>
                    </div>
                    <div class="form-wrapper">
                        <b>Description</b>
                        <input type="text" name="description1" class="form-control" value="<%=resultSet.getString(9)%>" required>
                    </div>
                    <div class="form-wrapper">
                        <b>Trailer</b>
                        <input type="text" name="trailer1" class="form-control" value="<%=resultSet.getString(10)%>" required>
                    </div>
                    <div class="form-wrapper">
                        <b>Image</b>
                        <input type="file" name="image1" class="form-control" required>
                    </div>
                    <%
                    } catch (Exception e) {
                        out.print(e.getMessage());
                    }

                    %>

                    <div class="form-wrapper">
                        <b> <label class="control-label col-sm-2">Time Slots:</label></b>
                        <div class="col-sm-10">
                            <select name="time_slot1" id="time_slot" class="form-control">
                                <option value="0">Please Select</option>
                                <% try {
                                    Statement statement = connection.createStatement();
                                    ResultSet resultSet = statement.executeQuery("SELECT * FROM movie.timeslot;");

                                    while (resultSet.next()) {
                                %>
                                <option value="<%=resultSet.getInt(1)%>"><%=resultSet.getString(2)%>
                                </option>
                                <% }
                                } catch (Exception e) {
                                    out.print(e.getMessage());
                                }

                                %>
                            </select>
                        </div>


                        <div>
                            <br>
                            <br>
                            <br>
                            <br>
                        </div>
                        <button class="button button1" type="submit">UPDATE</button>
                    </div>
                </form>
            </div>

        </div>

    </div>
</body>
</html>