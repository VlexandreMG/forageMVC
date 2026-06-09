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

                .toolbar {
                    margin-bottom: 22px;
                    display: flex;
                    flex-wrap: wrap;
                    gap: 10px;
                }

                .btn-top,
                .link-devis {
                    text-decoration: none;
                    padding: 11px 16px;
                    border-radius: 999px;
                    font-size: 0.84rem;
                    font-weight: 700;
                    letter-spacing: 0.06em;
                    text-transform: uppercase;
                    transition: transform 0.18s ease, background-color 0.18s ease, color 0.18s ease;
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
                    transform: translateY(-1px);
                    background-color: var(--text);
                    color: var(--surface);
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

                .action-links {
                    display: flex;
                    gap: 10px;
                    align-items: center;
                    flex-wrap: wrap;
                }

                .btn-icon {
                    text-decoration: none;
                    font-size: 1rem;
                    width: 38px;
                    height: 38px;
                    display: inline-flex;
                    align-items: center;
                    justify-content: center;
                    border-radius: 12px;
                    transition: background-color 0.18s ease, color 0.18s ease, transform 0.18s ease;
                    background: var(--surface);
                    color: var(--text);
                    border: 1px solid var(--text);
                }

                .btn-icon:hover {
                    background: var(--text);
                    color: var(--surface);
                    transform: translateY(-1px);
                }

                .link-update,
                .link-delete {
                    color: var(--text);
                    border-color: var(--text);
                }

                .link-devis {
                    font-size: 0.78rem;
                }

                .empty-msg {
                    text-align: center;
                    padding: 48px 24px;
                    color: var(--muted);
                    font-style: italic;
                    border: 1px dashed var(--border);
                    border-radius: 18px;
                    margin-top: 12px;
                    background: #fcfcfc;
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