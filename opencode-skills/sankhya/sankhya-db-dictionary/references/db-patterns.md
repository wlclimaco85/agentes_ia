# DB And Dictionary Patterns

## Versioning

- Create a new `dbscripts/V<N>.xml` for new migrations.
- Keep prior version files stable once they are used in any shared or customer environment.
- Include both `<oracle>` and `<mssql>` blocks for each executable script step.

## Type Mapping

- Oracle integer identifier: `NUMBER(10)`.
- SQL Server integer identifier: `INT`.
- Oracle text: `VARCHAR2(n)`.
- SQL Server text: `VARCHAR(n)`.
- Dates can usually be `DATE` in both, but verify timestamp needs.

## Dictionary Consistency

- Each persisted custom table/view should have a corresponding XML in `datadictionary/` when the Sankhya UI or metadata needs to know it.
- `menu.xml` should reference existing resources and avoid duplicate ids.
- File names should match the entity/table/view closely.
