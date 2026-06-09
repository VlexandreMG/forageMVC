<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="fr">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Nouvelle Demande</title>
            <style>
                :root {
                    --gris-fonce: #4A4A4A;
                    --gris-moyen: #8C8C8C;
                    --beige: #D9D2C5;
                    --beige-clair: #F2EDE4;
                    --blanc: #FFFFFF;
                }

                body {
                    font-family: 'Segoe UI', Tahoma, sans-serif;
                    background-color: #F5F5F5;
                    margin: 0;
                    padding: 40px 20px;
                    display: flex;
                    justify-content: center;
                }

                .form-card {
                    background: var(--blanc);
                    width: 100%;
                    max-width: 700px;
                    padding: 40px;
                    border-radius: 15px;
                    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
                }

                h1 {
                    font-weight: 300;
                    text-transform: uppercase;
                    letter-spacing: 2px;
                    text-align: center;
                    margin-bottom: 30px;
                    color: var(--gris-fonce);
                }

                .form-grid {
                    display: grid;
                    grid-template-columns: 1fr 1fr;
                    gap: 20px;
                }

                .full-width {
                    grid-column: span 2;
                }

                .form-group {
                    display: flex;
                    flex-direction: column;
                }

                label {
                    font-size: 0.85rem;
                    font-weight: 600;
                    color: var(--gris-moyen);
                    margin-bottom: 8px;
                }

                select,
                input,
                textarea {
                    padding: 12px;
                    border: 2px solid var(--beige-clair);
                    border-radius: 8px;
                    background-color: #FCFBF9;
                    outline: none;
                    transition: border-color 0.3s;
                }

                select:focus,
                input:focus,
                textarea:focus {
                    border-color: var(--beige);
                }

                button {
                    margin-top: 20px;
                    width: 100%;
                    padding: 15px;
                    background-color: var(--beige);
                    color: var(--gris-fonce);
                    border: none;
                    border-radius: 8px;
                    font-weight: bold;
                    cursor: pointer;
                    transition: 0.3s;
                }

                button:hover {
                    background-color: var(--gris-fonce);
                    color: white;
                }
            </style>
        </head>

        <body>

            <div class="form-card">
                <h1>Nouvelle Demande</h1>
                <form action="${pageContext.request.contextPath}/demande/save" method="post">
                    <div class="form-grid">
                        <div class="form-group full-width">
                            <label>Client</label>
                            <select name="idClient" id="client">
                                <option value="">-- Choisir un client --</option>
                                <c:forEach var="client" items="${clients}">
                                    <option value="${client.id}">${client.nom} ${client.prenom}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Région</label>
                            <select name="idRegion" id="region">
                                <option value="">-- Choisir --</option>
                                <c:forEach var="region" items="${regions}">
                                    <option value="${region.id}">${region.libelle}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>District</label>
                            <select name="idDistrict" id="district">
                                <option value="">-- Choisir --</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Commune</label>
                            <select name="idCommune" id="commune">
                                <option value="">-- Choisir --</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Date</label>
                            <input type="datetime-local" name="date">
                        </div>

                        <div class="form-group full-width">
                            <label>Lieu</label>
                            <input type="text" name="lieu" placeholder="Précisez l'endroit">
                        </div>

                        <div class="form-group full-width">
                            <label>Observation</label>
                            <textarea name="observation" rows="3"></textarea>
                        </div>
                    </div>
                    <button type="submit">ENREGISTRER</button>
                </form>
            </div>

            <script>
                const region = document.getElementById("region");
                const district = document.getElementById("district");
                const commune = document.getElementById("commune");

                region.addEventListener("change", function () {
                    fetch("${pageContext.request.contextPath}/district/region/" + region.value)
                        .then(r => r.json()).then(data => {
                            district.innerHTML = '<option value="">-- Choisir --</option>';
                            data.forEach(d => {
                                let o = document.createElement("option");
                                 o.value = d.id;
                                 o.textContent = d.libelle;
                                district.appendChild(o);
                            });
                        });
                });

                district.addEventListener("change", function () {
                    fetch("${pageContext.request.contextPath}/commune/district/" + district.value)
                        .then(r => r.json()).then(data => {
                            commune.innerHTML = '<option value="">-- Choisir --</option>';
                            data.forEach(d => {
                                let o = document.createElement("option");
                                 o.value = d.id;
                                 o.textContent = d.libelle;
                                commune.appendChild(o);
                            });
                        });
                });
            </script>
        </body>

        </html>