<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="fr">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Création devis</title>
            <!-- Font Awesome pour les icônes -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap"
                rel="stylesheet">
            <style>
                :root {
                    --bg: #f4f4f4;
                    --surface: #ffffff;
                    --text: #111111;
                    --muted: #666666;
                    --border: #d9d9d9;
                    --shadow: 0 12px 30px rgba(0, 0, 0, 0.06);
                    --gris-fonce: #111111;
                    --gris-moyen: #666666;
                    --gris-clair: #f5f5f5;
                    --beige: #d9d9d9;
                    --beige-clair: #ededed;
                    --blanc: #ffffff;
                    --rouge-action: #111111;
                    --vert-action: #666666;
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
                    padding: 35px;
                    border-radius: 14px;
                    border: 1px solid var(--border);
                    box-shadow: var(--shadow);
                }

                h1 {
                    font-weight: 700;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    margin-top: 0;
                    margin-bottom: 30px;
                    border-bottom: 1px solid var(--border);
                    padding-bottom: 15px;
                    font-size: 1.2rem;
                }

                h3 {
                    font-weight: 700;
                    text-transform: uppercase;
                    font-size: 0.9rem;
                    letter-spacing: 1px;
                    margin-top: 0;
                    color: var(--muted);
                }

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
                    color: var(--muted);
                }

                select,
                input {
                    width: 100%;
                    padding: 12px 14px;
                    border: 1px solid var(--border);
                    border-radius: 8px;
                    background-color: var(--surface);
                    color: var(--text);
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                    font-size: 0.95rem;
                    box-sizing: border-box;
                    outline: none;
                    transition: border-color 0.2s ease, box-shadow 0.2s ease;
                }

                select:focus,
                input:focus {
                    border-color: var(--text);
                    box-shadow: 0 0 0 3px rgba(0, 0, 0, 0.08);
                }

                .details-panel {
                    background-color: #fafafa;
                    border: 1px solid var(--border);
                    border-radius: 10px;
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
                    color: var(--muted);
                }

                .section-title {
                    font-size: 1.05rem;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    margin-top: 30px;
                    margin-bottom: 15px;
                    color: var(--text);
                }

                .ligne {
                    display: grid;
                    grid-template-columns: 3fr 1fr 1.5fr 1.5fr max-content;
                    gap: 15px;
                    align-items: flex-end;
                    margin-bottom: 15px;
                    background: var(--surface);
                    padding: 5px 0;
                }

                input[readonly] {
                    background-color: #f3f3f3;
                    border-color: var(--border);
                    font-weight: 600;
                }

                .btn {
                    padding: 12px 20px;
                    border-radius: 8px;
                    font-weight: 600;
                    cursor: pointer;
                    display: inline-flex;
                    align-items: center;
                    gap: 8px;
                    border: 1px solid var(--text);
                    transition: background-color 0.2s ease, color 0.2s ease, transform 0.2s ease;
                    font-size: 0.9rem;
                    text-decoration: none;
                    background-color: var(--surface);
                    color: var(--text);
                }

                .btn-add {
                    margin-top: 10px;
                }

                .btn-add:hover,
                .btn-delete:hover,
                .btn-submit:hover {
                    background-color: var(--text);
                    color: var(--surface);
                }

                .btn-delete {
                    background-color: var(--surface);
                    color: var(--text);
                    padding: 12px;
                    border-radius: 8px;
                }

                .btn-submit {
                    padding: 14px 30px;
                    font-size: 1rem;
                    letter-spacing: 1px;
                    text-transform: uppercase;
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
                    font-size: 1.4rem;
                    font-weight: 700;
                    color: var(--text);
                }

                @media (max-width: 860px) {
                    .top-section,
                    .ligne {
                        grid-template-columns: 1fr;
                    }
                }
            </style>
        </head>

        <body>

            <div class="container">
                <h1>Ajouter un devis</h1>

                <form action="${pageContext.request.contextPath}/devis/create" method="post">

                    <!-- Section supérieure ordonnée -->
                    <div class="top-section">
                        <!-- Bloc de sélection à gauche -->
                        <div>
                            <div class="form-group">
                                <label for="idDemande">Demande correspondante</label>
                                <select name="demande.id" id="idDemande">
                                    <option value="">-- Choisir une demande --</option>
                                    <c:forEach var="demande" items="${demandes}">
                                        <option value="${demande.id}">Numéro : ${demande.id}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="idTypeDevis">Type de devis</label>
                                <select name="typeDevis.id" id="idTypeDevis">
                                    <option value="">-- En attente de la demande --</option>
                                </select>
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
                    <div class="form-group">
                        <label>Date</label>
                        <input type="datetime-local" name="date">
                    </div>

                    <!-- Section Lignes de Devis -->
                    <div
                        style="display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid var(--border); padding-bottom: 12px; margin-top: 8px;">
                        <h2 class="section-title" style="margin: 0;">Éléments du devis (Sous-devis)</h2>
                    </div>

                    <!-- Entêtes factices pour la structure de grille claire -->
                    <div
                        style="display: grid; grid-template-columns: 3fr 1fr 1.5fr 1.5fr max-content; gap: 15px; margin-top: 18px; padding: 0 6px 6px; border-bottom: 1px solid var(--border);">
                        <span
                            style="font-size: 0.76rem; font-weight: 800; text-transform: uppercase; letter-spacing: 0.12em; color: var(--muted);">Description</span>
                        <span
                            style="font-size: 0.76rem; font-weight: 800; text-transform: uppercase; letter-spacing: 0.12em; color: var(--muted);">Qté</span>
                        <span
                            style="font-size: 0.76rem; font-weight: 800; text-transform: uppercase; letter-spacing: 0.12em; color: var(--muted);">Prix
                            Unitaire (Ar)</span>
                        <span
                            style="font-size: 0.76rem; font-weight: 800; text-transform: uppercase; letter-spacing: 0.12em; color: var(--muted);">Montant</span>
                        <span style="width: 42px;"></span>
                    </div>

                    <div id="container" style="margin-top: 10px;">
                        <!-- Première ligne par défaut -->
                        <div class="ligne">
                            <div>
                                <input type="text" name="sousDevis[0].description"
                                    placeholder="Ex: Main d'œuvre, Matériaux...">
                            </div>
                            <div>
                                <input type="number" name="sousDevis[0].quantite" class="qte" min="1" placeholder="0">
                            </div>
                            <div>
                                <input type="number" step="0.01" name="sousDevis[0].prixUnitaire" class="PU"
                                    placeholder="0.00">
                            </div>
                            <div>
                                <input type="number" step="0.01" class="montant" readonly placeholder="0.00">
                            </div>
                            <button type="button" class="btn btn-delete" onclick="supprimer(this)"
                                title="Supprimer la ligne">
                                <i class="fa-solid fa-trash-can"></i>
                            </button>
                        </div>
                    </div>

                    <!-- Actions sur le tableau -->
                    <button type="button" class="btn btn-add" onclick="ajouterLigne()">
                        <i class="fa-solid fa-circle-plus"></i> Ajouter un élément
                    </button>

                    <!-- Pied du formulaire -->
                    <div class="total-box">
                        <span style="text-transform: uppercase; font-weight: 600; letter-spacing: 1px;">Total Général
                            :</span>
                        <div><span id="total">0</span> Ar</div>
                    </div>

                    <div style="margin-top: 40px; text-align: center;">
                        <button type="submit" class="btn btn-submit">
                            Créer le devis
                        </button>
                    </div>

                </form>
            </div>

            <script>
                const selectType = document.getElementById("idTypeDevis");
                const selectDemande = document.getElementById("idDemande");

                function reindexer() {
                    const lignes = document.querySelectorAll(".ligne");
                    lignes.forEach((ligne, idx) => {
                        ligne.querySelector('[name*=".description"]').name = 'sousDevis[' + idx + '].description';
                        ligne.querySelector('[name*=".quantite"]').name = 'sousDevis[' + idx + '].quantite';
                        ligne.querySelector('[name*=".prixUnitaire"]').name = 'sousDevis[' + idx + '].prixUnitaire';
                    });
                }

                function supprimer(button) {
                    const lignes = document.querySelectorAll(".ligne");
                    // Empêche la suppression s'il ne reste qu'une seule ligne
                    if (lignes.length <= 1) {
                        alert("Le devis doit comporter au moins une ligne.");
                        return;
                    }
                    const ligne = button.closest(".ligne");
                    ligne.remove();
                    reindexer();
                    calculerMontants();
                }

                function calculerMontants() {
                    let total = 0;
                    const lignes = document.querySelectorAll(".ligne");

                    lignes.forEach(ligne => {
                        const qte = parseFloat(ligne.querySelector(".qte").value) || 0;
                        const pu = parseFloat(ligne.querySelector(".PU").value) || 0;
                        const montant = qte * pu;

                        ligne.querySelector(".montant").value = montant.toFixed(2);
                        total += montant;
                    });

                    document.getElementById("total").textContent = total.toLocaleString('fr-FR', { minimumFractionDigits: 2 });
                }

                function ajouterLigne() {
                    const index = document.querySelectorAll(".ligne").length;
                    // alert("index = " + index);

                    let html = '' +
                        '<div class="ligne">' +
                        '  <div>' +
                        '    <input type="text" name="sousDevis[' + index + '].description" placeholder="Ex: Autre prestation...">' +
                        '  </div>' +
                        '  <div>' +
                        '    <input type="number" name="sousDevis[' + index + '].quantite" class="qte" min="1" placeholder="0">' +
                        '  </div>' +
                        '  <div>' +
                        '    <input type="number" step="0.01" name="sousDevis[' + index + '].prixUnitaire" class="PU" placeholder="0.00">' +
                        '  </div>' +
                        '  <div>' +
                        '    <input type="number" step="0.01" class="montant" readonly placeholder="0.00">' +
                        '  </div>' +
                        '  <button type="button" class="btn btn-delete" onclick="supprimer(this)" title="Supprimer la ligne">' +
                        '    <i class="fa-solid fa-trash-can"></i>' +
                        '  </button>' +
                        '</div>';

                    document.getElementById("container").insertAdjacentHTML("beforeend", html);

                    const lignes = document.querySelectorAll(".ligne");
                    const nouvelleLigne = lignes[lignes.length - 1];
                    nouvelleLigne.querySelector(".qte").addEventListener("input", calculerMontants);
                    nouvelleLigne.querySelector(".PU").addEventListener("input", calculerMontants);
                }



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

                            selectType.innerHTML = '';
                            if (data.typesDevis && data.typesDevis.length > 0) {
                                data.typesDevis.forEach(typeDevis => {
                                    const option = document.createElement('option');
                                    option.value = typeDevis.id;
                                    option.textContent = typeDevis.libelle;
                                    selectType.appendChild(option);
                                });
                            } else {
                                selectType.innerHTML = '<option value="">Aucun type disponible</option>';
                            }
                        })
                        .catch(error => {
                            console.error("Erreur lors du chargement :", error);
                        });
                }

                const premiereLigne = document.querySelector(".ligne");
                premiereLigne.querySelector(".qte").addEventListener("input", calculerMontants);
                premiereLigne.querySelector(".PU").addEventListener("input", calculerMontants);
            </script>

        </body>

        </html>