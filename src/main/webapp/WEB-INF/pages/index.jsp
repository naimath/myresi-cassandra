<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/vendor/foundation/css/normalize.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/vendor/foundation/css/foundation.min.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/vendor/foundation/css/foundation-icons.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" >
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/foundation/js/vendor/modernizr.js"></script>
</head>
<body style="height:100%">
<nav data-topbar="" role="navigation" class="top-bar">
        <ul class="title-area">
            <li class="name">
                <h1><a href="/">My Resi</a></h1>
            </li>
            <!-- Remove the class "menu-icon" to get rid of menu icon. Take out "Menu" to just have icon alone-->
            <li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a>
            </li>
        </ul>
        <section class="top-bar-section">
            <!-- Right Nav Section-->
            <ul class="right">
                <!--li.has-formform#userSearch(action='/users/search', method='GET')
    div.row.collapse.medium-uncollapse
        div.large-8.small-8.medium-8.columns
            input(type='text', placeholder='Search users', name='usersearchterm')
        div.large-4.small-4.medium-4.columns
            input(type='submit', value='Search').button-->
                <li class="has-dropdown not-click"><a href="#">Help</a>
                    <ul class="dropdown">
                        <li class="title back js-generated">
                            <h5><a href="javascript:void(0)">Back</a></h5>
                        </li>
                        <li class="parent-link show-for-small"><a class="parent-link js-generated" href="#">Help</a>
                        </li>
                        <li><a href="#">Disclaimer / Privacy Policy</a>
                        </li>
                        <li><a href="#">How To / FAQ</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Left Nav Section-->
            <ul class="left">
                <li><a href="#" data-reveal-id="registerModal">Register</a>
                </li>
                <li><a href="#" data-reveal-id="loginModal">Login</a>
                </li>
                <li><a href="#">About Us</a>
                </li>
                <li><a href="#" data-reveal-id="contactModal">Contact Us</a>
                </li>
            </ul>
        </section>
    </nav>
    <div class="row">
        <div class="large-centered text-center">
            <div class="large-12 columns"><img src="${pageContext.request.contextPath}/resources/images/glass.png" width="200" height="200">
            </div>
            <h1> Making Every Skill Count</h1>
        </div>
        <hr>
        <div class="large-12 small-12 columns">
            <h2>Welcome to myResi</h2>
            <p>We are on a mission to change the resume as you know it. Today's world relies on quick information that can be analyzed and used in an instant. Job seekers, recruiters and employers need every tool at their disposal to make good decisions, quickly. Together, we strive to create a community to help place potential employees globally in companies around the world.</p>
        </div>
        <div class="large-centered"></div>
        <hr>
        <div class="large-4 columns text-center">
            <div style="color:#666EC5;" class="fi-layout size-72"></div>
            <h3> Designed to help</h3>
            <p> MyResi is being designed from the ground up with the purpose of helping to make great matches that lead to great employment.</p>
        </div>
        <div class="large-4 columns text-center">
            <div style="color:#666EC5;" class="fi-pencil size-72"></div>
            <h3>Easy to use</h3>
            <p> Our goal is to make the job search easy. MyResi is an innovative tool that will help make the connections you need.</p>
        </div>
        <div class="large-4 columns text-center">
            <div style="color:#666EC5;" class="fi-like size-72"></div>
            <h3> Trusted products</h3>
            <p> MyResi will use modern software and trusted platforms to deliver a secure and intuitive experience.</p>
        </div>
    </div>
    <div id="registerModal" data-reveal="" class="reveal-modal large">
        <h2>Register</h2>
        <hr>
        <form id="registrationForm" data-abide="ajax" novalidate="novalidate">
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
        <form id="loginForm" data-abide="ajax" novalidate="novalidate">
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
        <form id="contactForm" data-abide="ajax" novalidate="novalidate">
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
        <form id="hitMeUpForm" data-abide="ajax" novalidate="novalidate">
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
    <footer style="margin-top:0px;">
        <div class="large-text-center small-text-center medium-text-center">
            <p>
                <a href="https://www.facebook.com/myresi" target="_blank" class="fi-social-facebook size-36"></a>
            </p>
            <p>
                <a href="https://twitter.com/MyResiApp" target="_blank" class="fi-social-twitter size-36"></a>
            </p>
            <p>
                <a href="https://plus.google.com/104915935073099587267/about" target="_blank" class="fi-social-google-plus size-36"></a>
            </p>
            <p>
                <a href="https://www.linkedin.com/company/myresi" target="_blank" class="fi-social-linkedin size-36"></a>
            </p>
            <div class="large-text-center small-text-center medium-text-center">
                <p>&copy; 2014 MyResi.com All rights reserved.</p>
            </div>
        </div>
	</footer>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/foundation/js/vendor/jquery.js"  ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/foundation/js/foundation.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/foundation/js/vendor/stickyfooter.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascripts/header.js"></script>
<script>
    $(document).foundation();
  </script>
</body>
</html>
