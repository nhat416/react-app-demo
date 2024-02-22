FROM node:latest
LABEL authors="ntran"

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY package.json ./
COPY package-lock.json ./
RUN npm install --silent

COPY . ./

EXPOSE 3000

CMD ["npm", "start"]