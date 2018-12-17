From node:alpine as builder
WORKDIR '/app'

copy package.json .
run npm install
copy . .
run npm run build

from nginx
copy --from=builder /app/build /usr/share/ngnix/html
# it will start aoutomaticlly so we don't have to specify a command

