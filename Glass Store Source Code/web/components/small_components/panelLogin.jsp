<%-- 
    Document   : panelLogin
    Created on : Sep 30, 2022, 4:58:53 PM
    Author     : Admin
--%>
<form class="form-signin" id="login-form" action="/login" method="post">
    <br><br><br><br>
    <h1 class="h3 mb-3 font-weight-normal" style="text-align: center; font-family: Brush Script Std"> Sign in</h1>
    <p class="text-danger">${mess}</p>
    <input style="margin-bottom: 8px; border-radius: 8px" name="user" value="${username}" type="text" id="user" class="form-control" placeholder="Username" autofocus="">
    <input style="margin-bottom: 8px; border-radius: 8px" name="pass" value="${password}" type="password" id="password" class="form-control" placeholder="Password" >

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
        <button class="btn btn-success btn-block portal-button" id="btnSubmit" type="submit" value="login" name="buttonType">
            <i class="fas fa-sign-in-alt"></i> Sign in
        </button>
        <hr>
        <button class="btn btn-primary btn-block portal-button" id="btn-signup" type="submit" value="signup" name="buttonType">
            <i class="fas fa-user-plus"></i> Sign up
        </button>
    </div>
</form>