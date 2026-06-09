#!/bin/bash

# ==============================
# CONFIGURATION
# ==============================

PROJECT_PATH="/home/balou/S4/WebDy/Projet/forageMVC"
WAR_NAME="forageMVC.war"
TARGET_WAR="$PROJECT_PATH/target/$WAR_NAME"

TOMCAT_PATH="/home/balou/tomcat11"
WEBAPPS_PATH="$TOMCAT_PATH/webapps"

# ==============================
# BUILD MAVEN
# ==============================

echo "🚀 Build Maven en cours..."
cd $PROJECT_PATH || exit
mvn clean package

# ==============================
# CHECK WAR
# ==============================

if [ ! -f "$TARGET_WAR" ]; then
    echo "❌ WAR introuvable : $TARGET_WAR"
    exit 1
fi

echo "✔ WAR trouvé : $TARGET_WAR"

# ==============================
# STOP TOMCAT
# ==============================

echo "🛑 Arrêt de Tomcat..."
$TOMCAT_PATH/bin/shutdown.sh

sleep 3

# ==============================
# DEPLOY WAR
# ==============================

echo "📦 Déploiement sur Tomcat..."
cp "$TARGET_WAR" "$WEBAPPS_PATH/"

echo "📄 Copie de listeAlerte.php..."
cp "$PROJECT_PATH/src/main/webapp/WEB-INF/views/listeAlerte.php"  /opt/lampp/htdocs/listeAlerte.php
# ==============================
# START TOMCAT
# ==============================

echo "🚀 Démarrage de Tomcat..."
$TOMCAT_PATH/bin/startup.sh

# ==============================
# FIN
# ==============================

echo "✅ Déploiement terminé !"
echo "🌐 URL : http://localhost:8080/forageMVC/"