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

    <title>ABC Cinemas - Movie</title>
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
                <form action="../MovieInsertServlet" method="post" name="movieInsert" enctype="multipart/form-data">
                    <h3>Movie Details</h3>
                    <div class="form-wrapper">
                        <b>Movie Name</b>
                        <input type="text" name="name" class="form-control" required>
                    </div>
                    <div class="form-wrapper">
                        <b>Description</b>
                        <input type="text" name="description" class="form-control" required>
                    </div>
                    <div class="form-wrapper">
                        <b>Trailer</b>
                        <input type="text" name="trailer" class="form-control" required>
                    </div>
                    <div class="form-wrapper">
                        <b>Image</b>
                        <input type="file" name="image" class="form-control" required>
                    </div>

                    <div class="form-wrapper">
                        <b> <label class="control-label col-sm-2">Time Slots:</label></b>
                        <div class="col-sm-10">
                            <select name="time_slot" id="time_slot" class="form-control">
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
                        <button class="button button1" type="submit">ADD</button>
<%--                        <button class="button button1">UPDATE</button>--%>
<%--                        <button class="button button1">DELETE</button>--%>
                    </div>
                </form>
            </div>

        </div>

        <table class="table table-bordered mx-5 mb-5" style="margin-right: 50px">
            <thead>

            <tr>
                <th>Id</th>
                <th>Movie Name</th>
                <th>Time Slot</th>
                <th>Added By</th>
                <th>Movie Description</th>
                <th colspan="3" class="text-center">Action</th>
            </tr>
            </thead>
            <tbody>


            <% try {
                preparedStatement = connection.prepareStatement("{CALL SELECTMOVIE()}");
                ResultSet resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
            %>
            <tr>
                <td><%=resultSet.getInt(1)%>
                </td>
                <td><%=resultSet.getString(2)%>
                </td>
                <td><%=resultSet.getString(3)%>
                </td>
                <td><%=resultSet.getString(4)%>
                </td>
                <td><%=resultSet.getString(5)%>
                </td>
                <td>
                    <a href="updateMovies.jsp?movie_id=<%=resultSet.getInt(1)%>">
                        <input type="button" class="btn btn-primary" name="update" value="Update Movie">
                    </a>
                </td>
                <td>
                    <a href="../MovieDeleteServlet?movie_id=<%=resultSet.getInt(1)%>">
                        <input type="button" name="delete" class="btn btn-danger" value="Delete Movie">
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
</body>
</html>