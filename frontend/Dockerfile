  FROM node:22-alpine AS builder
  WORKDIR /app
  
  COPY package.json yarn.lock ./
  RUN yarn install --frozen-lockfile
  
  COPY . .
  RUN yarn build
  
  FROM node:22-alpine AS runner
  WORKDIR /app
  
  ENV NODE_ENV production
  
  RUN apk add --no-cache curl

  COPY package.json yarn.lock ./
  RUN yarn install --frozen-lockfile --production
  
  COPY --from=builder /app/.next ./.next
  COPY --from=builder /app/public ./public
  
  COPY --from=builder /app/next.config.mjs ./
  
  EXPOSE 3000
  
  CMD ["yarn", "start"]

  