FROM node:19-alpine AS base

FROM base AS deps
RUN apk add --no-cache libc6-compat
RUN corepack enable && corepack prepare pnpm@9.5.0
WORKDIR /app
COPY package.json pnpm-lock.yaml ./
RUN pnpm install

FROM base AS builder
RUN corepack enable && corepack prepare pnpm@9.5.0
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN yarn build

FROM base AS runner
WORKDIR /app
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./.next/static

# RUN rm -rf ./.yarn
# # COPY --from=builder /app/.yarn/cache ./.yarn/cache

# COPY --from=builder /app/.yarn/cache ./.yarn/cache
# COPY --from=builder /app/.yarn/releases ./.yarn/releases
# # COPY --from=builder /app/.yarn/unplugged ./.yarn/unplugged
# # COPY --from=builder /app/.yarn/install-state.gz ./.yarn/install-state.gz

ENV HOSTNAME "0.0.0.0"
EXPOSE 3000
CMD ["node", "/app/server.js"]