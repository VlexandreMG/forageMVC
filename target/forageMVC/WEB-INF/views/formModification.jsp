<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="fr">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Modifier Demande #${demande.id}</title>
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
                    max-width: 800px;
                    padding: 40px;
                    border-radius: 15px;
                    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
                }

                h1 {
                    font-weight: 300;
                    text-transform: uppercase;
                    letter-spacing: 2px;
                    text-align: center;
                    margin-bottom: 40px;
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
                    font-size: 1rem;
                    background-color: #FCFBF9;
                    color: var(--gris-fonce);
                    transition: all 0.3s ease;
                    outline: none;
                }

                select:focus,
                input:focus,
                textarea:focus {
                    border-color: var(--beige);
                    background-color: #fff;
                }

                textarea {
                    height: 100px;
                    resize: vertical;
                }

                button {
                    margin-top: 30px;
                    width: 100%;
                    padding: 15px;
                    background-color: var(--gris-fonce);
                    color: white;
                    border: none;
                    border-radius: 8px;
                    font-size: 1.1rem;
                    font-weight: bold;
                    cursor: pointer;
                    transition: all 0.3s;
                    text-transform: uppercase;
                }

                button:hover {
                    background-color: var(--beige);
                    color: var(--gris-fonce);
                }

                @media (max-width: 600px) {
                    .form-grid {
                        grid-template-columns: 1fr;
                    }

                    .full-width {
                        grid-column: span 1;
                    }
                }
            </style>
        </head>

        <body>

            <div class="form-card">
                <h1>Modification #${demande.id}</h1>

                <form action="${pageContext.request.contextPath}/demande/update" method="post">
                    <input type="hidden" name="id" value="${demande.id}">
                    <input type="hidden" name="idStatut" value="${demande.currentStatut.statut.id}">

                    <div class="form-grid">
                        <!-- CLIENT -->
                        <div class="form-group full-width">
                            <label for="client">Client</label>
                            <select name="idClient" id="client">
                                <option value="">-- Choisir un client --</option>
                                <c:forEach var="client" items="${clients}">
                                    <option value="${client.id}" ${client.id==demande.client.id ? 'selected' : '' }>
                                        ${client.nom} ${client.prenom}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- REGION -->
                        <div class="form-group">
                            <label for="region">Région</label>
                            <select name="idRegion" id="region">
                                <option value="">-- Choisir une région --</option>
                                <c:forEach var="region" items="${regions}">
                                    <option value="${region.id}" ${region.id==demande.commune.district.region.id
                                        ? 'selected' : '' }>
                                        ${region.libelle}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- DISTRICT -->
                        <div class="form-group">
                            <label for="district">District</label>
                            <select name="idDistrict" id="district">
                                <c:forEach var="district" items="${districts}">
                                    <option value="${district.id}" ${district.id==demande.commune.district.id
                                        ? 'selected' : '' }>
                                        ${district.libelle}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- COMMUNE -->
                        <div class="form-group">
                            <label for="commune">Commune</label>
                            <select name="idCommune" id="commune">
                                <c:forEach var="commune" items="${communes}">
                                    <option value="${commune.id}" ${commune.id==demande.commune.id ? 'selected' : '' }>
                                        ${commune.libelle}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- DATE -->
                        <div class="form-group">
                            <label for="date">Date</label>
                            <input type="datetime-local" id="date" name="date"
                                value="${demande.currentStatut.date.toString().substring(0,16)}">
                        </div>

                        <!-- LIEU -->
                        <div class="form-group full-width">
                            <label for="lieu">Lieu</label>
                            <input type="text" id="lieu" name="lieu" value="${demande.lieu}">
                        </div>

                        <!-- OBSERVATION -->
                        <div class="form-group full-width">
                            <label for="observation">Observation</label>
                            <textarea name="observation"
                                id="observation">${demande.currentStatut.observation}</textarea>
                        </div>
                    </div>

                    <button type="submit">Mettre à jour</button>
                </form>
            </div>

            <script>
                const region = document.getElementById("region");
                const district = document.getElementById("district");
                const commune = document.getElementById("commune");

                // REGION -> DISTRICT
                region.addEventListener("change", function () {
                    const idRegion = region.value;
                    fetch("${pageContext.request.contextPath}/district/region/" + idRegion)
                        .then(response => response.json())
                        .then(data => {
                            district.innerHTML = '<option value="">-- Choisir un district --</option>';
                            data.forEach(d => {
                                let option = document.createElement("option");
                                option.value = d.id;
                                option.textContent = d.libelle;
                                district.appendChild(option);
                            });
                            commune.innerHTML = '<option value="">-- Choisir une commune --</option>';
                        });
                });

                // DISTRICT -> COMMUNE
                district.addEventListener("change", function () {
                    const idDistrict = district.value;
                    fetch("${pageContext.request.contextPath}/commune/district/" + idDistrict)
                        .then(response => response.json())
                        .then(data => {
                            commune.innerHTML = '<option value="">-- Choisir une commune --</option>';
                            data.forEach(d => {
                                let option = document.createElement("option");
                                option.value = d.id;
                                option.textContent = d.libelle;
                                commune.appendChild(option);
                            });
                        });
                });
            </script>

        </body>

        </html>