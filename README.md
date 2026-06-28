# oh-medusa-monorepo

Medusa monorepo containing backend and storefront apps.

## Stack

- Medusa backend in `apps/backend`
- Medusa storefront in `apps/storefront`
- Turbo + npm workspaces
- GitHub Actions CI + semantic-release
- Multi-stage Docker build
- Local Docker Compose for quick testing

## Local development

```bash
npm ci
cp apps/backend/.env.template apps/backend/.env
npm run backend:dev
npm run storefront:dev
```

## Docker (local testing)

```bash
docker compose up --build
```

This starts:

- PostgreSQL (`localhost:5432`)
- Redis (`localhost:6379`)
- Medusa backend (`localhost:9000`)
- Medusa storefront (`localhost:8000`)

## Release flow (semantic commits)

Push to `main` with conventional commit messages, for example:

- `feat: add customer loyalty API`
- `fix: handle missing shipping option`
- `chore: update dependencies`

The release workflow will:

1. Run semantic-release for backend and storefront separately.
2. Create/update GitHub releases and changelogs per app:
   - Backend tags are prefixed with `medusa-`
   - Storefront tags are prefixed with `storefront-`
3. Build and publish backend Docker image to `ghcr.io/<owner>/<repo>` with tags:
   - `latest`
   - `medusa-<semantic-version>`

## Useful commands

```bash
npm run build --workspace @dtc/backend -- --lint false
npm run build --workspace @dtc/storefront
```

## Medusa docs

- https://docs.medusajs.com/
- https://docs.medusajs.com/learn/installation/docker
