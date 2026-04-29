FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY index.js ./

RUN chown -R node:node /app

USER 1000

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:3000/health || exit 1

CMD ["node", "index.js"]
