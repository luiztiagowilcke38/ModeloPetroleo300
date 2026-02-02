#!/bin/bash
# Script para configurar Git e enviar para o GitHub
# Repositório: https://github.com/luiztiagowilcke38/ModeloPetroleo300

# 1. Inicializar repositório
git init

# 2. Adicionar todos os arquivos
git add .

# 3. Realizar primeiro commit
git commit -m "Primeiro commit: Projeto Petróleo 2026-2040 (40 Módulos em R)"

# 4. Renomear branch principal para 'main'
git branch -M main

# 5. Adicionar repositório remoto
# Nota: Se o remote já existir, removemos primeiro para evitar erro
git remote remove origin 2>/dev/null
git remote add origin https://github.com/luiztiagowilcke38/ModeloPetroleo300.git

# 6. Instrução de Push
echo "----------------------------------------------------------------"
echo "Repositório configurado localmente!"
echo "Para enviar para o GitHub, execute o comando abaixo (pode pedir senha/token):"
echo ""
echo "git push -u origin main"
echo "----------------------------------------------------------------"
