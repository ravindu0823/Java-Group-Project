<%--
  Created by IntelliJ IDEA.
  User: dhanu
  Date: 1/12/2023
  Time: 7:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>ABC Cinemas - About Us</title>
    <link rel="icon" type="image/png" href="img/logo-white.png"/>
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,300;0,500;0,700;1,100;1,400&display=swap"
            rel="stylesheet"
    />
    <script src="https://use.fontawesome.com/ba5a47c021.js"></script>
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
    />
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            defer
    ></script>
</head>
<body id="">
<header>
    <a href="index.jsp" class="logo"
    ><img src="img/logo-white.png" alt="" id="home-navbar-logo"
    /></a>
    <ul class="navigation fs-5" id="navigation_bar">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="Movies.jsp">Movies</a></li>
        <li><a href="News.jsp">News</a></li>
        <li><a href="ContactUs.jsp">Contact Us</a></li>
        <li><a href="AboutUs.jsp">About us</a></li>
        <li><a href="Booking.jsp" id="buyTickets-btn">Buy Tickets</a></li>
    </ul>
</header>

<section class="about" id="about-top">
    <div class="content">
        <h3 id="aboutus-title">ABOUT US</h3>
        <h3 id="home-about-title">ABOUT ABC CINEMAS</h3>
        <p>
            ABC Cinema is a company that operates luxury mini cinemas in Sri Lanka and imports and distributes Hollywood
            and Bollywood movies. They use modern technology to provide a cinematic experience at an affordable price.
            They were the first to introduce digital mini cinemas in Sri Lanka.
        </p>
    </div>
</section>

<section class="about" id="about-bottom">
    <div class="content">
        <div class="about-column" id="about-column01">
            <h3 id="aboutus-vision">Vision</h3>
            <p>
                The vision for ABC cinema is to provide a unique and immersive entertainment experience for audiences.
                This can include the use of advanced technology, such as 3D and 4K projection, as well as comfortable
                seating and high-quality sound systems. Additionally, our cinema is also focusing on providing a wide
                range of food and drink options, as well as creating a social and enjoyable atmosphere for movie-goers.
                Overall, the aim is to create an experience that cannot be replicated at home and make the movie-going
                experience special and enjoyable.
            </p>
        </div>
        <div class="about-column" id="about-column02">
            <h3 id="aboutus-mission">Mission</h3>
            <p>
                The mission of ABC Cinema is to entertain and engage audiences by providing them with the latest and
                greatest in film content and technology. This includes showcasing a diverse range of movies, from
                blockbuster Hollywood productions to independent and foreign films. Cinemas also strive to create a
                welcoming and inclusive environment for all moviegoers, regardless of their background or interests.
                Overall, the mission of ABC Cinema is to be a cultural hub and a source of entertainment for the
                community.
            </p>
        </div>
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
