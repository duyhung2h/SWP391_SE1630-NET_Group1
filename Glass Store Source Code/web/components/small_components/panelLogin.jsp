<%-- 
    Document   : panelLogin
    Created on : Sep 30, 2022, 4:58:53 PM
    Author     : Admin
--%>
<head>
    <title>Login - Glass Store</title>
</head>
<body>
    <form class="form-signin" id="login-form" action="/login" method="post">
        <br><br><br><br>
        <h1 class="h3 mb-3 font-weight-normal text-center"> Sign in</h1>
        <p class="text-danger">${mess}</p>
        <input name="user" value="${username}" type="text" id="user" class="form-control" placeholder="Username" onkeypress="return event.charCode !== 32" autofocus="">
        <input name="pass" value="${password}" type="password" id="password" class="form-control" placeholder="Password" onkeypress="return event.charCode !== 32" >

        <div class="form-group">

            <ul>
                <li class="d-inline-block">
                    <input name="remember" value="1" type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label w-100" for="exampleCheck1">Remember me</label>
                </li>
                <li class="d-inline-block"></li>
                <li class="d-inline-block">
                </li>
            </ul>
        </div>

        <div class="form-group">            
            <button class="btn btn-success btn-block portal-button w-100" id="btnSubmit" type="submit" value="login" name="buttonType">
                <i class="fas fa-sign-in-alt"></i> Sign in
            </button>
            <hr>
            <div class="d-flex justify-content-center text-center">
                <div class="my-auto">
                    Don't have an account?
                </div>
                <button class="btn btn-primary btn-block portal-button" id="btn-signup" type="submit" value="signup" name="buttonType">
                    <i class="fas fa-user-plus"></i> Sign up
                </button>
            </div>
            <br>
            <div class="d-flex justify-content-center text-center ">
                <button class="secondary-text-color " type="submit" value="forgetpass" name="buttonType">
                    I forgot my password
                </button>
            </div>
        </div>
    </form>
</body>