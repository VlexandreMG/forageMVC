<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="fr">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Connexion | Administration</title>
            <style>
                :root {
                    --bg: #f4f4f4;
                    --surface: #ffffff;
                    --text: #111111;
                    --muted: #666666;
                    --border: #d9d9d9;
                    --shadow: 0 12px 30px rgba(0, 0, 0, 0.06);
                }

                body {
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                    background-color: var(--bg);
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    min-height: 100vh;
                    margin: 0;
                    color: var(--text);
                }

                .login-container {
                    background-color: var(--surface);
                    padding: 40px;
                    border-radius: 14px;
                    box-shadow: var(--shadow);
                    width: calc(100% - 32px);
                    max-width: 400px;
                    border: 1px solid var(--border);
                }

                h1 {
                    text-align: center;
                    color: var(--text);
                    font-weight: 700;
                    margin-bottom: 28px;
                    letter-spacing: 1px;
                    text-transform: uppercase;
                    font-size: 1.2rem;
                }

                .form-group {
                    margin-bottom: 20px;
                }

                label {
                    display: block;
                    margin-bottom: 8px;
                    font-size: 0.9rem;
                    font-weight: 600;
                    color: var(--muted);
                }

                input[type="text"],
                input[type="password"] {
                    width: 100%;
                    padding: 12px 14px;
                    border: 1px solid var(--border);
                    border-radius: 8px;
                    box-sizing: border-box;
                    background-color: #ffffff;
                    color: var(--text);
                    transition: border-color 0.2s ease, box-shadow 0.2s ease;
                    outline: none;
                }

                input[type="text"]:focus,
                input[type="password"]:focus {
                    border-color: var(--text);
                    box-shadow: 0 0 0 3px rgba(0, 0, 0, 0.08);
                }

                .error-message {
                    background-color: #f7f7f7;
                    color: var(--text);
                    padding: 12px;
                    border-radius: 8px;
                    font-size: 0.85rem;
                    margin-bottom: 20px;
                    text-align: center;
                    border: 1px solid var(--border);
                }

                input[type="submit"] {
                    width: 100%;
                    padding: 14px;
                    background-color: var(--text);
                    color: var(--surface);
                    border: 1px solid var(--text);
                    border-radius: 8px;
                    cursor: pointer;
                    font-size: 0.95rem;
                    font-weight: 700;
                    letter-spacing: 0.5px;
                    transition: background-color 0.2s ease, color 0.2s ease;
                }

                input[type="submit"]:hover {
                    background-color: var(--surface);
                    color: var(--text);
                }

                .footer-text {
                    text-align: center;
                    margin-top: 20px;
                    font-size: 0.8rem;
                    color: var(--muted);
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