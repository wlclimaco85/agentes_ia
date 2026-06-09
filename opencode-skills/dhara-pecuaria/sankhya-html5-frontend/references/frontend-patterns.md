# Frontend Patterns

## File Shape

Typical custom screen:

- `vc/src/webapp/html5/<screen>/index.html`
- `vc/src/webapp/html5/<screen>/app.js`
- `vc/src/webapp/html5/<screen>/styles.css`

## Service Calls

- Keep backend URL/service names centralized.
- Handle loading, success, business error, network error and invalid session.
- Avoid storing secrets in JavaScript.
- Backend must revalidate any business-critical field sent by the UI.
