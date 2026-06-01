# Backend Patterns

## Services

- Keep service/controller classes thin.
- Validate input DTOs before persistence.
- Return user-readable errors for action buttons and UI calls.
- Put reusable business rules into components/services.

## Persistence

- Prefer Sankhya SDK/repository patterns when available.
- Use Jape/NativeSQL only when the local codebase already uses it or the query needs it.
- Close wrappers/resources in finally or try-with-resources when the API supports it.

## Resources

Check `model/src/main/resources/META-INF` when adding providers, parameters, schedules or service registration files.
