<%--
  Created by IntelliJ IDEA.
  User: Rahul
  Date: 29/03/15
  Time: 10:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="top-bar show-for-large-up" data-topbar role="navigation">
    <ul class="title-area">
        <li class="name">
            <h1><a href="${pageContext.request.contextPath}/">My Site</a></h1>
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

            <li> <a href="#" data-reveal-id="hitMeUpModal"> Hit John Up </a> </li>

            <li class="has-dropdown">
                <a href="#">Menu</a>
                <ul class="dropdown">
                    <li><a href="${pageContext.request.contextPath}/myaccount"> My Account </a></li>
                    <li><a href="#"> Privacy </a> </li>
                    <li><a href="#"> Help </a> </li>
                    <li><a href="#" data-reveal-id="reportAProblem"> Report A problem  </a> </li>
                    <li><a href="${pageContext.request.contextPath}/logout"> Sign Out  </a> </li>
                </ul>
            </li>

        </ul>

        <!-- Left Nav Section -->
        <ul class="left">
            <li><a href="${pageContext.request.contextPath}/welcome"> My Feed </a></li>
            <li><a href="${pageContext.request.contextPath}/users/profile"> My Resi </a></li>
            <li><a href="#"> Shoutouts </a></li>
            <!--li><a href="#"> Logout </a></li-->
        </ul>
    </section>
</nav>

<div class="large-12 show-for-medium-down">

    <div class="icon-bar five-up " style="background-color: #274C77">
        <a class="item" href="${pageContext.request.contextPath}/" style="background-color: #274C77; padding-bottom: 15px ">
            <br/><p style="font-size:1.1rem; color: #fffffc">MyResi</p>
        </a>
        <a class="item" href="${pageContext.request.contextPath}/welcome" style="background-color: #274C77">
            <i class="fi-mail"></i><label>Myfeed</label>
        </a>
        <a class="item" href="${pageContext.request.contextPath}/users/profile" style="background-color: #274C77">
            <i class="fi-info"></i><label>My Resi</label>
        </a>
        <a class="item" style="background-color: #274C77; padding: 1.25rem 0 1.25rem 0">
            <i class="fi-mail"></i><label>Shoutouts</label>
        </a>
        <a class="item" href="${pageContext.request.contextPath}/logout" style="background-color: #274C77">
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
            <ul id="drop1" data-dropdown-content class="f-dropdown mega content panel" aria-hidden="true" style="border:1px solid #d8d8d8">
                <li style="border-bottom: 1px solid #d8d8d8"><a href="${pageContext.request.contextPath}/myaccount">My Account</a></li>
                <li style="border-bottom: 1px solid #d8d8d8"><a href="#">Privacy</a></li>
                <li style="border-bottom: 1px solid #d8d8d8"><a href="#">Help</a></li>
                <li style="border-bottom: 1px solid #d8d8d8"><a href="#" data-reveal-id="reportAProblem">Report a Problem</a></li>
            </ul>
        </div>
    </div>

    <div class="large-centered" style="margin-top:20px; ">

        <!--div class="medium-3 small-5 columns" >
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
        </div-->

    </div>

</div>







