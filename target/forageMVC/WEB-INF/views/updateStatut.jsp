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
                    padding: 32px 20px;
                    color: var(--text);
                    background:
                        linear-gradient(180deg, #111111 0 170px, transparent 170px 100%),
                        radial-gradient(circle at right 20% top 6%, rgba(0, 0, 0, 0.08), transparent 30%),
                        var(--bg);
                }

                .container {
                    width: min(100%, 1100px);
                    margin: 0 auto;
                    padding: 30px;
                    border-radius: 28px;
                    border: 1px solid var(--border);
                    background: rgba(255, 255, 255, 0.96);
                    box-shadow: var(--shadow);
                    backdrop-filter: blur(8px);
                }

                h1 {
                    margin-top: 0;
                    margin-bottom: 24px;
                    padding-bottom: 18px;
                    border-bottom: 1px solid var(--border);
                    font-size: clamp(1.4rem, 2vw, 2rem);
                    font-weight: 800;
                    letter-spacing: -0.04em;
                    text-transform: none;
                }

                h3 {
                    margin-top: 0;
                    font-weight: 800;
                    text-transform: none;
                    font-size: 1rem;
                    letter-spacing: -0.02em;
                    color: var(--text);
                }

                .top-section {
                    display: grid;
                    grid-template-columns: 1.05fr 0.95fr;
                    gap: 28px;
                    margin-bottom: 28px;
                }

                .top-section > div:first-child {
                    padding: 22px;
                    border-radius: 22px;
                    background: linear-gradient(180deg, #fafafa, #ffffff);
                    border: 1px solid var(--border);
                }

                .form-group {
                    margin-bottom: 20px;
                }

                label {
                    display: block;
                    margin-bottom: 8px;
                    font-size: 0.78rem;
                    font-weight: 700;
                    letter-spacing: 0.08em;
                    text-transform: uppercase;
                    color: var(--muted);
                }

                select,
                input,
                textarea {
                    width: 100%;
                    padding: 14px 15px;
                    border: 1px solid var(--border);
                    border-radius: 16px;
                    background: #fbfbfb;
                    color: var(--text);
                    font-size: 0.98rem;
                    transition: border-color 0.18s ease, transform 0.18s ease, box-shadow 0.18s ease;
                    outline: none;
                }

                select:focus,
                input:focus,
                textarea:focus {
                    border-color: var(--text);
                    box-shadow: 0 0 0 4px rgba(0, 0, 0, 0.07);
                    transform: translateY(-1px);
                }

                .details-panel {
                    background: linear-gradient(180deg, #111111 0 4px, #ffffff 4px 100%);
                    border: 1px solid var(--border);
                    border-radius: 22px;
                    padding: 22px;
                    display: none;
                    box-shadow: 0 14px 36px rgba(0, 0, 0, 0.06);
                }

                .details-grid {
                    display: grid;
                    grid-template-columns: max-content 1fr;
                    gap: 10px 18px;
                    font-size: 0.95rem;
                }

                .details-label {
                    font-weight: 700;
                    color: var(--muted);
                }

                .section-title {
                    font-size: 1rem;
                    text-transform: uppercase;
                    letter-spacing: 0.12em;
                    margin-top: 28px;
                    margin-bottom: 14px;
                    color: var(--text);
                }

                .ligne {
                    display: grid;
                    grid-template-columns: 3fr 1fr 1.5fr 1.5fr max-content;
                    gap: 15px;
                    align-items: flex-end;
                    margin-bottom: 14px;
                    background: var(--surface);
                    padding: 6px 0;
                }

                input[readonly] {
                    background-color: #f3f3f3;
                    border-color: var(--border);
                    font-weight: 600;
                }

                .btn {
                    padding: 12px 18px;
                    border-radius: 999px;
                    font-weight: 800;
                    cursor: pointer;
                    display: inline-flex;
                    align-items: center;
                    gap: 8px;
                    border: 1px solid var(--text);
                    transition: background-color 0.18s ease, color 0.18s ease, transform 0.18s ease;
                    font-size: 0.84rem;
                    text-decoration: none;
                    background-color: var(--surface);
                    color: var(--text);
                    letter-spacing: 0.08em;
                    text-transform: uppercase;
                }

                .btn-add {
                    margin-top: 10px;
                }

                .btn-add:hover,
                .btn-delete:hover,
                .btn-submit:hover {
                    background-color: var(--text);
                    color: var(--surface);
                    transform: translateY(-1px);
                }

                .btn-delete {
                    background-color: var(--surface);
                    color: var(--text);
                    padding: 12px;
                    border-radius: 14px;
                }

                .btn-submit {
                    padding: 14px 30px;
                    font-size: 0.92rem;
                }

                .total-box {
                    display: flex;
                    justify-content: flex-end;
                    align-items: center;
                    gap: 20px;
                    margin-top: 30px;
                    padding: 20px 0;
                    border-top: 1px solid var(--border);
                    font-size: 1.05rem;
                }

                #total {
                    font-size: 1.5rem;
                    font-weight: 800;
                    color: var(--text);
                }

                @media (max-width: 900px) {
                    .top-section,
                    .ligne {
                        grid-template-columns: 1fr;
                    }
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