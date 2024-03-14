FROM node:18

WORKDIR /usr/src/app

#copy everything
COPY . .
#then delete these files
RUN rm -rf .env node_modules

RUN npm install

RUN npm run build

EXPOSE 3000

CMD [ "npm", "start" ]