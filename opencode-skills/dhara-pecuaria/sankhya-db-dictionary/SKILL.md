---
name: sankhya-db-dictionary
description: Especialista em banco e Dicionario de Dados para add-ons Sankhya. Use quando Codex precisar criar, revisar ou corrigir arquivos em dbscripts/*.xml, datadictionary/*.xml, menu.xml, Dynamic Forms, views, tabelas, constraints, indices, chaves, tipos Oracle/MSSQL, Auto DDL/AutoDD, migrations versionadas ou consistencia entre XML de dicionario e scripts de banco.
---

# Sankhya DB E Dicionario

## Ordem De Trabalho

1. Ler `dbscripts/` em ordem numerica e identificar a ultima versao.
2. Ler o XML correspondente em `datadictionary/`, incluindo `menu.xml` quando houver tela/menu.
3. Conferir se a mudanca deve ser migration versionada, Auto DDL/AutoDD ou apenas dicionario.
4. Para producao ou atualizacao incremental, preferir novo `dbscripts/V<N>.xml`.
5. Escrever Oracle e MSSQL para cada comando; quando um banco exigir sintaxe diferente, separar claramente.
6. Validar parse XML e procurar conflitos de nome.

## Regras

- Usar prefixo `DH_` nesta workspace.
- Nao usar `AD_`.
- Evitar editar `V1.xml`...`V<N>.xml` existentes se ja representam historico de release; criar nova versao.
- Nomear constraints, indices e views com prefixo do ADD.
- Manter `datadictionary` coerente com tabelas/views criadas em `dbscripts`.
- Evitar `CREATE OR REPLACE VIEW` dentro de bloco MSSQL; usar sintaxe compativel com SQL Server quando necessario.
- Para campos obrigatorios em tabela existente, prever default/backfill ou duas etapas.

## Validacao

Rodar:

```powershell
.\.agents\skills\sankhya-db-dictionary\scripts\check_db_dictionary.ps1 .\dhara-pecuaria
```

Depois, quando o ambiente estiver pronto, rodar `.\gradlew.bat clean deployAddon` no projeto alvo.
