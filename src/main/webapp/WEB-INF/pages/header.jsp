<nav data-topbar="" role="navigation" class="top-bar">

    <ul class="title-area">
        <li class="name">
            <h1><a href="${pageContext.request.contextPath}/">My Resi</a></h1>
        </li>
        <!-- Remove the class "menu-icon" to get rid of menu icon. Take out "Menu" to just have icon alone-->
        <li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a>
        </li>
    </ul>

    <section class="top-bar-section">
        <!-- Right Nav Section-->
        <ul class="right">
            <li class="has-form" style="padding-top:11px; padding-right: 0; text-align: right; color: #FFFFFC ">Sign In</li>
            <li class="has-form">
                <form id="loginForm" data-abide="ajax" novalidate="novalidate">
                    <ul>
                        <li class="has-form"><input type="email" name="username" placeholder="Email" required="" pattern="email"></li>
                        <li class="nav-divider"></li>
                        <li class="has-form"><input type="password" name="password" placeholder="Password" required=""></li>
                        <li class="nav-divider"></li>
                        <li class="has-form"><input type="submit" value="Login" class="button expand radius" style="padding: 0 1.5rem"></li>
                    </ul>
                    <!--div class="row collapse">
                        <div class="large-12 columns">
                            <div class="large-4 columns" style="padding-left: 0; padding-right: 0.5rem;">
                                <input type="text" name="username" placeholder="Enter your verified email address" required="" pattern="email">
                                <small class="error">Incorrect Email address entered.</small>
                            </div>
                            <div class="large-4 columns" style="padding-left: 0.5rem; padding-right: 0.5rem">
                                    <input type="password" name="password" placeholder="Your password here" required="">
                                    <small class="error">Password Cannot be empty.</small>
                            </div>
                            <div class="large-4 columns text-center" style="padding-right: 0; padding-left: 0.5rem">
                                <input type="submit" value="Login" class="button expand">
                            </div>
                        </div>
                    </div-->
                </form>
            </li>
        </ul>
        <!-- Left Nav  Section-->
        <ul class="left">
            <!--  li><a href="#" data-reveal-id="registerModal">Register</a>
            </li>
            <li><a href="#" data-reveal-id="loginModal">Login</a>
            </li>-->
        </ul>
    </section>

</nav>
    





