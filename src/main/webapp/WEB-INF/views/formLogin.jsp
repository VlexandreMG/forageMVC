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
                    --bg: #f6f6f6;
                    --surface: #ffffff;
                    --text: #111111;
                    --muted: #6b6b6b;
                    --border: #dcdcdc;
                    --shadow: 0 24px 60px rgba(0, 0, 0, 0.12);
                }

                * {
                    box-sizing: border-box;
                }

                body {
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                    min-height: 100vh;
                    margin: 0;
                    color: var(--text);
                    display: grid;
                    place-items: center;
                    background:
                        radial-gradient(circle at top left, rgba(0, 0, 0, 0.95) 0 22%, transparent 22.5%),
                        linear-gradient(135deg, #111111 0 34%, #f6f6f6 34% 100%);
                    padding: 24px;
                }

                .login-container {
                    position: relative;
                    width: min(100%, 440px);
                    padding: 40px;
                    border: 1px solid var(--border);
                    border-radius: 24px;
                    background: rgba(255, 255, 255, 0.96);
                    box-shadow: var(--shadow);
                    overflow: hidden;
                    backdrop-filter: blur(8px);
                }

                .login-container::before {
                    content: '';
                    position: absolute;
                    inset: 0 auto auto 0;
                    width: 100%;
                    height: 8px;
                    background: linear-gradient(90deg, #111111 0 55%, #dcdcdc 55% 100%);
                }

                h1 {
                    margin: 12px 0 30px;
                    text-align: left;
                    font-size: 1.45rem;
                    font-weight: 800;
                    letter-spacing: 0.12em;
                    text-transform: uppercase;
                }

                .form-group {
                    margin-bottom: 18px;
                }

                label {
                    display: block;
                    margin-bottom: 8px;
                    font-size: 0.82rem;
                    font-weight: 700;
                    letter-spacing: 0.08em;
                    text-transform: uppercase;
                    color: var(--muted);
                }

                input[type="text"],
                input[type="password"] {
                    width: 100%;
                    padding: 14px 15px;
                    border: 1px solid var(--border);
                    border-radius: 14px;
                    background: #fafafa;
                    color: var(--text);
                    font-size: 0.98rem;
                    transition: transform 0.15s ease, border-color 0.15s ease, box-shadow 0.15s ease;
                    outline: none;
                }

                input[type="text"]:focus,
                input[type="password"]:focus {
                    border-color: var(--text);
                    box-shadow: 0 0 0 4px rgba(0, 0, 0, 0.08);
                    transform: translateY(-1px);
                }

                .error-message {
                    margin-bottom: 18px;
                    padding: 12px 14px;
                    border-radius: 12px;
                    background: #f3f3f3;
                    border: 1px solid var(--border);
                    color: var(--text);
                    font-size: 0.86rem;
                }

                input[type="submit"] {
                    width: 100%;
                    margin-top: 6px;
                    padding: 15px;
                    border: 1px solid var(--text);
                    border-radius: 14px;
                    background: var(--text);
                    color: var(--surface);
                    cursor: pointer;
                    font-size: 0.92rem;
                    font-weight: 800;
                    letter-spacing: 0.12em;
                    text-transform: uppercase;
                    transition: background-color 0.18s ease, color 0.18s ease, transform 0.18s ease;
                }

                input[type="submit"]:hover {
                    background: var(--surface);
                    color: var(--text);
                    transform: translateY(-1px);
                }

                .footer-text {
                    margin-top: 22px;
                    text-align: center;
                    font-size: 0.78rem;
                    letter-spacing: 0.08em;
                    text-transform: uppercase;
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