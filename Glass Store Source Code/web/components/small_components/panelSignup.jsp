<%-- 
    Document   : panelSignup
    Created on : Sep 30, 2022, 5:01:21 PM
    Author     : Admin
--%>
<div class="login-form">
    <form action="signup" id="sign-up-form" method="post">
        <h1 class="h3 my-5 font-weight-normal text-center"> Sign up</h1>
        <input name="user" id="user" type="text" id="user-name" class="form-control my-4" placeholder="Username" required="" autofocus="">
        <input name="email" id="email" type="email" id="email" class="form-control my-4" placeholder="Email" required autofocus="">
        <input name="pass" id="pass" type="password" id="user-pass" class="form-control my-4" placeholder="Password" required autofocus="">
        <input name="repass" id="repass" type="password" id="user-repeatpass" class="form-control my-4" placeholder="Repeat Password" required autofocus="">
        <div class="form-group">
            <label class="form-check-label">
                <input id="check" type="checkbox" required="required"> I accept the 
                <a href="https://policies.google.com/terms?gl=VN&hl=vi" class="secondary-text-color">Terms &amp; Conditions</a>
            </label>
        </div>
        <button class="btn btn-success btn-block portal-button w-100" type="submit"><i class="fas fa-user-plus"></i> Sign Up</button>
    </form>
    <form class="fixed-bottom position-absolute my-3" style="bottom:0" action="signup" id="sign-up-form" method="post">
        <button id="btn-signup" type="submit" value="login" name="buttonType">
            <a id="cancel_signup secondary-text-color"><i class="fas fa-angle-left"></i> Back</a>
        </button>
    </form>
</div>