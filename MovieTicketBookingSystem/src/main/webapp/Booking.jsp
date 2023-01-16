<%@ page import="com.pusl2024.movieticketbookingsystem.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: dhanu
  Date: 1/13/2023
  Time: 2:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Cinemas - Seat Booking</title>
    <link rel="icon" type="image/png" href="img/logo-white.png"/>
    <link rel="stylesheet" href="css/style1.css">
    <link rel="stylesheet" href="css/style.css">

</head>

<body>
<% DBConnection dBConnection = new DBConnection();
    Connection connection = dBConnection.getConnection();
    PreparedStatement preparedStatement;
    HttpSession httpSession = request.getSession();

%>

<header>
    <a href="index.jsp" class="logo"
    ><img src="img/logo-white.png" alt="" id="home-navbar-logo"
    /></a>
    <ul class="navigation fs-4" id="navigation_bar" >
        <li><a href="index.jsp" class="" style="font-size: 1.5rem !important;">Home</a></li>
        <li><a href="Movies.jsp" class="" style="font-size: 1.5rem !important;">Movies</a></li>
        <li><a href="News.jsp" class="" style="font-size: 1.5rem !important;">News</a></li>
        <li><a href="ContactUs.jsp" class="" style="font-size: 1.5rem !important;">Contact Us</a></li>
        <li><a href="AboutUs.jsp" class="" style="font-size: 1.5rem !important;">About us</a></li>
        <li><a href="Booking.jsp" id="buyTickets-btn">Buy Tickets</a></li>
    </ul>
</header>

<form action="MovieBookingServlet" method="get" style="margin-top: 30px">
    <span class="movie-container">
        <label>Pick a movie:</label>
        <select id="movie" name="movie_id">
            <option value="0">Please Select</option>
            <% try {
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("select movieid, moviename from movie where description = 'Now Screening';");

                while (resultSet.next()) {
            %>
            <option value="<%=resultSet.getInt(1)%>"><%=resultSet.getString(2)%></option>
            <%
                    }
                } catch (Exception e) {
                    out.println(e.getMessage());
                }

            %>
        </select>
    </span>

    <span class="movie-container" style="margin-left: 50px">
        <label>Select the Date</label>
        <select id="date" name="date_id">
            <option value="0">Please Select</option>
            <% try {
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM movie.date");

                while (resultSet.next()) {
            %>
            <option value="<%=resultSet.getInt(1)%>"><%=resultSet.getDate(2)%></option>
            <% }
            } catch (Exception e) {
                out.println(e.getMessage());
            }

            %>
        </select>
    </span>

    <span class="movie-container" style="margin-left: 50px">
        <label>Select the Time Slot</label>
        <select id="time_slot" name="time_slot_id">
            <option value="0">Please Select</option>
            <% try {
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM movie.timeslot");

                while (resultSet.next()) {
            %>
            <option value="<%=resultSet.getInt(1)%>"><%=resultSet.getString(2)%></option>
            <% }
            } catch (Exception e) {
                out.println(e.getMessage());
            }

            %>
        </select>
    </span>


    <br>
    <input class="movie-container" name="seats" type="text" id="temp" hidden>
    <input class="movie-container" name="seat_count" type="text" id="seat_count" hidden>
    <input class="movie-container" name="total_price" type="text" id="total_price" hidden>

    <br>
    <br>

    <ul class="showcase">
        <li>
            <div class="seat"></div>
            <small>N/A</small>
        </li>
        <li>
            <div class="seat selected"></div>
            <small>Selected</small>
        </li>
        <li>
            <div class="seat occupied"></div>
            <small>Occupied</small>
        </li>
    </ul>

    <div class="container">
        <div class="movie-screen">
            <img src='img/screen-thumb.png' alt='screen'/>
        </div>

        <div class="row-container">
            <div class="row">
                <div class="seat" id="1"></div>
                <div class="seat" id="2"></div>
                <div class="seat" id="3"></div>
                <div class="seat" id="4"></div>
                <div class="seat" id="5"></div>
                <div class="seat" id="6"></div>
                <div class="seat" id="7"></div>
                <div class="seat" id="8"></div>
                <div class="seat" id="9"></div>
                <div class="seat" id="10"></div>
            </div>
            <div class="row">
                <div class="seat" id="11"></div>
                <div class="seat" id="12"></div>
                <div class="seat" id="13"></div>
                <div class="seat" id="14"></div>
                <div class="seat" id="15"></div>
                <div class="seat" id="16"></div>
                <div class="seat" id="17"></div>
                <div class="seat" id="18"></div>
                <div class="seat" id="19"></div>
                <div class="seat" id="20"></div>
            </div>
            <div class="row">
                <div class="seat" id="21"></div>
                <div class="seat" id="22"></div>
                <div class="seat" id="23"></div>
                <div class="seat" id="24"></div>
                <div class="seat" id="25"></div>
                <div class="seat" id="26"></div>
                <div class="seat" id="27"></div>
                <div class="seat" id="28"></div>
                <div class="seat" id="29"></div>
                <div class="seat" id="30"></div>
            </div>
            <div class="row">
                <div class="seat" id="31"></div>
                <div class="seat" id="32"></div>
                <div class="seat" id="33"></div>
                <div class="seat" id="34"></div>
                <div class="seat" id="35"></div>
                <div class="seat" id="36"></div>
                <div class="seat" id="37"></div>
                <div class="seat" id="38"></div>
                <div class="seat" id="39"></div>
                <div class="seat" id="40"></div>
            </div>
            <div class="row">
                <div class="seat" id="41"></div>
                <div class="seat" id="42"></div>
                <div class="seat" id="43"></div>
                <div class="seat" id="44"></div>
                <div class="seat" id="45"></div>
                <div class="seat" id="46"></div>
                <div class="seat" id="47"></div>
                <div class="seat" id="48"></div>
                <div class="seat" id="49"></div>
                <div class="seat" id="50"></div>
            </div>
            <div class="row">
                <div class="seat" id="51"></div>
                <div class="seat" id="52"></div>
                <div class="seat" id="53"></div>
                <div class="seat" id="54"></div>
                <div class="seat" id="55"></div>
                <div class="seat" id="56"></div>
                <div class="seat" id="57"></div>
                <div class="seat" id="58"></div>
                <div class="seat" id="59"></div>
                <div class="seat" id="60"></div>
            </div>
            <div class="row">
                <div class="seat" id="61"></div>
                <div class="seat" id="62"></div>
                <div class="seat" id="63"></div>
                <div class="seat" id="64"></div>
                <div class="seat" id="65"></div>
                <div class="seat" id="66"></div>
                <div class="seat" id="67"></div>
                <div class="seat" id="68"></div>
                <div class="seat" id="69"></div>
                <div class="seat" id="70"></div>
            </div>
            <h5 class='subtitle'>GOLD CLASS</h5>
            <div class="row">
                <div class="seat" id="71"></div>
                <div class="seat" id="72"></div>
                <div class="seat" id="73"></div>
                <div class="seat" id="74"></div>
                <div class="seat" id="75"></div>
                <div class="seat" id="76"></div>
                <div class="seat" id="77"></div>
                <div class="seat" id="78"></div>
            </div>
            <h5 class='subtitle'>DIAMOND CLASS</h5>

            <div class="text-wrapper">
                <p class="text" style="color: white !important;">Selected Seats <span id='count'>0</span>
                <p class="text" style="color: white !important;">Total Price (USD)<span id="total">0</span></p>
            </div>
            <%--<input type="submit" class="hehe" value="Submit">--%>
            <button type="submit" class="hehe" style="margin-left: 150px"><span>Process</span></button>
        </div>
    </div>
</form>


<!-- <div class="text-wrapper">
    <p class="text">Selected Seats <span id='count'>0</span>
        <p class="text">Total Price ₹<span id="total">0</span></p>
</div> -->

<script src='css/script.js'></script>

<script>
    <%
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select seatid from bookingseat");

            while (resultSet.next()) {

    %>
    document.getElementById("<%=resultSet.getInt(1)%>").className += " occupied";

    <% }
    } catch (Exception e) {
        out.println(e.getMessage());
    }

    %>
</script>
</body>

</html>