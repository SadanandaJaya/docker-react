# build phase

FROM node:16-alpine as builder 
# by using the "as" command we are saying that from below all the commands will be build phase 

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# run phase

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html 
# the --from=builder is used to copy files from builder phase
# /app/build is the source where we want to copy the changes from
#/usr/share/nginx/html is the default target path where it will look for the html file to deploy



