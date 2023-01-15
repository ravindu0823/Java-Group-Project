<%--
  Created by IntelliJ IDEA.
  User: dhanu
  Date: 1/14/2023
  Time: 4:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment Done</title>
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
<%
    HttpSession httpSession = request.getSession();
    String seatCount = (String) httpSession.getAttribute("seat_count");
%>

<div class="container" style="margin-top: 50px">
    <img src="img/success.jpg" class="img-fluid rounded-5" width="15%" style="margin-left: 540px;" alt="Payment Done">
    <div class="text-center fs-1 mb-3 text-light" style="margin-top: 30px">Payment Success</div>
    <table class="table">
        <tr>
            <td class="text-light fw-bold fs-5">Payer:</td>
            <td class="text-light">${payer.firstName} ${payer.lastName}</td>
        </tr>
        <tr>
            <td class="text-light fw-bold fs-5">Description:</td>
            <td class="text-light">${transaction.description}</td>
        </tr>
        <tr>
            <td class="text-light fw-bold fs-5">Tickets:</td>
            <td class="text-light"><%=seatCount%></td>
        </tr>
        <tr>
            <td class="text-light fw-bold fs-5">SubTotal:</td>
            <td class="text-light">$${transaction.amount.details.subtotal}</td>
        </tr>
        <tr>
            <td class="text-light fw-bold fs-5">Service Charges:</td>
            <td class="text-light">$${transaction.amount.details.shipping}</td>
        </tr>
        <tr>
            <td class="text-light fw-bold fs-5">Tax:</td>
            <td class="text-light">$${transaction.amount.details.tax}</td>
        </tr>
        <tr>
            <td class="text-light fw-bold fs-5">Total:</td>
            <td class="text-light">$${transaction.amount.total}</td>
        </tr>
    </table>
    <a href="index.jsp"><button type="button" class="btn-primary btn w-25" style="margin-left: 450px; margin-top: 30px">Back to Home</button></a>
</div>
</body>
</html>
