<%--
  Created by IntelliJ IDEA.
  User: dhanu
  Date: 1/14/2023
  Time: 3:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Review Page</title>
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
    <form action="ExecutePaymentServlet" method="post">
        <div class="text-center fs-2 mb-3 text-light">Review Page</div>
        <table class="table">
            <tr>
                <td colspan="2" class="text-center fw-bold fs-4 text-light">Transaction Details:</td>
                <td>
                    <input type="hidden" name="paymentId" value="${param.paymentId}">
                    <input type="hidden" name="PayerID" value="${param.PayerID}">
                </td>
            </tr>
            <tr>
                <td class="text-light">Description</td>
                <td class="text-light">${transaction.description}</td>
            </tr>
            <tr>
                <td class="text-light">SubTotal:</td>
                <td class="text-light">$${transaction.amount.details.subtotal}</td>
            </tr>
            <tr>
                <td class="text-light">Service Charges:</td>
                <td class="text-light">$${transaction.amount.details.shipping}</td>
            </tr>
            <tr>
                <td class="text-light">Tax:</td>
                <td class="text-light">$${transaction.amount.details.tax}</td>
            </tr>
            <tr>
                <td class="text-light">Total:</td>
                <td class="text-light">$${transaction.amount.total}</td>
            </tr>
            <tr>
                <td colspan="2" class="text-center fw-bold fs-4 text-light">Payer Information Details:</td>
                <td></td>
            </tr>
            <tr>
                <td class="text-light">First Name:</td>
                <td class="text-light">${payer.firstName}</td>
            </tr>
            <tr>
                <td class="text-light">Last Name:</td>
                <td class="text-light">${payer.lastName}</td>
            </tr>
            <tr>
                <td class="text-light">Email:</td>
                <td class="text-light">${payer.email}</td>
            </tr>
            <tr>
                <td colspan="2" class="text-center fw-bold fs-4 text-light">Address:</td>
                <td></td>
            </tr>
            <tr>
                <td class="text-light">Recipient name:</td>
                <td class="text-light">${shippingAddress.recipientName}</td>
            </tr>
            <tr>
                <td class="text-light">Line 1:</td>
                <td class="text-light">${shippingAddress.line1}</td>
            </tr>
            <tr>
                <td class="text-light">City:</td>
                <td class="text-light">${shippingAddress.city}</td>
            </tr>
            <tr>
                <td class="text-light">State:</td>
                <td class="text-light">${shippingAddress.state}</td>
            </tr>
            <tr>
                <td class="text-light">Country Code:</td>
                <td class="text-light">${shippingAddress.countryCode}</td>
            </tr>
            <tr>
                <td class="text-light">Postal Code:</td>
                <td class="text-light">${shippingAddress.postalCode}</td>
            </tr>
        </table>
        <input type="submit" class="btn btn-primary w-25 mt-3" style="margin-left: 450px" value="Pay Now">
    </form>
</div>
</body>
</html>
