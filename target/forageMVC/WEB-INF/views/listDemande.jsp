<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="fr">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Gestion des Demandes</title>
            <!-- Font Awesome pour les icônes -->
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

                .toolbar {
                    margin-bottom: 24px;
                    display: flex;
                    flex-wrap: wrap;
                    gap: 12px;
                }

                .btn-top,
                .link-devis {
                    text-decoration: none;
                    padding: 10px 16px;
                    border-radius: 8px;
                    font-size: 0.88rem;
                    font-weight: 600;
                    transition: background-color 0.2s ease, color 0.2s ease, border-color 0.2s ease;
                    display: inline-flex;
                    align-items: center;
                    gap: 8px;
                    border: 1px solid var(--text);
                    background: var(--surface);
                    color: var(--text);
                }

                .btn-view {
                    background-color: var(--text);
                    color: var(--surface);
                }

                .btn-top:hover,
                .link-devis:hover {
                    background-color: var(--text);
                    color: var(--surface);
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

                .action-links {
                    display: flex;
                    gap: 10px;
                    align-items: center;
                    flex-wrap: wrap;
                }

                .btn-icon {
                    text-decoration: none;
                    font-size: 1rem;
                    width: 36px;
                    height: 36px;
                    display: inline-flex;
                    align-items: center;
                    justify-content: center;
                    border-radius: 8px;
                    transition: background-color 0.2s ease, color 0.2s ease, border-color 0.2s ease;
                    background: var(--surface);
                    color: var(--text);
                    border: 1px solid var(--text);
                }

                .btn-icon:hover {
                    background: var(--text);
                    color: var(--surface);
                }

                .link-update,
                .link-delete {
                    color: var(--text);
                    border-color: var(--text);
                }

                .link-devis {
                    font-size: 0.82rem;
                }

                .empty-msg {
                    text-align: center;
                    padding: 40px;
                    color: var(--muted);
                    font-style: italic;
                    border: 1px dashed var(--border);
                    border-radius: 12px;
                    margin-top: 10px;
                }
            </style>
        </head>

        <body>

            <div class="container">
                <h1>Liste des demandes</h1>

                <div class="toolbar">
                    <a href="${pageContext.request.contextPath}/demande/form" class="btn-top btn-add">
                        <i class="fa-solid fa-plus"></i> Ajouter une demande
                    </a>
                    <a href="${pageContext.request.contextPath}/devis/formDevis" class="link-devis">
                        Faire un devis
                    </a>
                    <a href="${pageContext.request.contextPath}/formUpdateStatut" class="link-devis">
                        Modifier un statut
                    </a>
                    <a href="${pageContext.request.contextPath}/devis/listDevis" class="btn-top btn-view">
                        <i class="fa-solid fa-list"></i>Liste des devis
                    </a>
                    <a href="${pageContext.request.contextPath}/statut/listStatut" class="btn-top btn-view">
                        <i class="fa-solid fa-list"></i>Liste des statuts
                    </a>
                </div>

                <c:choose>
                    <c:when test="${not empty demandes}">
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Client</th>
                                    <th>Commune</th>
                                    <th>Lieu</th>
                                    <th>Observation</th>
                                    <th>Statut</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="d" items="${demandes}">
                                    <tr>
                                        <td><strong>#${d.id}</strong></td>
                                        <td>${d.client.nom}</td>
                                        <td>${d.commune.libelle}</td>
                                        <td>${d.lieu}</td>
                                        <td><small>${d.currentStatut.observation}</small></td>
                                        <td>
                                            <span class="statut-badge">
                                                ${d.currentStatut.statut.libelle}
                                            </span>
                                        </td>
                                        <td class="action-links">
                                            <!-- Icône Modifier (Bleu) -->
                                            <a href="${pageContext.request.contextPath}/demande/formUpdate/${d.id}"
                                                class="btn-icon link-update" title="Modifier">
                                                <i class="fa-solid fa-pen-to-square"></i>
                                            </a>

                                            <!-- Icône Supprimer (Rouge) -->
                                            <a href="${pageContext.request.contextPath}/demande/delete/${d.id}"
                                                class="btn-icon link-delete" title="Supprimer"
                                                onclick="return confirm('Supprimer définitivement cette demande ?')">
                                                <i class="fa-solid fa-trash-can"></i>
                                            </a>
                                            <a href="http://localhost/listeAlerte.php?idDemande=${d.id}" class="link-devis">
                                                Alertes
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div class="empty-msg">Aucune demande enregistrée pour le moment.</div>
                    </c:otherwise>
                </c:choose>
            </div>

        </body>

        </html>