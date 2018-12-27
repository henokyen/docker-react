From node:alpine as builder
WORKDIR '/app'

copy package.json .
run npm install
copy . .
run npm run build

from nginx
# expose a port on aws elatic beanstalk so that the container is visible to the outside world
#Now AWS elastic beanstalk is just a little bit different.
#elastic beanstalk when it starts up your docker container.
#It's going to look at this Dockerfile file and it's going to look for the Expose instruction and 
#then whatever port you list in there is what elastic beanstalk is going to map directly automatically.
expose 80
copy --from=builder /app/build /usr/share/nginx/html
# it will start aoutomaticlly so we don't have to specify a command

