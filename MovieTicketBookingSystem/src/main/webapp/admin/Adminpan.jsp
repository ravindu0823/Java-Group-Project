<%@ page import="com.pusl2024.movieticketbookingsystem.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: dhanu
  Date: 1/13/2023
  Time: 12:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/mystle.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>ABC Cinemas - Admin panel</title>
    <link rel="icon" type="image/png" href="../img/logo-white.png"/>


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

<div class="container_1">
    <div class="sidebar">
        <ul>
            <li>
                <a href="Adminpan.jsp">
                    <i class="fas fa-clinic-"></i>
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

        </ul>
    </div>

    <% DBConnection dBConnection = new DBConnection();
        Connection connection = dBConnection.getConnection();
        PreparedStatement preparedStatement;

    %>
    <div class="main">

        <div class="cards">
            <div class="card">
                <div class="card-content">
                    <% try {
                        Statement statement = connection.createStatement();
                        ResultSet resultSet = statement.executeQuery("select COUNT(*) from movie where description = 'Now Screening'");

                        resultSet.next();
                    %>
                    <div class="number"><%=resultSet.getInt(1)%>
                    </div>
                    <%
                        } catch (Exception e) {
                            out.print(e.getMessage());
                        }

                    %>
                    <div class="card-name">Now Screening Movies</div>
                </div>
                <div class="icon-box">
                    <i class="fas fa-p"></i>
                </div>
            </div>
            <div class="card">
                <div class="card-content">
                    <% try {
                        Statement statement = connection.createStatement();
                        ResultSet resultSet = statement.executeQuery("SELECT COUNT(*) FROM movie.customer where status = 1");

                        resultSet.next();
                    %>
                    <div class="number"><%=resultSet.getInt(1)%>
                    </div>
                    <%
                        } catch (Exception e) {
                            out.print(e.getMessage());
                        }

                    %>
                    <div class="card-name">Users</div>
                </div>
                <div class="icon-box">
                    <i class="fas fa"></i>
                </div>
            </div>
            <div class="card">
                <div class="card-content">
                    <% try {
                        Statement statement = connection.createStatement();
                        ResultSet resultSet = statement.executeQuery("select COUNT(*) from movie where description != 'Now Screening'");

                        resultSet.next();
                    %>
                    <div class="number"><%=resultSet.getInt(1)%>
                    </div>
                    <%
                        } catch (Exception e) {
                            out.print(e.getMessage());
                        }

                    %>
                    <div class="card-name">Upcoming movies</div>
                </div>
                <div class="icon-box">
                    <i class="fas fa"></i>
                </div>
            </div>
            <div class="card">
                <div class="card-content">
                    <% try {
                        Statement statement = connection.createStatement();
                        ResultSet resultSet = statement.executeQuery("select SUM(totalfee) from payment");

                        resultSet.next();
                    %>
                    <div class="number">$<%=resultSet.getInt(1)%>
                    </div>
                    <%
                        } catch (Exception e) {
                            out.print(e.getMessage());
                        }

                    %>
                    <div class="card-name">Earnings</div>
                </div>
                <div class="icon-box">
                    <i class="fas fa"></i>
                </div>
            </div>
        </div>

        <div class="doctor-visiting">
            <div class="heading">
                <h2>Trending movies</h2>
                <a href="movies.jsp" class="btn">View All</a>
            </div>
            <table class="visiting">
                <thead>
                <td>Photo</td>
                <td>Movie Name</td>
                <td>Ticket Count</td>

                </thead>
                <tbody>
                <tr>
                    <td>
                        <div class="img-box-small">
                            <img src="assets/img/avater.jpg" alt="">
                        </div>
                    </td>
                    <td>Avatar: The Way Of Water</td>
                    <% try {
                        Statement statement = connection.createStatement();
                        ResultSet resultSet = statement.executeQuery("select SUM(quantity) from booking where movieid = 1");

                        resultSet.next();
                    %>
                    <td><%=resultSet.getInt(1)%>
                    </td>
                    <%
                        } catch (Exception e) {
                            out.print(e.getMessage());
                        }

                    %>


                </tr>
                <tr>
                    <td>
                        <div class="img-box-small">
                            <img src="assets/img/nowShowing-blackadam.jpg">
                        </div>
                    </td>
                    <td>Black Adam</td>
                    <% try {
                        Statement statement = connection.createStatement();
                        ResultSet resultSet = statement.executeQuery("select SUM(quantity) from booking where movieid = 4");

                        resultSet.next();
                    %>
                    <td><%=resultSet.getInt(1)%>
                    </td>
                    <%
                        } catch (Exception e) {
                            out.print(e.getMessage());
                        }

                    %>

                </tr>
                <tr>
                    <td>
                        <div class="img-box-small">
                            <img src="assets/img/puss.jpg">
                        </div>
                    </td>
                    <td>Puss In Boots: The Last Wish</td>

                    <% try {
                        Statement statement = connection.createStatement();
                        ResultSet resultSet = statement.executeQuery("select SUM(quantity) from booking where movieid = 2");

                        resultSet.next();
                    %>
                    <td><%=resultSet.getInt(1)%>
                    </td>
                    <%
                        } catch (Exception e) {
                            out.print(e.getMessage());
                        }

                    %>

                </tr>
                <tr>
                    <td>
                        <div class="img-box-small">
                            <img src="assets/img/wakanda-forever-atl.jpg">
                        </div>
                    </td>
                    <td>Black Panther: Wakanda Forever</td>

                    <% try {
                        Statement statement = connection.createStatement();
                        ResultSet resultSet = statement.executeQuery("select SUM(quantity) from booking where movieid = 3");

                        resultSet.next();
                    %>
                    <td><%=resultSet.getInt(1)%>
                    </td>
                    <%
                        } catch (Exception e) {
                            out.print(e.getMessage());
                        }

                    %>

                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>

</html>