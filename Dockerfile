FROM node:16-alpine
RUN apk add --no-cache python3 make g++
WORKDIR /app
COPY . .
RUN npm install --production
CMD ["node", "src/index.js"]