<%--
  Created by IntelliJ IDEA.
  User: dhanu
  Date: 1/12/2023
  Time: 7:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>ABC Cinemas - Contact Us</title>
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
            crossorigin="anonymous"
    ></script>
</head>
<body id="ContactUsBody">
<header>
    <a href="index.jsp" class="logo"
    ><img src="img/logo-white.png" alt="" id="home-navbar-logo"
    /></a>
    <ul class="navigation fs-4" id="navigation_bar">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="Movies.jsp">Movies</a></li>
        <li><a href="News.jsp">News</a></li>
        <li><a href="ContactUs.jsp">Contact Us</a></li>
        <li><a href="AboutUs.jsp">About us</a></li>
        <li><a href="Booking.jsp" id="buyTickets-btn">Buy Tickets</a></li>
    </ul>
</header>
<section class="contact">
    <div class="content" style="margin-top: 150px">
        <h2>Contact Us</h2>
        <h3>Technical Support</h3>
        <p>
            If you have a problem with a booking or anything on the site, send an
            email to abccinema@gmail.com<br/>(Monday to Friday 8.00 am to
            5.00 pm)
        </p>
    </div>
    <div class="container">
        <div class="contactInfo">
            <div class="box">
                <div class="icon">
                    <i class="fa fa-mobile" aria-hidden="true"></i>
                </div>
                <div class="text">
                    <h3>Mobile-Phone</h3>
                    <p>0716573489</p>
                </div>
            </div>
            <div class="box">
                <div class="icon"><i class="fa fa-phone"></i></div>
                <div class="text">
                    <h3>Land-Phone</h3>
                    <p>0326573489</p>
                </div>
            </div>
            <div class="box">
                <div class="icon">
                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                </div>
                <div class="text">
                    <h3>Address</h3>
                    <p>
                        Robert Robertson, 1234 NW Bobcat Lane, St. Robert, MO
                        65584-5678.
                    </p>
                </div>
            </div>
        </div>
        <div id="contactImage"></div>
    </div>
</section>
<hr/>

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
</body>
</html>
