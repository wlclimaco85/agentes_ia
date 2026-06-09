# Search Playbook

Prefer `rg` for local examples.

## Sankhya Sources

```powershell
rg -n "@Service|@Controller|@ActionButton|@Job|BusinessRule|Listener|Callback" C:\sk-java\git\sankhyaw
rg -n "NativeSql|Jape|EntityFacade|JdbcWrapper|DynamicVO" C:\sk-java\git\sankhyaw
rg -n "service.sbr|mgeSession|Sankhya|skw|angular|html5" C:\sk-java\git\sankhyaw
rg -n "CREATE TABLE|CREATE OR REPLACE VIEW|ALTER TABLE" C:\sk-java\git\sankhyaw\dbscript C:\sk-java\git\sankhyaw
```

## Workspace Examples

```powershell
rg -n "appKey|serverFolder|deployAddon|autoDDL|plataformaMinima" C:\dharatecnologia
rg -n "<entity|<field|<menu|resourceId|dynamic" C:\dharatecnologia\dhara-pecuaria\datadictionary
rg -n "<oracle>|<mssql>|CREATE TABLE|ALTER TABLE" C:\dharatecnologia\dhara-pecuaria\dbscripts
```

## MCP

When available, use the `sankhya-specialist` MCP tools:

- `workspace_summary`
- `search_workspace`
- `search_sankhyaw`
- `read_file`
