# DevOps Food Delivery Infra

Ce dépôt contient l'infrastructure Docker, Docker Swarm et Kubernetes pour déployer l'application Food Delivery fullstack : https://github.com/Mshandev/Food-Delivery

## Déploiement Docker Compose

1. Construction et lancement :
   ```bash
   docker-compose build
   docker-compose up
   ```

## Déploiement Docker Swarm
1. Initialisez Swarm sur le master :
   ```bash
   docker swarm init
   ```
2. Déployez le stack :
   ```bash
   docker stack deploy -c docker-compose.yaml foodstack
   ```

## Déploiement Kubernetes
1. Lancez le script d'init cluster + déploiement (voir détails dans le script) :
   ```bash
   chmod +x init_k8s.sh
   ./init_k8s.sh
   ```

---

## Fichiers
- Dockerfile-backend
- Dockerfile-frontend
- docker-compose.yaml
- backend-deployment.yaml
- frontend-deployment.yaml
- db-deployment.yaml
- hpa-backend-cpu.yaml
- hpa-backend-memory.yaml
- init_k8s.sh
