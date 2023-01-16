<%--
  Created by IntelliJ IDEA.
  User: dhanu
  Date: 1/15/2023
  Time: 11:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment Error</title>
    <link rel="icon" type="image/png" href="img/logo-white.png"/>

    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
    />
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            defer
    ></script>
</head>
<body style="background-color: #000124 !important;">
<div class="container">
    <img src="img/payment_error.jpg" width="30%" class="img-fluid rounded-4" style="margin-left: 450px; margin-top: 100px" alt="Payment Canceled">
    <div class="text-center text-danger fs-1 mt-4">Payment Error!!!</div>
    <div class="text-danger text-center fs-3 mt-3">${errorMessage}</div>
    <a href="index.jsp"><button type="button" class="btn-primary btn w-25" style="margin-left: 480px; margin-top: 50px">Back to Home</button></a>

</div>
</body>
</html>
