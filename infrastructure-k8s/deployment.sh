#!/bin/bash

NAMESPACE="infnet-system"

echo "=== Starting Kubernetes Deployment ==="

echo -e "\n[1/5] Creating namespace..."
kubectl create namespace $NAMESPACE 2>/dev/null || echo "Namespace already exists"

echo -e "\n[2/5] Deploying Redis..."
kubectl apply -f redis-deployment.yml
echo "Waiting for Redis to be ready..."
kubectl wait --for=condition=ready pod -l app=redis --timeout=120s

echo -e "\n[3/5] Deploying Frontend..."
kubectl apply -f frontend-deployment.yml
echo "Waiting for frontend pods to initialize..."
kubectl wait --for=condition=ready pod -l app=infnet-frontend --timeout=120s

echo -e "\n[4/5] Deploying Prometheus..."
kubectl apply -f prometheus-deployment.yml
sleep 15

echo -e "\n[5/5] Deploying Grafana..."
kubectl apply -f grafana-deployment.yml
sleep 30

echo -e "\n=== Deployment Verification ==="
echo "Pods:"
kubectl get pods -n $NAMESPACE

echo -e "\nServices:"
kubectl get svc -n $NAMESPACE

echo -e "\n=== Deployment Complete ==="