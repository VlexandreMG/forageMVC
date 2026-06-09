<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="fr">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Historiques statuts</title>
            <!-- Font Awesome pour la cohérence -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
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
                    color: var(--text);
                    margin: 0;
                    padding: 40px 20px;
                }

                .container {
                    max-width: 1100px;
                    margin: 0 auto;
                    background: var(--surface);
                    padding: 30px;
                    border-radius: 14px;
                    border: 1px solid var(--border);
                    box-shadow: var(--shadow);
                }

                h1 {
                    font-weight: 700;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    margin-bottom: 28px;
                    border-bottom: 1px solid var(--border);
                    padding-bottom: 14px;
                    font-size: 1.2rem;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-top: 10px;
                }

                thead {
                    background-color: var(--text);
                    color: var(--surface);
                }

                th {
                    padding: 15px;
                    text-align: left;
                    font-weight: 700;
                    font-size: 0.82rem;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                }

                td {
                    padding: 15px;
                    border-bottom: 1px solid var(--border);
                    font-size: 0.92rem;
                }

                tbody tr:hover {
                    background-color: #fafafa;
                }

                .statut-badge {
                    padding: 5px 12px;
                    border-radius: 999px;
                    font-size: 0.75rem;
                    font-weight: 700;
                    background-color: #f2f2f2;
                    color: var(--text);
                    border: 1px solid var(--border);
                }

                .link-details,
                tbody td a {
                    text-decoration: none;
                    font-size: 0.82rem;
                    padding: 8px 14px;
                    border-radius: 8px;
                    background: var(--surface);
                    color: var(--text);
                    font-weight: 600;
                    border: 1px solid var(--text);
                    transition: background-color 0.2s ease, color 0.2s ease;
                    display: inline-flex;
                    align-items: center;
                    margin-right: 8px;
                    margin-bottom: 8px;
                }

                .link-details:hover,
                tbody td a:hover {
                    background: var(--text);
                    color: var(--surface);
                }

                .ref-demande {
                    color: var(--muted);
                    font-weight: 600;
                    font-family: monospace;
                    background: #f5f5f5;
                    padding: 3px 8px;
                    border-radius: 6px;
                    border: 1px solid var(--border);
                }
            </style>
        </head>

        <body>

            <div class="container">
                <h1>Historiques statuts</h1>

                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Réf Demande</th>
                            <th>Date</th>
                            <th>Statut</th>
                            <th>DT</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="d" items="${demandeStatut}">
                            <tr>
                                <td><strong>#${d.id}</strong></td>
                                <td><span class="ref-demande">Req-${d.demande.id}</span></td>
                                <td><strong>${d.date}</strong></td>
                                <td>
                                    <span class="statut-badge">
                                        ${d.statut.libelle}
                                    </span>
                                </td>
                                <td><strong>${d.DT}</strong></td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/statut/showFormEdit/${d.id}">Modifier</a>
                                </td>

                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

        </body>

        </html>