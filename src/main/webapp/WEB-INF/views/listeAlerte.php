<?php
$idDemande = isset($_GET["idDemande"]) ? $_GET["idDemande"] : "";
$alertes = [];

if (!empty($idDemande)) {
    $url = "http://localhost:8080/forageMVC/api/alertes/" . $idDemande;
    $json = file_get_contents($url);
    if ($json !== false) {
        $alertes = json_decode($json, true) ?? [];
    }
}
?>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des alertes</title>
    <style>
        /* Couleurs de base */
        :root {
            --gris-fonce: #4A4A4A;
            --gris-moyen: #8C8C8C;
            --gris-clair: #F5F5F5;
            --beige-clair: #F2EDE4;
            --blanc: #FFFFFF;

            --rouge: #c0392b;
            --rouge-bg: #fdf2f2;
            --orange: #e67e22;
            --orange-bg: #fef5ec;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Arial, sans-serif;
            background-color: var(--gris-clair);
            color: var(--gris-fonce);
            margin: 0;
            padding: 40px 20px;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            background: var(--blanc);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        }

        h1 {
            font-weight: 300;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 0;
            margin-bottom: 25px;
            border-bottom: 2px solid var(--beige-clair);
            padding-bottom: 15px;
        }

        /* Style simple pour le tableau */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th {
            background-color: var(--gris-fonce);
            color: var(--blanc);
            padding: 14px 18px;
            text-align: left;
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        td {
            padding: 14px 18px;
            border-bottom: 1px solid var(--beige-clair);
            font-size: 0.95rem;
        }

        /* Effet de survol sur les lignes */
        tbody tr:hover {
            background-color: #fcfbf9;
        }

        /* Badges simples pour la colonne Alerte */
        .badge {
            display: inline-block;
            padding: 5px 12px;
            border-radius: 4px;
            font-size: 0.8rem;
            font-weight: bold;
            text-transform: uppercase;
        }

        .badge-rouge {
            background-color: var(--rouge-bg);
            color: var(--rouge);
        }

        .badge-orange {
            background-color: var(--orange-bg);
            color: var(--orange);
        }

        .empty-text {
            text-align: center;
            padding: 30px;
            color: var(--gris-moyen);
            font-style: italic;
        }
    </style>
</head>

<body>

    <div class="container">
        <h1>Liste des alertes</h1>

        <?php if (!empty($alertes)) { ?>
            <table>
                <thead>
                    <tr>
                        <th>Statut 1</th>
                        <th>Statut 2</th>
                        <th>DT (Délai)</th>
                        <th>Alerte</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($alertes as $a) { ?>
                        <tr>
                            <td><strong><?= htmlspecialchars($a["idStatut1"]) ?></strong></td>
                            <td><?= htmlspecialchars($a["idStatut2"]) ?></td>
                            <td><?= htmlspecialchars($a["dt"]) ?> heures</td>
                            <td>
                                <?php if ($a["alerte"] == "Rouge") { ?>
                                    <span class="badge badge-rouge">
                                        <?= htmlspecialchars($a["alerte"]) ?>
                                    </span>
                                <?php } else { ?>
                                    <span class="badge badge-orange">
                                        <?= htmlspecialchars($a["alerte"]) ?>
                                    </span>
                                <?php } ?>
                            </td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        <?php } else { ?>
            <div class="empty-text">
                Aucune alerte trouvée pour cette demande.
            </div>
        <?php } ?>
    </div>

</body>

</html>