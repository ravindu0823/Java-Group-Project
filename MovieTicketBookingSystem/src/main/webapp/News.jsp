<%--
  Created by IntelliJ IDEA.
  User: dhanu
  Date: 1/13/2023
  Time: 12:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Cinemas - News</title>
    <link rel="icon" type="image/png" href="img/logo-white.png"/>
    <link rel="stylesheet" href="css/news.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,300;0,500;0,700;1,100;1,400&display=swap"
          rel="stylesheet">

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
<body>


<div id="news-header">
    <div id="news-navigation">
        <header>
            <a href="index.jsp" class="logo"><img src="img/logo-white.png" alt="" id="home-navbar-logo"></a>
            <ul class="navigation fs-4" id="navigation_bar">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="Movies.jsp">Movies</a></li>
                <li><a href="News.jsp">News</a></li>
                <li><a href="ContactUs.jsp">Contact Us</a></li>
                <li><a href="AboutUs.jsp">About us</a></li>
                <li><a href="Booking.jsp" id="buyTickets-btn">Buy Tickets</a></li>
            </ul>
        </header>
    </div>

    <div id="news-header-title">
        <div id="news-header-title-h2">
            <h2 class="mt-5">Movie News</h2>
        </div>
        <div id="news-header-title-h4">
            <h4>The latest movie news on the movies you're most interested in seeing.</h4>
        </div>
    </div>
</div>

<div id="news-section">
    <div id="news-section-title-h2">
        <h2><i>LATEST</i></h2>
    </div>
    <div id="news-section-news">
        <hr>
        <div class="news-section-news-row" id="news-section-news-row01">
            <div class="news-image-box">
                <div class="news-section-news-row-img" id="news-section-news-row01-img">
                    <img src="img/antman-news.jpg" class="news-img">
                </div>
            </div>
            <div class="news-section-news-row-content" id="news-section-news-row-content01">
                <div>
                    <h3>
                        New Ant-Man 3 Trailer Release Date Revealed (& It's Soon)
                    </h3>
                </div>
                <div>
                    <p>
                        The new Ant-Man and the Wasp: Quantud trailer release date is
                        revealed to be coming very soon, just over a month ahead of its debut.
                    </p>
                </div>
            </div>
        </div>
        <hr>
        <br>
        <hr>
        <div class="news-section-news-row" id="news-section-news-row02">
            <div class="news-image-box">
                <div class="news-section-news-row-img" id="news-section-news-row02-img">
                    <img src="img/plane-news.jpg" class="news-img">
                </div>
            </div>
            <div class="news-section-news-row-content" id="news-section-news-row-content02">
                <div>
                    <h3>
                        New Plane Clip Sees Gerard Butler Get Involved In A Brutal Fight
                    </h3>
                </div>
                <div>
                    <p>
                        The latest clip from Plane, Lionsgate's upcoming action flick,
                        finds Gerard Butler's phone call violently interrupted by an attack from a rebel.
                    </p>
                </div>
            </div>
        </div>
        <hr>
        <br>
        <hr>
        <div class="news-section-news-row" id="news-section-news-row03">
            <div class="news-image-box">
                <div class="news-section-news-row-img" id="news-section-news-row03-img">
                    <img src="img/wakanda-news.jpg" class="news-img">
                </div>
            </div>
            <div class="news-section-news-row-content" id="news-section-news-row-content03">
                <div>
                    <h3>
                        WAKANDA 3 Trailer Release Date Revealed (& It's Soon)
                    </h3>
                </div>
                <div>
                    <p>
                        The new Ant-Man and the Wasp: Quantu trailer release date is
                        revealed to be coming very soon, just over a month ahead of its debut.
                    </p>
                </div>
            </div>
        </div>
        <hr>
    </div>
</div>

<footer>
    <ul class="footerNavigation">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="Movies.jsp">Movies</a></li>
        <li><a href="News.jsp">News</a></li>
        <li><a href="ContactUs.jsp">Contact Us</a></li>
        <li><a href="AboutUs.jsp">About us</a></li>
    </ul>
    <p>©2022 ABC Cinemas All Right Reserved. Developed by Java Group 15</p>
    <img src="img/logo-white.png" alt="logo" id="homeLog-downleft">
    <ul class="social_icon">
        <li><a href="#facebook">
            <ion-icon name="logo-facebook"></ion-icon>
        </a></li>
        <li><a href="#twitter">
            <ion-icon name="logo-twitter"></ion-icon>
        </a></li>
        <li><a href="#linkedin">
            <ion-icon name="logo-linkedin"></ion-icon>
        </a></li>
        <li><a href="#Instagram">
            <ion-icon name="logo-instagram"></ion-icon>
        </a></li>
    </ul>
    <img src="img/logo-white.png" alt="logo" id="homeLog-downright">
</footer>


<script>
    window.onscroll = function () {
        myFunction()
    };

    var navigation_bar = document.getElementById("navigation_bar");
    var sticky = navigation_bar.offsetTop;

    function myFunction() {
        if (window.pageYOffset >= sticky) {
            navigation_bar.classList.add("sticky")
        } else {
            navigation_bar.classList.remove("sticky");
        }
    }
</script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>