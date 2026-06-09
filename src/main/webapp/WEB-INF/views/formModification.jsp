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

                .form-card {
                    position: relative;
                    width: min(100%, 860px);
                    margin: 0 auto;
                    padding: 34px;
                    border-radius: 28px;
                    border: 1px solid var(--border);
                    background: rgba(255, 255, 255, 0.96);
                    box-shadow: var(--shadow);
                    backdrop-filter: blur(8px);
                }

                .form-card::before {
                    content: 'Modification';
                    display: block;
                    margin-bottom: 16px;
                    font-size: 0.78rem;
                    letter-spacing: 0.18em;
                    text-transform: uppercase;
                    color: var(--muted);
                }

                h1 {
                    margin: 0 0 28px;
                    font-size: clamp(1.4rem, 2vw, 2rem);
                    font-weight: 800;
                    letter-spacing: -0.04em;
                    text-transform: none;
                    text-align: left;
                }

                .form-grid {
                    display: grid;
                    grid-template-columns: repeat(12, 1fr);
                    gap: 18px;
                }

                .full-width {
                    grid-column: span 12;
                }

                .form-grid > .form-group {
                    grid-column: span 6;
                }

                .form-grid > .full-width {
                    grid-column: span 12;
                }

                .form-group {
                    display: flex;
                    flex-direction: column;
                }

                label {
                    margin-bottom: 8px;
                    font-size: 0.8rem;
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

                textarea {
                    min-height: 120px;
                    resize: vertical;
                }

                button {
                    margin-top: 26px;
                    width: 100%;
                    padding: 15px 18px;
                    border: 1px solid var(--text);
                    border-radius: 999px;
                    background: var(--text);
                    color: var(--surface);
                    font-weight: 800;
                    letter-spacing: 0.14em;
                    text-transform: uppercase;
                    cursor: pointer;
                    transition: background-color 0.18s ease, color 0.18s ease, transform 0.18s ease;
                }

                button:hover {
                    background: var(--surface);
                    color: var(--text);
                    transform: translateY(-1px);
                }

                @media (max-width: 720px) {
                    .form-card {
                        padding: 24px;
                        border-radius: 22px;
                    }

                    .form-grid > .form-group,
                    .full-width {
                        grid-column: span 12;
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