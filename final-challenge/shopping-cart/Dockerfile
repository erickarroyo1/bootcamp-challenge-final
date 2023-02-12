FROM node

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install
RUN apt update && apt install curl net-tools inetutils-ping -y
COPY server.js .

EXPOSE 3002
CMD ["npm", "start"]
