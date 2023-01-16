<%--
  Created by IntelliJ IDEA.
  User: dhanu
  Date: 1/13/2023
  Time: 12:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/AdminLogIn.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Admin Login</title>
    <link rel="icon" type="image/png" href="../img/logo-white.png"/>
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

    if (adminId != 0) {
        response.sendRedirect("Adminpan.jsp");
    }

%>
<div class="logo"></div>
<div class="login-block">
    <h1>ADMIN LOGIN</h1>
    <form action="../AdminLoginServlet" method="post" name="admin_login" onsubmit="adminLoginValidate()">
        <input type="text" value="" placeholder="Username" name="username" id="us_name" required>
        <input type="password" value="" placeholder="Password" name="password" id="pass" required>

        <button type="submit">Login</button>
    </form>
</div>

<script>
    function adminLoginValidate() {
        if (document.getElementById("us_name").value === "") {
            window.alert("Please enter your username");
        }

        if (document.getElementById("pass").valueOf === "") {
            window.alert("Please enter your password");
        }
    }
</script>

</body>
</html>