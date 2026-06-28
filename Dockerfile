FROM node:20-bookworm-slim AS deps
WORKDIR /app

COPY package.json package-lock.json .npmrc turbo.json ./
COPY apps/backend/package.json apps/backend/package.json
RUN npm ci

FROM deps AS build
COPY . .
RUN npm run build --workspace @dtc/backend -- --lint false

FROM node:20-bookworm-slim AS prod-deps
WORKDIR /app

COPY package.json package-lock.json .npmrc turbo.json ./
COPY apps/backend/package.json apps/backend/package.json
RUN npm ci --omit=dev

FROM node:20-bookworm-slim AS runtime
WORKDIR /app
ENV NODE_ENV=production
ENV PORT=9000

COPY --from=prod-deps /app/node_modules ./node_modules
COPY --from=build /app/package.json ./package.json
COPY --from=build /app/apps/backend ./apps/backend

EXPOSE 9000
CMD ["npm", "run", "start", "--workspace", "@dtc/backend"]
