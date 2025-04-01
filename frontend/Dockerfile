  ARG IMAGE_NAME=infnet-guide
  FROM node:22-alpine AS builder
  WORKDIR /app
  
  COPY package.json yarn.lock ./
  RUN yarn install --frozen-lockfile
  
  COPY . .
  RUN yarn build
  
  FROM node:22-alpine AS runner
  WORKDIR /app
  
  ENV NODE_ENV production
  
  COPY package.json yarn.lock ./
  RUN yarn install --frozen-lockfile --production
  
  COPY --from=builder /app/.next ./.next
  COPY --from=builder /app/public ./public
  
  COPY --from=builder /app/next.config.mjs ./
  
  EXPOSE 3000
  
  CMD ["yarn", "start"]

  HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:3000/api/health || exit 1
  