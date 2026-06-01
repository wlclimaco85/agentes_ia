# Padroes de Docker Compose para Projetos Locais

## Stack Java + Banco Oracle

```yaml
version: "3.8"
services:
  oracle:
    image: sankhyaimages/skdev-oracle:1.1.0
    container_name: skdev-oracle
    shm_size: 1g
    ports: ["1521:1521", "5500:5500"]
    volumes:
      - skdev-oracle-volume:/opt/oracle/oradata
    restart: unless-stopped

  sqlserver:
    image: sankhyaimages/skdev-mssql:1.1.0
    container_name: sankhya_sqlserver
    ports: ["1433:1433"]
    volumes:
      - mssql_dados:/var/opt/mssql
    restart: unless-stopped

volumes:
  skdev-oracle-volume:
  mssql_dados:
```

## Stack Flutter Web + API

```yaml
version: "3.8"
services:
  api:
    build:
      context: ./java_backend
      dockerfile: Dockerfile
    ports: ["5210:5210"]
    environment:
      - WEB_ROOT=/app/web
    volumes:
      - ./flutter_app/build/web:/app/web
    restart: unless-stopped

  flutter-web:
    image: nginx:alpine
    ports: ["8080:80"]
    volumes:
      - ./flutter_app/build/web:/usr/share/nginx/html
    depends_on:
      - api
```

## Stack Node + Banco

```yaml
version: "3.8"
services:
  app:
    build: .
    ports: ["3000:3000"]
    environment:
      - DB_HOST=postgres
      - DB_PORT=5432
    depends_on:
      postgres:
        condition: service_healthy
    restart: unless-stopped

  postgres:
    image: postgres:16-alpine
    environment:
      POSTGRES_DB: appdb
      POSTGRES_USER: app
      POSTGRES_PASSWORD: secret
    volumes:
      - pgdata:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U app"]
      interval: 5s
      timeout: 5s
      retries: 5
    restart: unless-stopped

volumes:
  pgdata:
```

## Dicas

- Use `docker compose config` para validar o YAML antes de subir
- Use `docker compose up -d --build` para rebuildar imagens
- Use `docker compose logs -f` para acompanhar logs em tempo real
- Use `profiles` para servicos opcionais (ex: adminer, redis-insight)
