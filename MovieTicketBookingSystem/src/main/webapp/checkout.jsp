<%@ page import="com.pusl2024.movieticketbookingsystem.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: dhanu
  Date: 1/10/2023
  Time: 12:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.108.0">
    <title>Checkout</title>

    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
    />
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            defer
    ></script>

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 100vh;
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }
    </style>


</head>

<body class="bg-light" style="background-color: #000124 !important;">

<%
    DBConnection dBConnection = new DBConnection();
    Connection connection = dBConnection.getConnection();
    PreparedStatement preparedStatement;

    HttpSession httpSession = request.getSession();

    String movieId = httpSession.getAttribute("movie_id").toString();
    String dateId = httpSession.getAttribute("date_id").toString();
    String timeSlotId = httpSession.getAttribute("time_slotId").toString();
    String seatCount = httpSession.getAttribute("seat_count").toString();
    String subTotal = httpSession.getAttribute("total_price").toString();

%>

<div class="container text-white">
    <main>
        <div class="py-5 text-center">
            <h2>Checkout form</h2>
        </div>

        <div class="row g-5">
            <div class="col-md-5 col-lg-4 order-md-last">
                <h4 class="d-flex justify-content-between align-items-center mb-3 text">
                    <span class="text-white">Your cart</span>
                </h4>
                <ul class="list-group mb-3">
                    <% try {
                        Statement statement = connection.createStatement();
                        ResultSet resultSet = statement.executeQuery("select moviename from movie where movieid = " + movieId + "");

                        while (resultSet.next()) {
                    %>

                    <li class="list-group-item d-flex justify-content-between lh-sm">
                        <div>
                            <h6 class="my-0">Movie Name</h6>
                            <%--<small class="text-muted">Brief description</small>--%>
                        </div>
                        <span class="text-muted" id="movie_name"><%=resultSet.getString(1)%></span>
                    </li>
                    <%
                            }
                        } catch (Exception e) {
                            out.println(e.getMessage());
                        }

                    %>
                    <li class="list-group-item d-flex justify-content-between lh-sm">
                        <div>
                            <% try {
                                Statement statement = connection.createStatement();
                                ResultSet resultSet = statement.executeQuery("select date_d from date where dateid = " + dateId + "");

                                while (resultSet.next()) {
                            %>
                            <h6 class="my-0">Movie Date</h6>
                            <%--<small class="text-muted">Brief description</small>--%>
                        </div>
                        <span class="text-muted"><%=resultSet.getDate(1)%></span>
                        <%
                                }
                            } catch (Exception e) {
                                out.println(e.getMessage());
                            }

                        %>
                    </li>
                    <li class="list-group-item d-flex justify-content-between lh-sm">
                        <div>
                            <h6 class="my-0">Movie Time</h6>
                            <%--<small class="text-muted">Brief description</small>--%>
                        </div>
                        <% try {
                            Statement statement = connection.createStatement();
                            ResultSet resultSet = statement.executeQuery("select timeSlot from timeslot where timeSlotID = " + timeSlotId + "");

                            while (resultSet.next()) {
                        %>
                        <span class="text-muted"><%=resultSet.getString(1)%></span>
                        <%
                                }
                            } catch (Exception e) {
                                out.println(e.getMessage());
                            }

                        %>
                    </li>
                    <li class="list-group-item d-flex justify-content-between lh-sm">
                        <div>
                            <h6 class="my-0">Tickets</h6>
                            <%--<small class="text-muted">Brief description</small>--%>
                        </div>
                        <span class="text-muted"><%=seatCount %></span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between lh-sm">
                        <div>
                            <h6 class="my-0">Sub Total</h6>
                            <%--<small class="text-muted">Brief description</small>--%>
                        </div>
                        <span class="text-muted" id="sb_total"><%=subTotal%></span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between lh-sm">
                        <div>
                            <%-- Shipping --%>
                            <h6 class="my-0">Service Charges</h6>
                            <%--<small>EXAMPLECODE</small>--%>
                        </div>
                        <span id="serv_charge"><%=Integer.parseInt(subTotal) * 40 / 100%></span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between bg-light">
                        <div>
                            <h6 class="my-0">Tax</h6>
                            <%--<small class="text-muted">Brief description</small>--%>
                        </div>
                        <span class="text-muted" id="ttx">20</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between">
                        <span>Total (USD)</span>
                        <strong class="text-success" id="tt">$</strong>
                    </li>
                </ul>

            </div>
            <div class="col-md-7 col-lg-8">
                <h4 class="mb-3">Billing address</h4>
                <form method="post" action="MovieBookingServlet" class="needs-validation" novalidate>
                    <div class="row g-3">
                        <div class="col-sm-6">
                            <label for="firstName" class="form-label">First name</label>
                            <input type="text" name="first_name" class="form-control" id="firstName" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Valid first name is required.
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <label for="lastName" class="form-label">Last name</label>
                            <input type="text" name="last_name" class="form-control" id="lastName" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Valid last name is required.
                            </div>
                        </div>

                        <div class="col-12">
                            <label for="email" class="form-label">Email <span
                                    class="text-white">(Optional)</span></label>
                            <input type="email" name="email" class="form-control" id="email" placeholder="you@example.com">
                            <div class="invalid-feedback">
                                Please enter a valid email address for shipping updates.
                            </div>
                        </div>

                        <div class="col-12">
                            <label for="phone" class="form-label">Phone</label>
                            <input type="text" name="phone" class="form-control" id="phone">
                        </div>

                        <button class="my-4 w-100 btn btn-primary btn-lg" type="submit">Continue to checkout</button>

                        <div hidden>
                            <input type="text" name="product" id="product" readonly>
                            <input type="text" name="sub_total" id="sub_total" readonly>
                            <input type="text" name="shipping" id="shipping" readonly>
                            <input type="text" name="tax" id="tax" readonly>
                            <input type="text" name="total" id="total" readonly>
                        </div>

                    </div>

                </form>
            </div>
        </div>
    </main>
</div>

<script src="css/checkout.js"></script>
</body>

</html>