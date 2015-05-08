<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en" class="no-js">
<%
    response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0");
    response.addHeader("Pragma", "no-cache");
    response.addDateHeader ("Expires", 0);

%>

<head>
    <meta charset="utf-8">
    <!-- If you delete this meta tag World War Z will become a reality -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyResi | Profile</title>
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

<div class="large-12">
    <jsp:include page="/loggedinheader"/>
</div>

<div class="row fullWidth">

    <div id="sidebar" style="width: 320px;">
        <jsp:include page="/sidebar"/>
    </div>

    <div id="contentShow" style="display: inline-block; background-color:#fffffc;">

        <div id="contentShowChild" style="margin:5% auto 0 auto; background-color: #FFFFFC" >

            <div class="row">

                <div class="large-12 columns">
                    <h1>My Account</h1>
                </div>
                <hr/>

                <div class="large-12 columns panel ">
                    <h3>Account Status</h3>
                    <div class="large-1 columns">
                        <fieldset class="switch" tabindex="0">
                            <input id="exampleCheckboxSwitch4" checked type="checkbox">
                            <label for="exampleCheckboxSwitch4"></label>
                        </fieldset>
                    </div>
                    <div class="large-11 columns inline" style="padding-top: 1.35rem">
                        Your account is currently Active.
                    </div>
                </div>

                <div class="large-12 columns panel ">

                    <h3>Change Password</h3>

                    <div class="large-5 medium-12 columns">
                        <label>
                            New Password
                            <input type="password" name="newPassword"/>
                        </label>
                    </div>

                    <div class="large-5 medium-12 columns">
                        <label>
                            Confirm New Password
                            <input type="password" name="confirmNewPassword"/>
                        </label>
                    </div>

                    <div class="large-2 medium-12 columns" style="padding-top: 1rem">
                        <input type="submit" class="button radius small expand" value="Change Password"/>
                    </div>

                    <div class="large-12 columns">
                        <p><a href="#">Or Click here to Send a change password request to Email</a> </p>
                    </div>

                </div>

                <div class="large-12 columns panel">
                    <h3>Change My Profile URL</h3>
                    <sub>Note: Changing your profile URL may break links you may have shared earlier.</sub>
                    <div class="row" style="padding-top:20px">
                        <div class="large-12 columns">
                            <div class="row collapse">
                                <div class="small-10 columns">
                                    <input type="text" placeholder="Name here" value="https://myre.si/johndoe1631">
                                </div>
                                <div class="small-2 columns">
                                    <a href="#" class="button postfix radius">Change</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="large-12 columns panel">
                    <h3>Add Email</h3>
                        Add an Alternate Email
                        <div class="row" style="padding-top:20px">
                            <div class="large-12 columns">
                                <div class="row collapse">
                                    <div class="small-10 columns">
                                        <input type="text" placeholder="Type a new email address that you want to add.">
                                    </div>
                                    <div class="small-2 columns">
                                        <a href="#" class="button postfix radius">Add Email</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    <h3>Edit Email</h3>
                    <label>
                        Edit Current Email
                        <div class="row" style="padding-top:20px">
                            <div class="large-12 columns">
                                <div class="row collapse">
                                    <div class="small-10 columns">
                                        <input type="email" placeholder="Name here" value="john@doe.com">
                                    </div>
                                    <div class="small-2 columns">
                                        <a href="#" class="button postfix radius">Update Email</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </label>
                </div>

            </div>


            <div id="secondModal" data-reveal="" class="reveal-modal xlarge" style="top: 0">
                <div id="profileImagePopup" style="background-image:url(${pageContext.request.contextPath}/users/image)" class="large-centered">
                    <div id="profileImageOverlay"></div>
                </div>
                <div class="large-12 columns text-center">
                    <form  id="imageUpload" method="POST"  enctype="multipart/form-data" data-abide="ajax">
                        <input type="file" name="file" style="width: 150px" accept="image/*">
                        <input type="submit" value="Upload" >
                    </form>
                </div>
                <form id="editProfileInfo" data-abide="ajax">
                    <h4>Personal Info</h4>
                    <hr>
                    <div class="large-12 columns">

                        <div class="large-6 columns">
                            <label>First Name
                                <input type="text" name="firstName" placeholder="Enter your first name" required="" value="${user.firstName}">
                            </label>
                        </div>
                        <div class="large-6 columns">
                            <label>Last Name
                                <input type="text" name="lastName" placeholder="Enter your last name" required="" value="${user.lastName}">
                            </label>
                        </div>
                        <div style="border-left:1px solid #ddd" class="large-centered">
                            <div class="large-12 columns">
                                <label>About Me
                                    <textarea rows="1" name="aboutMe" maxlength="250" placeholder="Write something about yourself, no more than 250 characters." style="resize:none;" >${user.aboutMe}</textarea>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="large-12 columns">
                        <div class="large-6 columns">
                            <label>City
                                <input type="text" name="city" placeholder="City" required="" value="${user.city}">
                            </label>
                        </div>
                        <div class="large-6 columns">
                            <label>State
                                <input type="text" name="state" placeholder="State" required="" value="${user.state}">
                            </label>
                        </div>
                        <div class="large-6 columns">
                            <label>Country
                                <input type="text" name="country" placeholder="Country" required="" value="${user.country}">
                            </label>
                        </div>
                        <div class="large-6 columns">
                            <label>Date Of birth
                                <input id="dp-margin" class="span2" type="text" name="dateOfBirth" placeholder="mm/dd/yyyy" data-date-format="mm/dd/yyyy" required="" value="${user.dateOfBirth}"/>
                            </label>
                        </div>
                        <div class="large-12 columns" style="padding-left: 0;padding-right: 0;">
                            <div class="large-6 columns">
                                <label>Positions
                                    <input type="text" name="position" placeholder="CEO an Lorem Ipsum" required="" value="${user.position}">
                                </label><small class="error">Cannot Be empty</small>
                            </div>
                            <div class="large-6 columns">
                                <label>Current Workplace
                                    <input type="text" name="currentWorkplace" placeholder="Information Technology And Services" required="" value="${user.currentWorkplace}">
                                </label><small class="error">Cannot Be empty</small>
                            </div>
                        </div>
                        <div class="large-12 columns" style="padding-left: 0;padding-right: 0;">
                            <div class="large-6 columns">
                                <label>Field of Work
                                    <input type="text" name="workField" placeholder="E.g:RnD, Management" required="" class="right" value="${user.workField}">
                                </label><small class="error">Cannot Be empty</small>
                            </div>
                            <div class="large-6 columns">
                                <label>Educational Qualification
                                    <input type="text" name="educationalQualification" placeholder="Degree in Randomness" required="" class="right" value="${user.educationalQualification}">
                                </label><small class="error">Cannot Be empty</small>
                            </div>
                        </div>
                        <div class="large-12 columns">
                            <label> Chenge Email Address
                                <input type="email" name="otherEmail" placeholder="Enter different email address if you don't want to use the current one." value="${user.email}"/>
                            </label>
                        </div>
                        <div class="text-center large-12 columns">
                            <input type="submit" value="Update" class="button">
                        </div>
                    </div>
                    <div id="result2" class="large-12 columns text-center"></div>
                </form>
                <a class="close-reveal-modal">x</a>
            </div>
            <div id="fourthModal" data-reveal="" class="reveal-modal">
                <h4>Edit Skills</h4>
                <hr>
                <p class="large-12 columns">
                <h4 class="text-center">Edit Skills</h4>
                <br>
                <form id="editSkills" data-abide="ajax">
                    <div class="large-12 columns">
                        <div class="large-3 columns">
                            <label>Expert Skills</label>
                        </div>
                        <div class="large-9 columns">
                            <input type="text" name="expertSkills" id="expertSkills" placeholder="Select Your skills by typing the name"  value="${user.expertSkills}" required="" class="skillsInput">
                        </div>
                        <div class="large-3 columns">
                            <label>Intermediate Skills</label>
                        </div>
                        <div class="large-9 columns">
                            <input type="text"  name="intermediateSkills" id="intermediateSkills" placeholder="Select Your skills by typing the name" value="${user.intermediateSkills}" required="" class="skillsInput">
                        </div>
                        <div class="large-3 columns">
                            <label>Familiar Skills</label>
                        </div>
                        <div class="large-9 columns">
                            <input type="text"  name="familiarSkills" id="familiarSkills" placeholder="Select Your skills by typing the name" required="" value="${user.familiarSkills}" class="skillsInput">
                        </div>
                        <div style="margin-bottom:10px;" class="large-12 columns text-center">
                            <input type="submit" value="Update Skills" class="button">
                        </div>
                    </div>
                    <div id="result1" class="large-12 columns text-center"></div>
                </form>
                </p>
                <!--div.large-12.columnsdiv.large-6.medium-3.small-3.columns
            a.secondary.button(href='#', data-reveal-id='thirdModal') Back
        div.large-6.medium-3.small-3.columns
            a.primary.button.right(href='/users/profile') Done--><a class="close-reveal-modal">x</a>
                <div id="linkedInWizard1" data-reveal="" class="reveal-modal">
                    <h2>Choose Which skills to Import</h2><sub>1 of 2<hr><p id="skillContainer"></p><hr><div class="large-centered medium-centered small-centered"><p class="text-center"><a href="#" data-reveal-id="fourthModal" onclick="addLinkedinSkills()" class="secondary button center">Proceed</a></p></div></sub>
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
                        <div class="large-12 columns text-center">
                            <input type="submit" value="Send Mail" class="button radius">
                        </div>
                    </div><a class="close-reveal-modal">x</a>
                </form>
            </div>

        </div>

    </div>

</div>

<div class="large-12">
    <jsp:include page="/footer"/>
</div>


<div class="large-12">
    <jsp:include page="/lightboxes"/>
</div>



<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/foundation/js/vendor/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/foundation/js/vendor/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/foundation/js/vendor/jquery.ui.touch-punch.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/foundation/js/foundation.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/foundation/js/vendor/stickyfooter.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascripts/header.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/selectize/js/selectize.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascripts/linkedinwizard.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascripts/sortableskills.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascripts/profile.js"></script>
<script src="https://apis.google.com/js/client:platform.js" async defer></script>
<script>
    window.fbAsyncInit = function() {
        FB.init({
            appId: '944705395545844',
            xfbml: true,
            version: 'v2.1'
        });
    };
    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {
            return;
        }
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascripts/foundation-datepicker.js"></script>
<script type="text/javascript">
    $('#dp-margin').fdatepicker();
    $('.datepicker.datepicker-dropdown.dropdown-menu').css('width','250');
</script>
<script type="text/javascript">
    $(window).resize(function(){
        var remainingSpace = $(window).width() -322;
        console.log(remainingSpace);
        if($(window).width() < 1026 ){
            $("#contentShow").width(100+"%");
            $("#contentShowChild").width(100+"%");
        }else{
            $("#contentShow").width(remainingSpace+"px");
            $("#contentShowChild").width(1000+"px");
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
            $("#contentShowChild").width(1000+"px");
        }
    });
</script>
</body>

</html>