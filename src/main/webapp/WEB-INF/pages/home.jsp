<%
	if("Y".equals(request.getAttribute("fail"))){
		out.print("{\"failed\":\" Login failed either wrong password or not active\"}");
		 return;
	}
	
%>

<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<!-- If you delete this meta tag World War Z will become a reality -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath}/resources/vendor/foundation/css/normalize.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/vendor/foundation/css/foundation.min.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/vendor/foundation/css/foundation-icons.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/app.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" >
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/foundation/js/vendor/modernizr.js"></script>
</head>
<body style="height:100%">

    <jsp:include page="/header"/>

    <!--div class="row">
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
    </div-->


    <div class="row">

        <br/>

        <h1 class="text-center">Myresi, Making Every Skill Count </h1>

        <hr/>

        <br/>

        <div class="large-6 columns">

            <!--iframe style="margin-top: 15px;" width="100%" height="280" src="https://www.youtube.com/embed/TmaOcPYCGMA" frameborder="0" allowfullscreen></iframe-->

            <div class="large-12 columns">
                <div class="large-1 medium-1 small-1 columns">
                    <div style="color:#666EC5; font-size: 2.75rem" class="fi-layout"></div>
                </div>
                <div class="large-11 medium-11 small-11 columns">
                    <h3 style="padding-top: 9px"> Designed to help</h3>
                </div>
                <hr/>
                <p> MyResi is being designed from the ground up with the purpose of helping to make great matches that lead to great employment.</p>

            </div>
            <div class="large-12 columns ">
                <div class="large-1 medium-1 small-1 columns">
                    <div style="color:#666EC5; font-size: 2.75rem" class="fi-pencil"></div>
                </div>
                <div class="large-11 medium-11 small-11 columns">
                    <h3 style="padding-top: 9px">Easy to use</h3>
                </div>
                <hr/>
                <p> Our goal is to make the job search easy. MyResi is an innovative tool that will help make the connections you need.</p>

            </div>
            <div class="large-12 columns ">
                <div class="large-1 medium-1 small-1 columns">
                    <div style="color:#666EC5; font-size: 2.75rem" class="fi-like size-72"></div>
                </div>
                <div class="large-11 medium-11 small-11 columns">
                    <h3 style="padding-top: 9px"> Trusted products</h3>
                </div>
                <hr/>
                <p> MyResi will use modern software and trusted platforms to deliver a secure and intuitive experience.</p>

            </div>


        </div>

        <hr class="show-for-medium-down"/>

        <div class="large-6 columns">

            <h3>Sign up</h3>

            <form id="registrationForm" data-abide="ajax" novalidate="novalidate">
                <div class="row">
                    <div class="large-12 columns">
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
                            <input type="submit" value="Sign up" class="button radius">
                        </div>
                        <hr class="show-for-medium-down">

                    </div>
                </div>
            </form>

            <div class="large-centered text-center">

                <p style="margin-bottom:0; display: inline-block ">Sign-up with Social Media:&nbsp;</p>

                <div class="divider show-for-small-down"></div>

                <a href="/users/auth/facebook">
                    <div class="fi-social-facebook size-36" style="display:inline-block"> </div>
                    Facebook
                </a>

                &nbsp;
                <div class="divider show-for-small-down"></div>

                <a href="/users/auth/facebook">
                    <div class="fi-social-google-plus size-36" style="display:inline-block"> </div>
                    Google +
                </a>

            </div>

        </div>

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
    <div id="forgetPasswordModal" data-reveal="" class="reveal-modal large">
        <h2>Forget Password</h2>
        <hr>
        <form id="forgetPasswordForm" data-abide="ajax" novalidate="novalidate">
            <div class="row">
                <div class="large-12 columns">
                    <label>Your Email
                        <input type="email" name="forgetPasswordEmailAddress" placeholder="Your email address here" required="" pattern="email">
                    </label><small class="error">Email Cannot be empty.</small>
                </div>
                <div class="large-12 columns text-center">
                    <input type="submit" value="Send Mail" class="button radius">
                </div>
            </div><a class="close-reveal-modal">x</a>
        </form>
    </div>
    <div id="forgetPasswordProcessModal" data-reveal="" class="reveal-modal large">
        <h2>Forget Password</h2>
        <hr>
        <form id="forgetPasswordProcessForm" data-abide="ajax" novalidate="novalidate">
            <div class="row">
                <div class="large-12 columns">
                    <label>New Password
				     	 <input type="password" name="newPassword" placeholder="Choose a password" required="" id="newPassword">
                    </label><small class="error">New Password Cannot be empty.</small>
                </div>
                 <div class="large-12 columns">
                    <label>Confirm Password
				        <input type="password" name="newPasswordConfirm" placeholder="Re-type password" required="" data-equalto="newPassword">
                        <input type="hidden" name="token" value="${token}">
                    </label><small class="error">Confirm Password Cannot be empty.</small>
                </div>
                <div class="large-12 columns text-center">
                    <input type="submit" value="Save" class="button radius">
                </div>
            </div><a class="close-reveal-modal">x</a>
        </form>
    </div>
      <div id="loggedInProcessModal" data-reveal="" class="reveal-modal large">
        <br/>
        <h3>You are not logged in. Please login or Register</h3>
        <hr>
          <a class="close-reveal-modal">x</a>
        </div>
    </div>

    <div class="large-12">
        <jsp:include page="/footer"/>
    </div>

<script>
  		var forgotPasswordShow="${forgotPassword}";
  		var isLoggedIn = "${userLoggedIn}";
  </script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/foundation/js/vendor/jquery.js"  ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/foundation/js/foundation.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/foundation/js/vendor/stickyfooter.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascripts/header.js"></script>
<script>
    $(document).foundation();
  </script>
</body>
</html>
