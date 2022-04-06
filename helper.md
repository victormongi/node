```
docker run -p 8090:80 -e "NODE_ENV=production" -u "node" -v $(pwd):/home/node/app -w "/home/node/app" --name "my-nodejs-app" victormongi/node:latest
```
