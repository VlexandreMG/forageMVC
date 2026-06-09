<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="fr">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Liste des devis</title>
            <!-- Font Awesome pour la cohérence -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
            <style>
                :root {
                    --bg: #f5f5f5;
                    --surface: #ffffff;
                    --text: #111111;
                    --muted: #6a6a6a;
                    --border: #dedede;
                    --shadow: 0 22px 52px rgba(0, 0, 0, 0.10);
                }

                * {
                    box-sizing: border-box;
                }

                body {
                    font-family: 'Segoe UI', Tahoma, sans-serif;
                    min-height: 100vh;
                    margin: 0;
                    padding: 36px 20px;
                    color: var(--text);
                    background:
                        linear-gradient(180deg, #111111 0 150px, transparent 150px 100%),
                        radial-gradient(circle at right 15% top 5%, rgba(0, 0, 0, 0.08), transparent 26%),
                        var(--bg);
                }

                .container {
                    width: min(100%, 1220px);
                    margin: 0 auto;
                    padding: 28px;
                    border-radius: 28px;
                    border: 1px solid var(--border);
                    background: rgba(255, 255, 255, 0.96);
                    box-shadow: var(--shadow);
                    backdrop-filter: blur(8px);
                }

                h1 {
                    margin: 0 0 24px;
                    padding-bottom: 18px;
                    border-bottom: 1px solid var(--border);
                    font-size: clamp(1.4rem, 2vw, 2rem);
                    font-weight: 800;
                    letter-spacing: -0.04em;
                    text-transform: none;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-top: 12px;
                    overflow: hidden;
                    border-radius: 20px;
                }

                thead {
                    background-color: var(--text);
                    color: var(--surface);
                }

                th {
                    padding: 16px 14px;
                    text-align: left;
                    font-weight: 800;
                    font-size: 0.78rem;
                    text-transform: uppercase;
                    letter-spacing: 0.12em;
                }

                td {
                    padding: 16px 14px;
                    border-bottom: 1px solid var(--border);
                    font-size: 0.94rem;
                    vertical-align: top;
                }

                tbody tr:hover {
                    background-color: #fafafa;
                }

                .statut-badge {
                    padding: 5px 12px;
                    border-radius: 999px;
                    font-size: 0.75rem;
                    font-weight: 800;
                    background-color: #f2f2f2;
                    color: var(--text);
                    border: 1px solid var(--border);
                }

                .link-details,
                tbody td a {
                    text-decoration: none;
                    font-size: 0.78rem;
                    padding: 9px 14px;
                    border-radius: 999px;
                    background: var(--surface);
                    color: var(--text);
                    font-weight: 800;
                    letter-spacing: 0.06em;
                    text-transform: uppercase;
                    border: 1px solid var(--text);
                    transition: background-color 0.18s ease, color 0.18s ease, transform 0.18s ease;
                    display: inline-flex;
                    align-items: center;
                    margin-right: 8px;
                    margin-bottom: 8px;
                }

                .link-details:hover,
                tbody td a:hover {
                    background: var(--text);
                    color: var(--surface);
                    transform: translateY(-1px);
                }

                .ref-demande {
                    color: var(--muted);
                    font-weight: 700;
                    font-family: monospace;
                    background: #f5f5f5;
                    padding: 4px 9px;
                    border-radius: 999px;
                    border: 1px solid var(--border);
                }
            </style>
        </head>

        <body>

            <div class="container">
                <h1>Liste des devis</h1>

                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Réf Demande</th>
                            <th>Statut</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="d" items="${devis}">
                            <tr>
                                <td><strong>#${d.id}</strong></td>
                                <td><span class="ref-demande">Req-${d.demande.id}</span></td>
                                <td>
                                    <span class="statut-badge">
                                        ${d.demande.currentStatut.statut.libelle}
                                    </span>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/devis/details/${d.id}"
                                        class="link-details">
                                        <i class="fa-solid fa-eye" style="margin-right: 5px;"></i> Détails
                                    </a>
                                    <a href=""> Accepter</a>
                                    <a href="">Refuser</a>
                                    <a href="${pageContext.request.contextPath}/devis/showFormEdit/${d.id}">Modifier</a>

                                </td>

                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

        </body>

        </html>