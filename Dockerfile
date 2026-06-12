FROM node:18-slim

WORKDIR /app

COPY package.json .

RUN npm install express

COPY start.sh .

RUN chmod +x start.sh

EXPOSE 3000

CMD ["bash", "start.sh"]
