<%-- 
    Document   : portal
    Created on : Sep 28, 2022, 9:00:30 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
    <body>
        <div class="container">
            <div class="row" >
                <div class="col-md-1"></div>
                <div class="col-md-5" style="margin: 0px; -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3); float: right; background-color: white; opacity: 100%">
                    <img style="height: 585px; width: 375px; opacity: 100%" src="image/Login.gif" alt=""/>
                </div>
                <div class="col-md-5" id="logreg-forms" style="background-image: linear-gradient(to bottom right, #c165dd, #268bff); margin: 0px; -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3); opacity: 100%">
                    <form class="form-signin" id="login-form" action="login" method="post">
                        <br><br><br><br>
                        <h1 class="h3 mb-3 font-weight-normal" style="text-align: center; font-family: Brush Script Std"> Sign in</h1>
                        <p class="text-danger">${mess}</p>
                        <input style="margin-bottom: 8px; border-radius: 8px" name="user" value="${username}" type="text" id="user" class="form-control" placeholder="Username" required="" autofocus="">
                        <input style="margin-bottom: 8px; border-radius: 8px" name="pass" value="${password}" type="password" id="password" class="form-control" placeholder="Password" required="">

                        <div class="form-group form-check">

                            <ul>
                                <li style="display: inline-block;">
                                    <input name="remember" value="1" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1" style="margin: auto; ; display: inline-block">Remember me</label>
                                </li>
                                <li style="display: inline-block; margin: 5px 30px"></li>
                                <li style="display: inline-block">
                                    <a href="ForgetPass.jsp" style="color: #000; text-align: center" style="margin: auto; display: inline-block"><i class="fa fa-lock-alt" style="color: black"></i>Forget Password</a>
                                </li>
                            </ul>
                        </div>
                        <!-- For fb login -->
                        <input type="text" id="email" name="email" style="display: none;">
                        <input type="text" id="loginFB" name="loginFB" value="false" style="display: none;">

                        <div class="form-group">            
                            <button class="btn btn-success btn-block" id="btnSubmit" type="submit" style="background-image: linear-gradient(to right, #00f79c, #04f1f5); color: black; width: 200px; margin: auto; padding: 10px; border-radius: 8px"><i class="fas fa-sign-in-alt"></i> Sign in</button>
                            <hr>
                            <button class="btn btn-primary btn-block" type="button" style="background-image: linear-gradient(to right, #00f79c, #04f1f5); color: black; width: 200px; margin: auto; padding: 10px; border-radius: 8px" id="btn-signup"><i class="fas fa-user-plus"></i> Sign up</button>
                        </div>
                    </form>
                    <form action="signup" id="sign-up-form" method="post" class="form-signup">
                        <br><br><br><br>
                        <h1 class="h3 mb-3 font-weight-normal" style="text-align: center; font-family: Brush Script Std"> Sign up</h1>
                        <input name="user" id="user" type="text" id="user-name" class="form-control" placeholder="User name" required="" autofocus="" style="margin-bottom: 8px; border-radius: 8px">
                        <input name="email" id="email" type="email" id="email" class="form-control" placeholder="Email" required autofocus="" style="margin-bottom: 8px; border-radius: 8px">
                        <input name="pass" id="pass" type="password" id="user-pass" class="form-control" placeholder="Passwords" required autofocus="" style="margin-bottom: 8px; border-radius: 8px">
                        <input type="text" id="loginFB" name="loginFB" value="false" style="display: none;">
                        <input name="repass" id="repass" type="password" id="user-repeatpass" class="form-control" placeholder="Repeat Password" required autofocus="" style="margin-bottom: 8px; border-radius: 8px">
                        <div class="form-group">
                            <label class="form-check-label"><input id="check" type="checkbox" required="required"> I accept the <a href="https://policies.google.com/terms?gl=VN&hl=vi" style="display: inline; color: #434e65">Terms &amp; Conditions</a></label>
                        </div>

                        <button class="btn btn-primary btn-block" type="submit" style="background-image: linear-gradient(to right, #00f79c, #04f1f5); color: black; width: 200px; margin: auto; padding: 10px; border-radius: 8px"><i class="fas fa-user-plus"></i> Sign Up</button>
                        <a href="#" id="cancel_signup" style="color: #434e65"><i class="fas fa-angle-left"></i> Back</a>
                    </form>
                    <br>
                    <fb:login-button style="margin-left:45%;" scope="public_profile,email" onlogin="checkLoginState();">
                    </fb:login-button>
                    <div id="status">
                    </div>

                    <div class="row">
                        <br><br>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
