<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.UserBean"%>
<% 
    // Controllo se l'utente è già autenticato, in tal caso lo reindirizzo alla home
    if (session.getAttribute("registeredUser") != null) {
        response.sendRedirect("index.jsp");
        return; // Esco dalla pagina per evitare il rendering del form di login
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./css/loginpage.css">
<link rel="icon" href="./img/icon.png">
<title>Geek Factory - Login</title>	
</head>
<body>
<div class="container">
    <div class="forms-container">
        <div class="signin-signup">
            <form action="Login" method="POST" class="signi-in-form">
                <h2 class="title">Hai già un account?</h2>
                <div class="input-field">
                    <i class="fas fa-user"></i>
                    <input type="email" name="j_email" maxlength="50" placeholder="E-mail" required autofocus/>
                </div>
                <div class="input-field">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="j_password" maxlength="50" placeholder="Password" required/> 
                </div>
                <div>
                    <% 
                        // Controllo se è stato settato un messaggio di errore
                        String loginError = (String) session.getAttribute("login-error");
                        if (loginError != null && !loginError.isEmpty()) {
                    %>
                    <h4 style="color: red"><%= loginError %></h4>
                    <% } %>
                </div>
                <input type="submit" value="Accedi" class="btn solid"/>
            </form>
        </div>
    </div>
</div>
<div class="panels-container">
    <div class="panel left-panel">
        <div class="content">
            <h3 style="margin-bottom: 20px">Crea il tuo account</h3>
            <button class="btn transparent" id="sign-up-btn" onclick="location.href = 'register-form.jsp';">
                Registrati
            </button>
        </div>
    </div>
</div>
</body>
</html>
