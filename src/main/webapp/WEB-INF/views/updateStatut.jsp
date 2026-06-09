<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="fr">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Modification d'un statut</title>
            <!-- Font Awesome pour les icônes -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap"
                rel="stylesheet">
            <style>
                :root {
                    --gris-fonce: #4A4A4A;
                    --gris-moyen: #8C8C8C;
                    --gris-clair: #F5F5F5;
                    --beige: #D9D2C5;
                    --beige-clair: #F2EDE4;
                    --blanc: #FFFFFF;
                    --rouge-action: #c0392b;
                    --vert-action: #a3b18a;
                }

                body {
                    font-family: 'Inter', sans-serif;
                    background-color: var(--gris-clair);
                    color: var(--gris-fonce);
                    margin: 0;
                    padding: 40px 20px;
                }

                .container {
                    max-width: 1100px;
                    margin: 0 auto;
                    background: var(--blanc);
                    padding: 35px;
                    border-radius: 12px;
                    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
                }

                h1 {
                    font-weight: 300;
                    text-transform: uppercase;
                    letter-spacing: 2px;
                    margin-top: 0;
                    margin-bottom: 30px;
                    border-bottom: 2px solid var(--beige-clair);
                    padding-bottom: 15px;
                }

                h3 {
                    font-weight: 600;
                    text-transform: uppercase;
                    font-size: 0.9rem;
                    letter-spacing: 1px;
                    margin-top: 0;
                    color: var(--gris-moyen);
                }

                /* Organisation Section Supérieure (Gauche / Droite) */
                .top-section {
                    display: grid;
                    grid-template-columns: 1fr 1fr;
                    gap: 40px;
                    margin-bottom: 40px;
                }

                .form-group {
                    margin-bottom: 20px;
                }

                label {
                    display: block;
                    font-weight: 600;
                    margin-bottom: 8px;
                    font-size: 0.9rem;
                }

                select,
                input {
                    width: 100%;
                    padding: 12px;
                    border: 1px solid var(--beige);
                    border-radius: 6px;
                    background-color: var(--blanc);
                    font-family: 'Inter', sans-serif;
                    font-size: 0.95rem;
                    box-sizing: border-box;
                    outline: none;
                    transition: border-color 0.2s;
                }

                select:focus,
                input:focus {
                    border-color: var(--gris-fonce);
                }

                /* Panneau de détails à droite */
                .details-panel {
                    background-color: #fcfbf9;
                    border: 1px solid var(--beige-clair);
                    border-radius: 8px;
                    padding: 20px;
                    display: none;
                }

                .details-grid {
                    display: grid;
                    grid-template-columns: max-content 1fr;
                    gap: 10px 20px;
                    font-size: 0.95rem;
                }

                .details-label {
                    font-weight: 600;
                    color: var(--gris-moyen);
                }

                /* Section Sous-Devis en Lignes Épurées */
                .section-title {
                    font-size: 1.1rem;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    margin-top: 30px;
                    margin-bottom: 15px;
                    color: var(--gris-fonce);
                }

                .ligne {
                    display: grid;
                    grid-template-columns: 3fr 1fr 1.5fr 1.5fr max-content;
                    gap: 15px;
                    align-items: flex-end;
                    margin-bottom: 15px;
                    background: #fff;
                    padding: 5px 0;
                }

                input[readonly] {
                    background-color: var(--gris-clair);
                    border-color: var(--beige-clair);
                    font-weight: 600;
                }

                /* Boutons */
                .btn {
                    padding: 12px 20px;
                    border-radius: 6px;
                    font-weight: 600;
                    cursor: pointer;
                    display: inline-flex;
                    align-items: center;
                    gap: 8px;
                    border: none;
                    transition: all 0.2s ease;
                    font-size: 0.9rem;
                    text-decoration: none;
                }

                .btn-add {
                    background-color: var(--blanc);
                    color: var(--gris-fonce);
                    border: 1px solid var(--beige);
                    margin-top: 10px;
                }

                .btn-add:hover {
                    background-color: var(--beige-clair);
                }

                .btn-delete {
                    background-color: transparent;
                    color: var(--rouge-action);
                    border: 1px solid #f9d5d1;
                    padding: 12px;
                    border-radius: 6px;
                }

                .btn-delete:hover {
                    background-color: var(--rouge-action);
                    color: white;
                    border-color: var(--rouge-action);
                }

                .btn-submit {
                    background-color: var(--gris-fonce);
                    color: var(--blanc);
                    padding: 14px 30px;
                    font-size: 1rem;
                    letter-spacing: 1px;
                    text-transform: uppercase;
                }

                .btn-submit:hover {
                    background-color: #333333;
                    transform: translateY(-1px);
                }

                /* Barre de Total globale */
                .total-box {
                    display: flex;
                    justify-content: flex-end;
                    align-items: center;
                    gap: 20px;
                    margin-top: 30px;
                    padding: 20px 0;
                    border-top: 2px solid var(--beige-clair);
                    font-size: 1.1rem;
                }

                #total {
                    font-size: 1.5rem;
                    font-weight: 700;
                    color: var(--gris-fonce);
                }
            </style>
        </head>

        <body>

            <div class="container">
                <h1>Modifier un statut</h1>

                <form action="${pageContext.request.contextPath}${createForm ? '/statut/update' : '/statut/edit'}"
                    method="post">

                    <!-- Section supérieure ordonnée -->
                    <div class="top-section">
                        <!-- Bloc de sélection à gauche -->
                        <div>
                            <div class="form-group">
                                <label for="idDemande">Demande correspondante</label>
                                <select name="demande.id" id="idDemande" ${!createForm ? 'disabled' : ''}>
                                    <option value="">-- Choisir une demande --</option>
                                    <c:forEach var="demande" items="${demandes}">
                                        <option value="${demande.id}" ${!createForm &&
                                            demande.id == demandeStatut.demande.id ? 'selected' : '' }>
                                            Numéro : ${demande.id}
                                        </option>
                                    </c:forEach>
                                </select> 
                                <c:if test="${!createForm}">
                                    <input type="hidden" name="demande.id" value="${demandeStatut.demande.id}">
                                </c:if>
                            </div>
                        </div>

                        <!-- Panneau de détails à droite -->
                        <div id="detailsDemande" class="details-panel">
                            <h3> Détails de la demande</h3>
                            <div class="details-grid">
                                <span class="details-label">ID Demande :</span><span id="id"></span>
                                <span class="details-label">Client :</span><span id="client"></span>
                                <span class="details-label">Statut Actuel :</span><span id="statut"></span>
                                <span class="details-label">Date Statut :</span><span id="date"></span>
                                <span class="details-label">Commune :</span><span id="commune"></span>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div class="form-group">
                            <label for="idStatut">Statut</label>
                            <select name="statut.id" id="idStatut" ${!createForm ? 'disabled' : ''}>
                                <option value="">-- Choisir un statut --</option>
                                <c:forEach var="statut" items="${statuts}">
                                    <option value="${statut.id}" ${!createForm && statut.id == demandeStatut.statut.id
                                        ? 'selected' : '' }>
                                        ${statut.libelle}</option>
                                </c:forEach>
                            </select>
                            <c:if test="${!createForm}">
                                <input type="hidden" name="statut.id" value="${demandeStatut.statut.id}">
                            </c:if>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Date</label>
                        <input type="datetime-local" name="date" value="${!createForm ? dateFormatee : '' }">
                    </div>

                    <div class="form-group full-width">
                        <label>Observation</label>
                        <textarea name="observation" rows="3" ${!createForm ? 'readonly' : ''}>${!createForm ? demandeStatut.observation : ''}</textarea>
                    </div>

                    <c:if test="${!createForm}">
                        <input type="hidden" name="id" value="${demandeStatut.id}">
                    </c:if>

                    <div style="margin-top: 40px; text-align: center;">
                        <button type="submit" class="btn btn-submit">
                            Modifier le statut
                        </button>
                    </div>
                </form>
            </div>

            <script>
                const selectDemande = document.getElementById("idDemande");

                selectDemande.addEventListener("blur", chargerDemande);

                function chargerDemande() {
                    let id = selectDemande.value;
                    let panelDetails = document.getElementById("detailsDemande");

                    if (id == "") {
                        panelDetails.style.display = "none";
                        selectType.innerHTML = '<option value="">-- En attente de la demande --</option>';
                        return;
                    }

                    fetch("${pageContext.request.contextPath}/demande/detailsTypeDevis/" + id)
                        .then(response => response.json())
                        .then(data => {
                            panelDetails.style.display = "block";

                            document.getElementById("id").textContent = data.id;
                            document.getElementById("client").textContent = data.client;
                            document.getElementById("statut").textContent = data.statutActuel;
                            document.getElementById("date").textContent = data.date;
                            document.getElementById("commune").textContent = data.commune;
                        })
                        .catch(error => {
                            console.error("Erreur lors du chargement :", error);
                        });
                }

                window.onload = function () {
                    if (document.getElementById("idDemande").value !== '') {
                        chargerDemande();
                    }
                }
            </script>

        </body>

        </html>