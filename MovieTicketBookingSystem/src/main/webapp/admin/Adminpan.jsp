<%--
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
    <title>Admin panel</title>


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
                <a href="#">
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
                <a href="../AdminLogOutServlet">
                    <i class="fas fa"></i>
                    <div class="title">Log Out</div>
                </a>

        </ul>
    </div>
    <div class="main">

        <div class="cards">
            <div class="card">
                <div class="card-content">

                    <div class="number">67</div>
                    <div class="card-name">Movies</div>
                </div>
                <div class="icon-box">
                    <i class="fas fa-p"></i>
                </div>
            </div>
            <div class="card">
                <div class="card-content">
                    <div class="number">105</div>
                    <div class="card-name">Users</div>
                </div>
                <div class="icon-box">
                    <i class="fas fa"></i>
                </div>
            </div>
            <div class="card">
                <div class="card-content">
                    <div class="number">8</div>
                    <div class="card-name">Upcoming movies</div>
                </div>
                <div class="icon-box">
                    <i class="fas fa"></i>
                </div>
            </div>
            <div class="card">
                <div class="card-content">
                    <div class="number">$450</div>
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
                <a href="#" class="btn">View All</a>
            </div>
            <table class="visiting">
                <thead>
                <td>Photo</td>
                <td>Movie Name</td>
                <td>Tickets</td>

                </thead>
                <tbody>
                <tr>
                    <td>
                        <div class="img-box-small">
                            <img src="assets/img/avater.jpg" alt="">
                        </div>
                    </td>
                    <td>AVATAR: THE WAY OF WATER</td>
                    <td>3000</td>


                </tr>
                <tr>
                    <td>
                        <div class="img-box-small">
                            <img src="assets/img/adaraneeya prarthana.jpg">
                        </div>
                    </td>
                    <td>Adaraneeya Prarthana</td>
                    <td>2800</td>

                </tr>
                <tr>
                    <td>
                        <div class="img-box-small">
                            <img src="assets/img/puss.jpg">
                        </div>
                    </td>
                    <td>PUSS IN BOOTS: THE LAST WISH</td>
                    <td>2200</td>

                </tr>
                <tr>
                    <td>
                        <div class="img-box-small">
                            <img src="assets/img/wakanda-forever-atl.jpg">
                        </div>
                    </td>
                    <td>BLACK PANTHER: WAKANDA FOREVER</td>
                    <td>1800</td>

                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>

</html>