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
                    --bg: #f4f4f4;
                    --surface: #ffffff;
                    --text: #111111;
                    --muted: #666666;
                    --border: #d9d9d9;
                    --shadow: 0 12px 30px rgba(0, 0, 0, 0.06);
                }

                body {
                    font-family: 'Segoe UI', Tahoma, sans-serif;
                    background-color: var(--bg);
                    margin: 0;
                    padding: 40px 20px;
                    display: flex;
                    justify-content: center;
                    color: var(--text);
                }

                .form-card {
                    background: var(--surface);
                    width: 100%;
                    max-width: 700px;
                    padding: 40px;
                    border-radius: 14px;
                    border: 1px solid var(--border);
                    box-shadow: var(--shadow);
                }

                h1 {
                    font-weight: 700;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    text-align: center;
                    margin-bottom: 30px;
                    color: var(--text);
                    font-size: 1.2rem;
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
                    color: var(--muted);
                    margin-bottom: 8px;
                }

                select,
                input,
                textarea {
                    padding: 12px 14px;
                    border: 1px solid var(--border);
                    border-radius: 8px;
                    background-color: #ffffff;
                    color: var(--text);
                    outline: none;
                    transition: border-color 0.2s ease, box-shadow 0.2s ease;
                }

                select:focus,
                input:focus,
                textarea:focus {
                    border-color: var(--text);
                    box-shadow: 0 0 0 3px rgba(0, 0, 0, 0.08);
                }

                button {
                    margin-top: 20px;
                    width: 100%;
                    padding: 15px;
                    background-color: var(--text);
                    color: var(--surface);
                    border: 1px solid var(--text);
                    border-radius: 8px;
                    font-weight: 700;
                    cursor: pointer;
                    transition: background-color 0.2s ease, color 0.2s ease;
                    letter-spacing: 0.5px;
                }

                button:hover {
                    background-color: var(--surface);
                    color: var(--text);
                }

                @media (max-width: 640px) {
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