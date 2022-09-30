<%-- 
    Document   : panelSignup
    Created on : Sep 30, 2022, 5:01:21 PM
    Author     : Admin
--%>
<form action="signup" id="sign-up-form" method="post" class="login-form">
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