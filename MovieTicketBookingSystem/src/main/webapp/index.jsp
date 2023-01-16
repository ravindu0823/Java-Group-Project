<%@ page import="com.pusl2024.movieticketbookingsystem.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>ABC Cinemas - Home Page</title>
    <link rel="icon" type="image/png" href="img/logo-white.png"/>
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,300;0,500;0,700;1,100;1,400&display=swap"
            rel="stylesheet"
    />
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
    />
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            defer
    ></script>
    <script
            src="https://kit.fontawesome.com/1f15b717d8.js"
            crossorigin="anonymous" defer
    ></script>
</head>

<body>

<% DBConnection dBConnection = new DBConnection();
    Connection connection = dBConnection.getConnection();
    PreparedStatement preparedStatement;

%>
<header>
    <a href="index.jsp" class="logo"
    ><img src="img/logo-white.png" alt="" id="home-navbar-logo"
    /></a>
    <ul class="navigation fs-4" id="navigation_bar">
        <li><a href="index.jsp" class="stroke">Home</a></li>
        <li><a href="Movies.jsp" class="stroke">Movies</a></li>
        <li><a href="News.jsp" class="stroke">News</a></li>
        <li><a href="ContactUs.jsp" class="stroke">Contact Us</a></li>
        <li><a href="AboutUs.jsp" class="stroke">About us</a></li>
        <li><a href="Booking.jsp" id="buyTickets-btn">Buy Tickets</a></li>
    </ul>
</header>
<section class="banner" id="banner">
    <div class="content">
        <h2 banner-heading>AVATAR: THE WAY OF WATER</h2>
        <h3 class="text-white">Now Screening</h3>
    </div>
</section>

<section class="nowshowing" id="nowshowing-home">
    <div class="text-center">
        <span class="fs-3">Now Showing</span>
        <a href="Movies.jsp" style="text-decoration: none; color: white"
        ><span style="padding-left: 48%">See More>></span></a>
    </div>

    <hr/>
    <div class="content">
        <% try {
            preparedStatement = connection.prepareStatement("{CALL GET_NOW_SCREENING_MOVIES()}");
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
        %>

        <div class="box">
            <div class="imgBx">
                <img src="img/<%=resultSet.getString(4)%>" alt="" class="img-nowShowing"/>
            </div>
            <div class="text">
                <h3><%=resultSet.getString(1)%>
                </h3>
                <p class="text-white fs-4"><%=resultSet.getString(2)%>
                </p>

                <div class="fs-4">
                    <i class="fa-solid fa-ticket"><span style="margin-left: 20px; font-family: 'Poppins' !important">
                  <a href="Booking.jsp" style="text-decoration: none; color: white">
                    Buy Tickets
                  </a>
                </span>
                    </i>
                </div>
                <div class="fs-4">
                    <i class="fa-brands fa-youtube"><span style="margin-left: 20px">
                  <a href="<%=resultSet.getString(3)%>" target="_blank" style="text-decoration: none; color: white">
                    Watch Trailer
                  </a>
                </span>
                    </i>
                </div>
            </div>
        </div>
        <% }
        } catch (Exception e) {
            out.println(e.getMessage());
        }

        %>
    </div>
</section>

<section class="" id="comingsoon-home">
    <div class="text-center" style="margin-top: 100px">
        <span class="fs-3">Coming Soon</span>
        <a href="Movies.jsp" style="text-decoration: none; color: white"><span
                style="padding-left: 48%">See More>></span></a>
    </div>
    <hr/>
    <div class="content" style="padding-bottom: 200px">
        <% try {
            preparedStatement = connection.prepareStatement("{CALL GET_UP_COMING_MOVIES()}");
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
        %>
        <div class="box">
            <div class="imgBx">
                <img src="img/<%=resultSet.getString(4)%>" alt="" class="img-comingsoon"/>
            </div>
            <div class="text">
                <h3><%=resultSet.getString(1)%>
                </h3>
                <p class="text-white fs-5"><%=resultSet.getString(2)%>
                </p>
                <div class="fs-4">
                    <i class="fa-brands fa-youtube"><span style="margin-left: 20px">
                  <a href="<%=resultSet.getString(3)%>" target="_blank" style="text-decoration: none; color: white">
                    Watch Trailer
                  </a>
                </span>
                    </i>
                </div>
            </div>
        </div>

        <% }
        } catch (Exception e) {
            out.println(e.getMessage());
        }

        %>
    </div>
</section>

<section class="home-about" id="home-about">
    <div class="content">
        <h3 id="home-about-title">ABOUT ABC CINEMAS</h3>
        <p>
            ABC Cinema is a company that operates luxury mini cinemas in Sri Lanka and imports and distributes Hollywood
            and Bollywood movies. They use modern technology to provide a cinematic experience at an affordable price.
            They were the first to introduce digital mini cinemas in Sri Lanka.
        </p>
    </div>
</section>

<footer>
    <ul class="footerNavigation">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="Movies.jsp">Movies</a></li>
        <li><a href="News.jsp">News</a></li>
        <li><a href="ContactUs.jsp">Contact Us</a></li>
        <li><a href="AboutUs.jsp">About us</a></li>
    </ul>
    <p>
        ©2022 ABC Cinemas All Right Reserved. Developed by Java Group 15
    </p>
    <img src="img/logo-white.png" alt="logo" id="homeLog-downleft"/>
    <ul class="social_icon">
        <li>
            <a href="#facebook">
                <ion-icon name="logo-facebook"></ion-icon>
            </a>
        </li>
        <li>
            <a href="#twitter">
                <ion-icon name="logo-twitter"></ion-icon>
            </a>
        </li>
        <li>
            <a href="#linkedin">
                <ion-icon name="logo-linkedin"></ion-icon>
            </a>
        </li>
        <li>
            <a href="#Instagram">
                <ion-icon name="logo-instagram"></ion-icon>
            </a>
        </li>
    </ul>
    <img src="img/logo-white.png" alt="logo" id="homeLog-downright"/>
</footer>

<script>
    window.onscroll = function () {
        myFunction();
    };

    var navigation_bar = document.getElementById("navigation_bar");
    var sticky = navigation_bar.offsetTop;

    function myFunction() {
        if (window.pageYOffset >= sticky) {
            navigation_bar.classList.add("sticky");
        } else {
            navigation_bar.classList.remove("sticky");
        }
    }
</script>
<script
        type="module"
        src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"
></script>
<script
        nomodule
        src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"
></script>
</body>
</html>