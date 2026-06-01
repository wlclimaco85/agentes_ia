---
name: opencode-docker-devops
description: Especialista em Docker, Docker Compose, WSL2 e DevOps para ambientes Windows + WSL. Use quando precisar configurar, diagnosticar ou criar workflows com Docker Engine nativo no WSL2, Docker Compose, volume mounts, redes, multi-stage builds, Dockerfiles ou integracao com ambientes locais de desenvolvimento (Java, Spring, Flutter, Node, bancos Oracle/SQL Server/PostgreSQL).
---

# Docker & WSL2 DevOps

## Setup Docker Engine Nativo no WSL2 (sem Docker Desktop)

### 1. Instalar Docker Engine na distro WSL2

```bash
# Atualizar pacotes
sudo apt update && sudo apt upgrade -y

# Instalar dependencias
sudo apt install -y ca-certificates curl gnupg lsb-release

# Adicionar chave GPG oficial do Docker
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Adicionar repositorio
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Instalar Docker Engine
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Iniciar Docker
sudo service docker start

# Adicionar usuario ao grupo docker (evitar sudo)
sudo usermod -aG docker $USER

# Verificar
docker --version
docker compose version
```

### 2. Integracao Windows + WSL2

No PowerShell (Windows), configurar ~/.wslconfig:

```ini
[wsl2]
memory=8GB
processors=4
localhostForwarding=true
```

Reiniciar WSL:
```powershell
wsl --shutdown
wsl
```

### 3. Acessar Docker do Windows via WSL

No terminal Windows, para usar o Docker Engine do WSL:

```powershell
wsl docker ps
wsl docker compose up
```

Ou configure o alias no PowerShell:
```powershell
function docker { wsl docker @args }
function docker-compose { wsl docker compose @args }
```

### 4. Projetos com docker-compose.yml

Sempre rodar `docker compose up -d` dentro do WSL2 (nao no PowerShell) para evitar problemas de encoding/volume mount.

## Boas Praticas

### Dockerfile
- Multi-stage builds para imagens menores
- Usar `.dockerignore` para excluir node_modules, .git, etc.
- Preferir imagens oficiais e especificar versoes (nao usar `:latest`)

### Docker Compose
- Usar `profiles` para servicos opcionais
- Definir `restart: unless-stopped` para servicos permanentes
- Mapear volumes nomeados (nao bind mounts) para dados persistentes

### Rede
- Usar `networks` customizadas para isolar servicos
- `depends_on` com `condition: service_healthy` para ordenacao segura

### Seguranca
- Nao rodar containers como root sem necessidade
- Usar `USER` no Dockerfile
- Nao expor portas desnecessarias

## Referencias

- `references/docker-wsl2-setup.md` - Guia completo de instalacao Docker + WSL2
- `references/docker-compose-patterns.md` - Padroes de docker-compose para projetos locais
