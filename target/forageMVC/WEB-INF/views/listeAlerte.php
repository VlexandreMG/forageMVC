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
            padding: 36px 20px;
            color: var(--text);
            background:
                linear-gradient(180deg, #111111 0 150px, transparent 150px 100%),
                radial-gradient(circle at right 15% top 5%, rgba(0, 0, 0, 0.08), transparent 26%),
                var(--bg);
        }

        .container {
            width: min(100%, 980px);
            margin: 0 auto;
            padding: 30px;
            border-radius: 28px;
            border: 1px solid var(--border);
            background: rgba(255, 255, 255, 0.96);
            box-shadow: var(--shadow);
            backdrop-filter: blur(8px);
        }

        h1 {
            margin: 0 0 22px;
            padding-bottom: 16px;
            border-bottom: 1px solid var(--border);
            font-size: clamp(1.4rem, 2vw, 1.9rem);
            font-weight: 800;
            letter-spacing: -0.04em;
            text-transform: none;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 14px;
            overflow: hidden;
            border-radius: 20px;
        }

        th {
            background-color: var(--text);
            color: var(--surface);
            padding: 16px 18px;
            text-align: left;
            font-size: 0.78rem;
            text-transform: uppercase;
            letter-spacing: 0.12em;
        }

        td {
            padding: 16px 18px;
            border-bottom: 1px solid var(--border);
            font-size: 0.94rem;
        }

        tbody tr:hover {
            background-color: #fafafa;
        }

        .badge {
            display: inline-flex;
            padding: 6px 12px;
            border-radius: 999px;
            font-size: 0.76rem;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            border: 1px solid var(--border);
            background: #f4f4f4;
            color: var(--text);
        }

        .badge-rouge,
        .badge-orange {
            background: #f4f4f4;
            color: var(--text);
        }

        .empty-text {
            text-align: center;
            padding: 48px 24px;
            color: var(--muted);
            font-style: italic;
            border: 1px dashed var(--border);
            border-radius: 18px;
            margin-top: 12px;
            background: #fcfcfc;
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