<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en" class="no-js">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Users</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/foundation/css/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/foundation/css/foundation.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/foundation/css/foundation-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/selectize/css/selectize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/selectize/css/selectize.default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/foundation-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/app.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/foundation/js/vendor/modernizr.js"></script>
</head>

<body>

<nav class="top-bar show-for-large-up" data-topbar role="navigation">
    <ul class="title-area">
        <li class="name">
            <h1><a href="#">My Site</a></h1>
        </li>
        <!-- Remove the class "menu-icon" to get rid of menu icon. Take out "Menu" to just have icon alone -->
        <li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>
    </ul>

    <section class="top-bar-section">
        <!-- Right Nav Section -->
        <ul class="right">

            <li class="has-form" style="min-width: 300px;">
                <form id="userSearch" action="${pageContext.request.contextPath}/users/search" method="POST">
                    <div class="row collapse">
                        <div class="large-8 small-8 medium-8 columns">
                            <input type="text" placeholder="Search other users by name" name="usersearchterm" required="">
                        </div>
                        <div class="large-4 small-4 medium-4 columns">
                            <input type="submit" value="Search" class="button postfix" style="padding-top: 0">
                        </div>
                    </div>
                </form>
            </li>

            <li> <a href="#"> Hit John Up </a> </li>

            <li class="has-dropdown">
                <a href="#">Menu</a>
                <ul class="dropdown">
                    <li><a href="#"> My Account </a></li>
                    <li><a href="#"> Privacy </a> </li>
                    <li><a href="#"> Help </a> </li>
                    <li><a href="#" data-reveal-id="reportAProblem"> Report A problem  </a> </li>
                    <li><a href="#"> Sign Out  </a> </li>
                </ul>
            </li>

        </ul>

        <!-- Left Nav Section -->
        <ul class="left">
            <li><a href="#"> My Feed </a></li>
            <li><a href="#"> My Resi </a></li>
            <li><a href="#"> Shoutouts </a></li>
            <li><a href="#"> Logout </a></li>
        </ul>
    </section>
</nav>

<div class="large-12 show-for-medium-down">

    <div class="icon-bar five-up " style="background-color: #274C77">
        <a class="item" style="background-color: #274C77; padding-bottom: 15px ">
            <br/><p style="font-size:1.1rem; color: #fffffc">MyResi</p>
        </a>
        <a class="item" style="background-color: #274C77">
            <i class="fi-mail"></i><label>Myfeed</label>
        </a>
        <a class="item" style="background-color: #274C77">
            <i class="fi-info"></i><label>MyResi</label>
        </a>
        <a class="item" style="background-color: #274C77; padding: 1.25rem 0 1.25rem 0">
            <i class="fi-mail"></i><label>Shoutouts</label>
        </a>
        <a class="item" style="background-color: #274C77">
            <i class="fi-power"></i><label>Logout</label>
        </a>
    </div>

    <div class="row">
        <div class="large-12 columns">
            <div class="row collapse">
                <div class="small-10 columns">
                    <input type="text" placeholder="Name here">
                </div>
                <div class="small-2 columns">
                    <a href="#" class="button postfix radius">Go</a>
                </div>
            </div>
        </div>
        <div class="large-12 columns">
            <button href="#" data-dropdown="drop1" aria-controls="drop1" aria-expanded="false" class="button expand dropdown">Menu</button><br>
            <ul id="drop1" data-dropdown-content class="f-dropdown" aria-hidden="true">
                <li><a href="#">My Account</a></li>
                <li><a href="#">Privacy</a></li>
                <li><a href="#">Help</a></li>
                <li><a href="#">Report a Problem</a></li>
            </ul>
        </div>
    </div>

    <div class="large-centered" style="margin-top:20px; ">

        <div class="medium-3 small-5 columns" >
            <img src="${pageContext.request.contextPath}/resources/images/avatar.png" alt="Image not found"/>
        </div>

        <div class="medium-9 small-7 columns" style="padding:0;">
            <textarea name="share" id="share" cols="30" rows="7" placeholder="Write something to share" style="resize: none; height: 93px; max-height: 93px;"></textarea>
        </div>

        <div class="large-8 columns">
            Share with: <select name="carlist">
            <option selected value="allShare">All</option>
            <option value="facebookShare">Facebook</option>
            <option value="twitterShare">Twitter</option>
            <option value="googleShare">Google+</option>
            <option value="linkedinShare">Linkedin</option>
        </select>
        </div>

        <div class="large-4 columns" style="margin-top: 23px; padding-left: 0; padding-right: 0;">
            <button class="button small secondary radius expand" style="padding-top: 0.7rem; padding-bottom: 0.7rem; ">Share</button>
        </div>

    </div>

</div>


<div class="row fullWidth">

        <div id="sidebar" style="width: 320px;">
            <div class="large-12 columns show-for-large-up" style="background-color: #1C7C54; min-height: 100%; padding:10px">

                <div class="large-centered" style="margin-top:20px;">

                    <div class="large-5 columns">
                        <img src="${pageContext.request.contextPath}/resources/images/avatar.png" alt="Image not found"/>
                    </div>

                    <div class="large-7 columns" style="padding:0;">
                        <textarea name="share" id="share" cols="30" rows="7" placeholder="Write something to share" style="resize: none; height: 93px; max-height: 93px;"></textarea>
                    </div>

                    <div class="large-8 columns">
                        Share with: <select name="carlist">
                        <option selected value="allShare">All</option>
                        <option value="facebookShare">Facebook</option>
                        <option value="twitterShare">Twitter</option>
                        <option value="googleShare">Google+</option>
                        <option value="linkedinShare">Linkedin</option>
                    </select>
                    </div>

                    <div class="large-4 columns" style="margin-top: 23px; padding-left: 0; padding-right: 0;">
                        <button class="button small secondary radius expand" style="padding-top: 0.7rem; padding-bottom: 0.7rem; ">Share</button>
                    </div>

                </div>

                <div id="userSideMenu" class="large-centered radius">
                    <ul>
                        <li> <a href="#"> My Peeps </a> </li>
                        <li> <a href="#"> Good Fits </a> </li>
                        <li> <a href="#"> My Searches </a> </li>
                        <li> <a href="#"> Other Stuff </a> </li>
                        <li> <a href="#"> Hit Us Up </a> </li>
                    </ul>
                </div>

                <div id="advertisement" class="large-centered radius" style="background-color: #f2f2f2; margin-top: 20px; margin-bottom: 20px">

                    <img src="${pageContext.request.contextPath}/resources/images/edit.png" alt="Advertisement here"/>

                </div>

            </div>

        </div>

        <div id="contentShow" style="display: inline-block; background-color:#fffffc;">

            <div id="contentShowChild" style="margin:5% auto 0 auto; box-shadow: -2px -2px 5px 0 rgba(0,0,0,0.25);" >

                <!--div style="padding:10px;" class="row">
                    <div class="large-12 columns">
                        <form id="userSearch" action="${pageContext.request.contextPath}/users/search" method="POST">
                            <h3>Search again or start a new search</h3>
                            <div class="row collapse">
                                <div class="large-10 small-10 medium-10 columns">
                                    <input type="text" placeholder="Search other users by name" name="usersearchterm" required="">
                                </div>
                                <div class="large-2 small-2 medium-2 columns">
                                    <input type="submit" value="Search" class="button fi-magnifying-glass size-12 postfix">
                                </div>
                            </div>
                        </form>
                    </div-->
                    <c:choose>
                        <c:when  test="${!empty users}">
                            <c:forEach items="${users}" var="user">

                                <div class="large-12 columns panel">
                                    <div class="large-3 columns text-center">
                                        <!--div.large-2.columns-->
                                        <div id="profileImage" style="background-image:url(${pageContext.request.contextPath}/resources/images/avatar.png)" class="large-centered"></div>
                                        <div class="large-12 columns">
                                            <h3> ${user.lastName}, ${user.firstName}</h3>
                                            <h5> ${user.position}</h5>
                                        </div>
                                    </div>
                                    <div class="large-9 columns">
                                        <h5 class="left"> About ${user.firstName} </h5>
                                        <hr>
                                        <p class="text-left">
                                                ${user.aboutMe}
                                        </p>
                                        <p class="large-centered medium-centered small-centered text-center"><a href="${pageContext.request.contextPath}/users/profile/${user.activationToken}" class="button small">View Profile</a>
                                        </p>
                                    </div>
                                </div>

                            </c:forEach>
                        </c:when>
                        <c:otherwise>No users found matching this name. Please try your search again.</c:otherwise>
                    </c:choose>
                </div>

            <!--/div-->

        </div>

    </div>


    <div id="registerModal" data-reveal="" class="reveal-modal large">
        <h2>Register</h2>
        <hr>
        <form id="registrationForm" data-abide="ajax">
            <div class="row">
                <div class="large-8 columns">
                    <div class="large-6 columns">
                        <label>First Name
                            <input type="text" name="firstName" placeholder="Enter your first name" required="" data-abide-validator="badWordsValidator">
                        </label><small class="error">First name cannot be empty.</small>
                    </div>
                    <div class="large-6 columns">
                        <label>Last Name
                            <input type="text" name="lastName" placeholder="Enter your last name" required="" data-abide-validator="badWordsValidator">
                        </label><small class="error">Last Name cannot be empty.</small>
                    </div>
                    <div class="large-12 columns">
                        <label>Email Address
                            <input type="email" name="email" placeholder="Enter a valid email address" required="" data-abide-validator="badWordsValidator">
                        </label><small class="error">An email address is required.</small>
                    </div>
                    <div class="large-6 columns">
                        <label>Choose a Password
                            <input type="password" name="password" placeholder="Choose a password" required="" id="password">
                        </label><small class="error">Password Cannot be empty.</small>
                    </div>
                    <div class="large-6 columns">
                        <label>Confirm Password
                            <input type="password" name="confirmPassword" placeholder="Re-type password" required="" data-equalto="password">
                        </label><small class="error">Passwords Do Not Match.</small>
                    </div>
                    <div class="large-12 columns text-center">
                        <input type="submit" value="Register" class="button">
                    </div>
                    <hr class="show-for-medium-down">
                </div>
                <div class="large-4 columns text-center">
                    <br>
                    <div class="large-6 medium-6 small-6 columns">
                        <a href="/users/auth/facebook">
                            <div class="button fi-social-facebook size-36"></div>
                        </a>
                    </div>
                    <div class="large-6 medium-6 small-6 columns">
                        <a href="/users/auth/twitter">
                            <div class="button fi-social-twitter size-36"></div>
                        </a>
                    </div>
                    <div class="large-6 medium-6 small-6 columns">
                        <a href="/users/auth/linkedin">
                            <div class="button fi-social-linkedin size-36"></div>
                        </a>
                    </div>
                    <div class="large-6 medium-6 small-6 columns">
                        <a href="/users/auth/google">
                            <div class="button fi-social-google-plus size-36"></div>
                        </a>
                    </div>
                </div>
            </div>
        </form><a class="close-reveal-modal">x</a>
    </div>
    <div id="loginModal" data-reveal="" class="reveal-modal large">
        <h2>Login</h2>
        <hr>
        <form id="loginForm" data-abide="ajax">
            <div class="row">
                <div class="large-8 columns">
                    <div class="large-12 columns">
                        <label>Email Address
                            <input type="text" name="username" placeholder="Enter your verified email address" required="" pattern="email">
                        </label><small class="error">Incorrect Email address entered.</small>
                    </div>
                    <div class="large-12 columns">
                        <label>Password
                            <input type="password" name="password" placeholder="Your password here" required="">
                        </label><small class="error">Password Cannot be empty.</small>
                    </div>
                    <div class="large-centered text-center">
                        <input type="submit" value="Login" class="button">
                    </div>
                </div>
                <div class="large-4 columns text-center">
                    <br class="show-for-medium-down">
                    <div class="large-6 medium-6 small-6 columns">
                        <a href="/users/auth/facebook">
                            <div class="button fi-social-facebook size-36"></div>
                        </a>
                    </div>
                    <div class="large-6 medium-6 small-6 columns">
                        <a href="/users/auth/twitter">
                            <div class="button fi-social-twitter size-36"></div>
                        </a>
                    </div>
                    <div class="large-6 medium-6 small-6 columns">
                        <a href="/users/auth/linkedin">
                            <div class="button fi-social-linkedin size-36"></div>
                        </a>
                    </div>
                    <div class="large-6 medium-6 small-6 columns">
                        <a href="/users/auth/google">
                            <div class="button fi-social-google-plus size-36"></div>
                        </a>
                    </div>
                </div>
            </div>
        </form><a class="close-reveal-modal">x</a>
    </div>
    <div id="contactModal" data-reveal="" class="reveal-modal large">
        <h2>Get in touch</h2>
        <hr>
        <form id="contactForm" data-abide="ajax">
            <div class="row">
                <div class="large-12 columns">
                    <label>Subject
                        <input type="text" name="subject" placeholder="What is this regarding" required="">
                    </label><small class="error">Subject Cannot be Empty.</small>
                </div>
                <div class="large-12 columns">
                    <label>Message
                        <textarea name="message" placeholder="Your message here" rows="7" required=""></textarea>
                    </label><small class="error">Message Cannot be empty.</small>
                </div>
                <div class="large-12 columns">
                    <label>Your Email
                        <input type="email" name="sendersEmailAddress" placeholder="Your email address here" required="" pattern="email">
                    </label><small class="error">Email Cannot be empty.</small>
                </div>
                <div class="large-12 columns text-center">
                    <input type="submit" value="Send Mail" class="button radius">
                </div>
            </div><a class="close-reveal-modal">x</a>
        </form>
    </div>
    <div id="hitMeUpModal" data-reveal="" class="reveal-modal large">
        <h2>Contact User</h2>
        <hr>
        <form id="hitMeUpForm" data-abide="ajax">
            <div class="row">
                <div class="large-12 columns">
                    <label>Subject
                        <input type="text" name="subject" placeholder="What is this regarding" required="">
                    </label><small class="error">Subject Cannot be Empty.</small>
                </div>
                <div class="large-12 columns">
                    <label>Message
                        <textarea name="message" placeholder="Your message here" rows="5" required=""></textarea>
                    </label><small class="error">Message Cannot be empty.</small>
                </div>
                <div class="large-12 columns">
                    <label>Your Email
                        <input type="email" name="sendersEmailAddress" placeholder="Your email address here" required="" pattern="email">
                    </label><small class="error">Email Cannot be empty.</small>
                </div>
                <div class="large-12 columns text-center">
                    <input type="submit" value="Send Mail" class="button radius">
                </div>
            </div><a class="close-reveal-modal">x</a>
        </form>
    </div>

    <div class="large-12">
        <jsp:include page="/footer"/>
    </div>

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/foundation/js/vendor/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/foundation/js/vendor/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/foundation/js/vendor/jquery.ui.touch-punch.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/foundation/js/foundation.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/foundation/js/vendor/stickyfooter.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascripts/header.js"></script>
    <script type="text/javascript">
        $(window).resize(function(){
            var remainingSpace = $(window).width() -322;
            console.log(remainingSpace);
            if($(window).width() < 1026 ){
                $("#contentShow").width(100+"%");
                $("#contentShowChild").width(100+"%");
            }else{
                $("#contentShow").width(remainingSpace+"px");
                $("#contentShowChild").width(1200+"px");
            }
        });
        $(document).ready(function(){
            var remainingSpace = $(window).width() -322;
            console.log(remainingSpace);
            if($(window).width() < 1026 ){
                $("#contentShow").width(100+"%");
                $("#contentShowChild").width(100+"%");
            }else{
                $("#contentShow").width(remainingSpace+"px");
                $("#contentShowChild").width(1200+"px");
            }
        });
    </script>
</body>

</html>