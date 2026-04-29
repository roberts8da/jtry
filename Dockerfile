FROM node:slim

WORKDIR /app

COPY . .

EXPOSE 3000

RUN apt update -y &&\
    chmod +x app.js &&\
    npm install 
    
CMD ["node", "app.js"]
