# Docker Engine Nativo no WSL2 — Guia Completo

## Referencias Principais
- https://docs.docker.com/desktop/features/wsl/
- https://www.codingwithcalvin.net/installing-docker-and-docker-compose-in-wsl2ubuntu-on-windows/
- https://stackoverflow.com/questions/60746121/how-to-run-docker-compose-under-wsl-2
- https://www.dio.me/articles/guia-definitivo-instalando-docker-no-wsl-2-sem-docker-desktop
- https://openproject.ifrs.edu.br/projects/documentacoes-dti/wiki/wsl-2-plus-instalar-o-docker-com-docker-engine-docker-nativo
- https://docs.docker.com/compose/install/

## Por que Docker Engine nativo no WSL2?
- Gratuito (Docker Desktop requer licenca para uso corporativo)
- Mais leve (sem camada de virtualizacao extra)
- Performance native Linux
- Controle direto sobre o daemon

## Instalacao Passo a Passo

### Pre-requisitos
- Windows 10/11 com WSL2 instalado
- Distro Ubuntu (ou qualquer Debian-based) instalada no WSL2
- WSL2 configurado como padrao (`wsl --set-default-version 2`)

### 1. Instalar Docker Engine na Distro WSL2
Conforme SKILL.md

### 2. Configurar inicializacao automatica do Docker
Adicionar ao ~/.bashrc ou ~/.zshrc da distro WSL2:
```bash
# Iniciar Docker daemon se nao estiver rodando
if ! pgrep -x "dockerd" > /dev/null; then
    sudo service docker start > /dev/null 2>&1
fi
```

### 3. Acessar arquivos do Windows pelo WSL
Projetos em C:\ podem ser acessados via /mnt/c/ no WSL.
Recomendado: manter projetos dentro do WSL (~/projects) para melhor performance de I/O.

## Comandos Uteis

```bash
# Status do Docker
docker info
docker system df

# Limpeza
docker system prune -af --volumes

# Logs
docker logs -f <container>

# Executar comando em container rodando
docker exec -it <container> bash

# Copy arquivos
docker cp <container>:/path/inside /host/path
```
