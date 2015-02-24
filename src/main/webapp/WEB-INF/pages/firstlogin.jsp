<!DOCTYPE html>
<html lang="en" class="no-js">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>myResi | Lets get started</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/foundation/css/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/foundation/css/foundation.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/foundation/css/foundation-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/selectize/css/selectize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/selectize/css/selectize.default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/foundation-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/foundation/js/vendor/modernizr.js"></script>
</head>

<body>
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
                <li class="has-dropdown"><a href="#">Help</a>
                    <ul class="dropdown">
                        <li><a href="#">Disclaimer / Privacy Policy</a>
                        </li>
                        <li><a href="#">How To / FAQ’s</a>
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
        <div id="firstModal" data-reveal="" data-options="close_on_background_click:false" class="reveal-modal">
            <h1>Welcome to Myresi</h1><sub>Step 1 of 4</sub>
            <hr>
            <h4>We just need some information from you, press next to get started!!</h4>
            <div class="large-12 columns">
                <form id="saveemail" data-abide="ajax">
                    <div class="large-12 columns">
                        <label>Email address
                            <input type="email" id="enterEmail" name="enterEmail" placeholder="Enter email address" required="">
                        </label><small class="error">Email cannot be empty</small>
                    </div>
                    <div class="large-12 columns">
                        <label>Confirm Email Address
                            <input type="email" name="confirmEmail" placeholder="Confirm Email Address" required="" data-equalto="enterEmail">
                        </label><small class="error">Email does not match</small>
                    </div>
                    <div class="large-12 columns text-center">
                        <input type="submit" value="Update" class="button">
                    </div>
                    <hr>
                </form>
                <div id="resultEmail"></div><a href="#" data-reveal-id="secondModal" class="secondary button right">Next</a>
            </div>
        </div>
        <div id="secondModal" data-reveal="" data-options="close_on_background_click:false" class="reveal-modal">
            <form id="editProfile" data-abide="ajax">
                <h4>Personal Info</h4><sub>Step 2 of 4</sub>
                <hr>
                <div class="large-12 columns">
                    <div id="profileImage" style="background-image:url(/images/avatar.png/); position:relative;overflow:hidden" class="large-centered">
                        <div id="profileImageOverlay"></div>
                        <input id="imageUploder" type="file" name="imageUploder" accept="image/*" style="position:absolute; left:-999;" class="show-for-medium-down">
                    </div>
                    <div class="large-6 columns">
                        <label>First Name
                            <input type="text" name="firstName" placeholder="Enter your first name" required="">
                        </label>
                    </div>
                    <div class="large-6 columns">
                        <label>Last Name
                            <input type="text" name="lastName" placeholder="Enter your last name" required="">
                        </label>
                    </div>
                    <div style="border-left:1px solid #ddd" class="large-centered">
                        <div class="large-12 columns">
                            <label>About Me
                                <textarea rows="1" name="aboutMe" maxlength="250" placeholder="Write something about yourself, no more than 250 characters." style="resize:none;"></textarea>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="large-12 columns">
                    <h5 style="padding-left:0.9375rem">Address</h5>
                    <br>
                    <div class="large-6 columns">
                        <label>City
                            <input type="text" name="city" placeholder="City" required="">
                        </label>
                    </div>
                    <div class="large-6 columns">
                        <label>State
                            <input type="text" name="state" placeholder="State" required="">
                        </label>
                    </div>
                    <div class="large-6 columns">
                        <label>Country
                            <input type="text" name="country" placeholder="Country" required="">
                        </label>
                    </div>
                    <div class="text-center large-12 columns">
                        <input type="submit" value="Update Profile" class="button">
                    </div>
                </div>
                <hr>
                <div id="result2" class="large-12 columns text-center"></div>
            </form>
            <div class="large-12 columns"></div>
            <br>
            <div class="large-12 columns">
                <div class="large-6 medium-3 small-3 columns"><a href="#" data-reveal-id="firstModal" class="secondary button">Back</a>
                </div>
                <div class="large-6 medium-3 small-3 columns"><a href="#" data-reveal-id="thirdModal" class="secondary button right">Next</a>
                </div>
            </div>
        </div>
        <div id="thirdModal" data-reveal="" data-options="close_on_background_click:false" class="reveal-modal">
            <h4>Work Details</h4><sub>Step 3 of 4</sub>
            <hr>
            <form id="workDetails" data-abide="ajax">
                <div class="large-12 columns">
                    <div class="large-6 columns">
                        <label>Positions
                            <input type="text" name="position" placeholder="CEO an Lorem Ipsum" required="">
                        </label><small class="error">Cannot Be empty</small>
                    </div>
                    <div class="large-6 columns">
                        <label>Current Workplace
                            <input type="text" name="currentWorkplace" placeholder="Information Technology And Services" required="">
                        </label><small class="error">Cannot Be empty</small>
                    </div>
                </div>
                <div class="large-12 columns">
                    <div class="large-6 columns">
                        <label>Field of Work
                            <input type="text" name="workField" placeholder="E.g:RnD, Management" required="" class="right">
                        </label><small class="error">Cannot Be empty</small>
                    </div>
                    <div class="large-6 columns">
                        <label>Educational Qualification
                            <input type="text" name="educationalQualification" placeholder="Degree in Randomness" required="" class="right">
                        </label><small class="error">Cannot Be empty</small>
                    </div>
                </div>
                <div class="large-12 columns text-center">
                    <input type="submit" value="Save" style="margin-bottom:10px !important;" class="button">
                </div>
                <hr>
                <div id="result" class="large-12 columns text-center"></div>
            </form>
            <div class="large-12 columns">
                <div class="large-6 medium-3 small-3 columns"><a href="#" data-reveal-id="secondModal" class="secondary button">Back</a>
                </div>
                <div class="large-6 medium-3 small-3 columns"><a href="#" data-reveal-id="fourthModal" class="secondary button right">Next</a>
                </div>
            </div>
        </div>
        <div id="fourthModal" data-reveal="" data-options="close_on_background_click:false" class="reveal-modal">
            <h4>Skills</h4><sub>Step 4 of 4</sub>
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
                            <input type="text" name="expertSkills" id="expertSkills" placeholder="Select Your skills by typing the name">
                            <!--small.error Cannot be Empty-->
                        </div>
                        <div class="large-3 columns">
                            <label>Intermediate Skills</label>
                        </div>
                        <div class="large-9 columns">
                            <input type="text" name="intermediateSkills" id="intermediateSkills" placeholder="Select Your skills by typing the name">
                            <!--small.error Cannot be Empty-->
                        </div>
                        <div class="large-3 columns">
                            <label>Familiar Skills</label>
                        </div>
                        <div class="large-9 columns">
                            <input type="text" name="familiarSkills" id="familiarSkills" placeholder="Select Your skills by typing the name">
                            <!--small.error Cannot be Empty-->
                        </div>
                        <div style="margin-bottom:10px;" class="large-12 columns text-center">
                            <input type="submit" value="Update Skills" class="button">
                        </div>
                    </div>
                    <div class="linked-inButton large-12 columns text-center">
                        <hr>
                        <h3>Or import from Linked-in</h3>
                    </div>
                    <div class="linked-inButton large-12 columns text-center"><a href="#" onclick="onLinkedInLoad()" data-reveal-id="linkedInWizard1" class="secondary button">Import From Linked-in</a>
                    </div>
                    <hr>
                    <div id="result1" class="large-12 columns text-center"></div>
                </form>
            </p>
            <div class="large-12 columns">
                <div class="large-6 medium-3 small-3 columns"><a href="#" data-reveal-id="thirdModal" class="secondary button">Back</a>
                </div>
                <div class="large-6 medium-3 small-3 columns"><a href="${pageContext.request.contextPath}/users/profile" class="primary button right">Done</a>
                </div>
            </div>
            <!--a.close-reveal-modal ×-->
        </div>
        <div id="linkedInWizard1" data-reveal="" class="reveal-modal">
            <h2>Choose Which skills to Import</h2><sub>1 of 2<hr><p id="skillContainer"></p><hr><div class="large-centered medium-centered small-centered"><p class="text-center"><a href="#" data-reveal-id="fourthModal" onclick="addLinkedinSkills()" class="secondary button center">Proceed</a></p></div></sub>
        </div>
        <div id="linkedInWizard2" data-reveal="" class="reveal-modal">
            <h2>Categorize Your Skills.</h2><sub>2 of 2</sub>
            <hr>
            <p>You can categorize your skills as based on how proficient you think you are in those.</p>
            <input id="importedSkills" type="text" value=""><a class="close-reveal-modal">&times;</a>
        </div>
    </div>
    <script type="text/javascript" src="https://platform.linkedin.com/in.js">
        api_key: 75 rmn6s0ittiqp
        authorize: true
    </script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascripts/linkedinwizard.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/foundation/js/vendor/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/foundation/js/vendor/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/foundation/js/vendor/jquery.ui.touch-punch.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/foundation/js/foundation.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/selectize/js/selectize.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascripts/firstlogin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascripts/skills2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascripts/foundation-datepicker.js"></script>
</body>

</html>