<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="fr">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Connexion | Administration</title>
            <style>
                /* Palette de couleurs : Gris (#4A4A4A, #F5F5F5) et Beige (#D9D2C5, #F2EDE4) */
                body {
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                    background-color: #f5f5f5;
                    /* Gris très clair */
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    height: 100vh;
                    margin: 0;
                    color: #4A4A4A;
                }

                .login-container {
                    background-color: #ffffff;
                    padding: 40px;
                    border-radius: 12px;
                    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
                    width: 100%;
                    max-width: 400px;
                    border: 1px solid #e0e0e0;
                }

                h1 {
                    text-align: center;
                    color: #4A4A4A;
                    font-weight: 300;
                    margin-bottom: 30px;
                    letter-spacing: 2px;
                    text-transform: uppercase;
                }

                .form-group {
                    margin-bottom: 20px;
                }

                label {
                    display: block;
                    margin-bottom: 8px;
                    font-size: 0.9rem;
                    font-weight: 600;
                    color: #8c8c8c;
                }

                input[type="text"],
                input[type="password"] {
                    width: 100%;
                    padding: 12px;
                    border: 2px solid #f2ede4;
                    /* Beige clair */
                    border-radius: 6px;
                    box-sizing: border-box;
                    background-color: #fcfbf9;
                    transition: border-color 0.3s ease;
                    outline: none;
                }

                input[type="text"]:focus,
                input[type="password"]:focus {
                    border-color: #d9d2c5;
                    /* Beige foncé */
                }

                .error-message {
                    background-color: #fff0f0;
                    color: #c0392b;
                    padding: 10px;
                    border-radius: 4px;
                    font-size: 0.85rem;
                    margin-bottom: 20px;
                    text-align: center;
                    border-left: 4px solid #c0392b;
                }

                input[type="submit"] {
                    width: 100%;
                    padding: 14px;
                    background-color: #d9d2c5;
                    /* Beige bouton */
                    color: #4A4A4A;
                    border: none;
                    border-radius: 6px;
                    cursor: pointer;
                    font-size: 1rem;
                    font-weight: bold;
                    transition: all 0.3s ease;
                }

                input[type="submit"]:hover {
                   background-color: #cac6bd;
                    /* Gris foncé au survol */
                      color: #4A4A4A;
                }

                .footer-text {
                    text-align: center;
                    margin-top: 20px;
                    font-size: 0.8rem;
                    color: #bdc3c7;
                }
            </style>
        </head>

        <body>

            <div class="login-container">
                <h1>Login</h1>

                <form action="${pageContext.request.contextPath}/connexion" method="post">

                    <!-- message d'erreur -->
                    <c:if test="${not empty error}">
                        <div class="error-message">
                            ${error}
                        </div>
                    </c:if>

                    <div class="form-group">
                        <label for="nom">Nom d'utilisateur</label>
                        <input type="text" id="nom" name="nom" value="admin" placeholder="Ex: Jean Dupont">
                    </div>

                    <div class="form-group">
                        <label for="password">Mot de passe</label>
                        <input type="password" id="password" name="password" value="admin123">
                    </div>

                    <input type="submit" value="SE CONNECTER">

                </form>

                <div class="footer-text">
                    &copy; 2026 - Forage
                </div>
            </div>

        </body>

        </html>