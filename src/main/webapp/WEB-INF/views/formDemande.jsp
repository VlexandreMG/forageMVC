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
                    width: min(100%, 820px);
                    margin: 0 auto;
                    padding: 34px;
                    border-radius: 28px;
                    border: 1px solid var(--border);
                    background: rgba(255, 255, 255, 0.96);
                    box-shadow: var(--shadow);
                    backdrop-filter: blur(8px);
                }

                .form-card::before {
                    content: 'Demande';
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