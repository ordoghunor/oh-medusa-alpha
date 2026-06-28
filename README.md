# oh-medusa-backend

Generic Medusa backend starter based on the latest Medusa v2 scaffold.

## Stack

- Medusa backend in `apps/backend`
- Turbo + npm workspaces
- GitHub Actions CI + semantic-release
- Multi-stage Docker build
- Local Docker Compose for quick testing

## Local development

```bash
npm ci
cp apps/backend/.env.template apps/backend/.env
npm run backend:dev
```

## Docker (local testing)

```bash
docker compose up --build
```

This starts:

- PostgreSQL (`localhost:5432`)
- Redis (`localhost:6379`)
- Medusa backend (`localhost:9000`)

## Release flow (semantic commits)

Push to `main` with conventional commit messages, for example:

- `feat: add customer loyalty API`
- `fix: handle missing shipping option`
- `chore: update dependencies`

The release workflow will:

1. Run semantic-release.
2. Create/update GitHub release and changelog.
3. Build and publish Docker image to `ghcr.io/<owner>/<repo>` with tags:
   - `latest`
   - `<semantic-version>`

## Useful commands

```bash
npm run build --workspace @dtc/backend -- --lint false
```

## Medusa docs

- https://docs.medusajs.com/
- https://docs.medusajs.com/learn/installation/docker
