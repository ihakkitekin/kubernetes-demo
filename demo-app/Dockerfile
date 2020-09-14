###################################################
#
# Build OS Setup Stage
#
###################################################
FROM node:10-alpine AS os

WORKDIR /home/build

COPY ./package*.json ./

###################################################
#
# Install Stage
#
###################################################
FROM os AS build

RUN npm ci

COPY . .

###################################################
#
# Production Stage
#
###################################################
FROM node:10-alpine

WORKDIR /home/app

COPY --from=build /home/build /home/app

EXPOSE 4000

CMD [ "node", "index.js" ]