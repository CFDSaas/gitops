#!/usr/bin/env bash
set -euo pipefail

ARGOCD_CHART_VERSION="10.11.6"
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

helm repo add argo https://argoproj.github.io/argo-helm
helm repo update

helm upgrade --install argocd argo/argo-cd \
  --namespace argocd --create-namespace \
  --version "$ARGOCD_CHART_VERSION" \
  -f "$REPO_ROOT/platform/argocd/values.yaml" \
  --wait