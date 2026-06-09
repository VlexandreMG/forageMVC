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
                    --gris-fonce: #4A4A4A;
                    --gris-moyen: #8C8C8C;
                    --gris-clair: #F5F5F5;
                    --beige: #D9D2C5;
                    --beige-clair: #F2EDE4;
                    --blanc: #FFFFFF;

                    /* Couleurs vives demandées */
                    --bleu-vif: #007bff;
                    --rouge-vif: #dc3545;
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

                .toolbar {
                    margin-bottom: 25px;
                    display: flex;
                    gap: 15px;
                }

                .btn-top {
                    text-decoration: none;
                    padding: 10px 20px;
                    border-radius: 6px;
                    font-size: 0.9rem;
                    font-weight: 600;
                    transition: all 0.3s ease;
                    display: flex;
                    align-items: center;
                    gap: 8px;
                }

                .btn-add {
                    background-color: var(--beige);
                    color: var(--gris-fonce);
                }

                .btn-view {
                    background-color: var(--gris-fonce);
                    color: var(--blanc);
                }

                .btn-top:hover {
                    opacity: 0.8;
                    transform: translateY(-1px);
                }

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

                .statut-badge {
                    padding: 5px 12px;
                    border-radius: 20px;
                    font-size: 0.75rem;
                    font-weight: bold;
                    background-color: rgb(169, 246, 169);
                    color: var(--gris-fonce);
                    border: 1px solid var(--beige);
                }

                /* --- Zone Icônes Bleu et Rouge --- */
                .action-links {
                    display: flex;
                    gap: 12px;
                    align-items: center;
                }

                .btn-icon {
                    text-decoration: none;
                    font-size: 1.1rem;
                    width: 36px;
                    height: 36px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    border-radius: 8px;
                    transition: all 0.2s ease;
                    background: #fff;
                    border: 1px solid #eee;
                }

                /* MODIFIER : VRAI BLEU */
                .link-update {
                    color: var(--bleu-vif);
                    border-color: rgba(0, 123, 255, 0.2);
                }

                .link-update:hover {
                    background: var(--bleu-vif);
                    color: white;
                    box-shadow: 0 4px 10px rgba(0, 123, 255, 0.3);
                }

                /* SUPPRIMER : VRAI ROUGE */
                .link-delete {
                    color: var(--rouge-vif);
                    border-color: rgba(220, 53, 69, 0.2);
                }

                .link-delete:hover {
                    background: var(--rouge-vif);
                    color: white;
                    box-shadow: 0 4px 10px rgba(220, 53, 69, 0.3);
                }

                .link-devis {
                    text-decoration: none;
                    font-size: 0.8rem;
                    padding: 8px 14px;
                    border-radius: 6px;
                    background: var(--beige-clair);
                    color: var(--gris-fonce);
                    font-weight: 600;
                    border: 1px solid var(--beige);
                    transition: 0.2s;
                }

                .link-devis:hover {
                    background: #dad4cb;
                }

                .empty-msg {
                    text-align: center;
                    padding: 40px;
                    color: var(--gris-moyen);
                    font-style: italic;
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
                                            <a href="http://localhost/listeAlerte.php?idDemande=${d.id}">
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