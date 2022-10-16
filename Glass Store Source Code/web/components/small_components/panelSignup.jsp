<%-- 
    Document   : panelSignup
    Created on : Sep 30, 2022, 5:01:21 PM
    Author     : Admin
--%>
<head>
    <title>Signup - Glass Store</title>
</head>
<body>
    <div class="login-form">
        <form action="signup" id="sign-up-form" method="post">
            <h1 class="h3 my-5 font-weight-normal text-center"> Sign up</h1>
            <p class="text-danger">${mess}</p>
            <input name="user" id="user" type="text" class="form-control my-4" placeholder="Username" required="" autofocus="" value="${user}" onkeypress="return event.charCode !== 32">
            <input name="email" id="email" type="email" class="form-control my-4" placeholder="Email" required autofocus="" value="${email}" onkeypress="return event.charCode !== 32">
            <input name="pass" id="pass" type="password" class="form-control my-4" placeholder="Password" required autofocus="" value="${pass}" onkeypress="return event.charCode !== 32">
            <input name="repass" id="repass" type="password" class="form-control my-4" placeholder="Repeat Password" required autofocus="" value="${repass}" onkeypress="return event.charCode !== 32">
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
</body>