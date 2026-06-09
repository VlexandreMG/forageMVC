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
                    --gris-fonce: #4A4A4A;
                    --gris-moyen: #8C8C8C;
                    --gris-clair: #F5F5F5;
                    --beige: #D9D2C5;
                    --beige-clair: #F2EDE4;
                    --blanc: #FFFFFF;
                }

                body {
                    font-family: 'Inter', sans-serif;
                    background-color: var(--gris-clair);
                    color: var(--gris-fonce);
                    margin: 0;
                    padding: 40px;
                }

                .container {
                    max-width: 1100px;
                    margin: 0 auto;
                    background: var(--blanc);
                    padding: 30px;
                    border-radius: 12px;
                    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
                }

                h1 {
                    font-weight: 300;
                    text-transform: uppercase;
                    letter-spacing: 2px;
                    margin-bottom: 30px;
                    border-bottom: 2px solid var(--beige-clair);
                    padding-bottom: 15px;
                }

                /* Style du Tableau harmonisé */
                table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-top: 10px;
                }

                thead {
                    background-color: var(--gris-fonce);
                    color: var(--blanc);
                }

                th {
                    padding: 15px;
                    text-align: left;
                    font-weight: 600;
                    font-size: 0.85rem;
                    text-transform: uppercase;
                }

                td {
                    padding: 15px;
                    border-bottom: 1px solid var(--gris-clair);
                    font-size: 0.9rem;
                }

                tbody tr:hover {
                    background-color: #fcfbf9;
                }

                .statut-badge {
                    padding: 5px 12px;
                    border-radius: 20px;
                    font-size: 0.75rem;
                    font-weight: bold;
                    background-color: rgb(169, 246, 169);
                    color: var(--gris-fonce);
                    border: 1px solid #c8e6c9;
                }

                .link-details {
                    text-decoration: none;
                    font-size: 0.8rem;
                    padding: 8px 14px;
                    border-radius: 6px;
                    background: var(--beige-clair);
                    color: var(--gris-fonce);
                    font-weight: 600;
                    border: 1px solid var(--beige);
                    transition: 0.2s;
                    display: inline-block;
                }

                .link-details:hover {
                    background: #dad4cb;
                    transform: translateY(-1px);
                }

                .ref-demande {
                    color: var(--gris-moyen);
                    font-weight: 600;
                    font-family: monospace;
                    background: var(--gris-clair);
                    padding: 2px 6px;
                    border-radius: 4px;
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