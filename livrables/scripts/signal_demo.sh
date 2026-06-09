#!/bin/bash

cleanup() {
    echo ""
    echo "[$(date +%T)] Signal reçu : nettoyage en cours..."
    rm -f /tmp/signal_demo_*.lock
    echo "[$(date +%T)] Nettoyage terminé. Bye."
    exit 0
}

reload_config() {
    echo "[$(date +%T)] SIGHUP reçu : rechargement de la configuration..."
    # Simuler un rechargement
    sleep 1
    echo "[$(date +%T)] Configuration rechargée."
}

# Installer les gestionnaires de signaux
trap cleanup SIGTERM SIGINT
trap reload_config SIGHUP

LOCKFILE="/tmp/signal_demo_$$.lock"
touch "$LOCKFILE"
echo "[$(date +%T)] Démarrage (PID: $$). Lockfile: $LOCKFILE"
echo "Envoyez SIGHUP pour recharger, SIGTERM/SIGINT pour quitter."

# Boucle principale
counter=0
while true; do
    echo "[$(date +%T)] En cours... (itération $counter)"
    counter=$((counter + 1))
    sleep 5
done
