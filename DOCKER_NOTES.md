## Setting a NestJS Server

Follow SERVER_APP_SETUP_NOTES.md to create a new Sample App Server

## Setting a NestJS Server

Follow CLIENT_APP_SETUP_NOTES to create a new Sample App Server

#### Build Unified App and Run the Build
> This will create a folder in root called `unified-app`.
```
chmod +x build_unified_app.sh
./build_unified_app.sh
```

#### Create DockerFile
> File Name: ./docker-compose.yml

```
# Main stage for NestJS app
FROM node:18 AS nestjs-build

WORKDIR /app

# Copy the already built server files from unified-app to the container
COPY ./unified-app/server /app/server

WORKDIR /app/server

# Copy the package.json and package-lock.json to install dependencies
COPY ./unified-app/server/package.json /app/server/package.json
COPY ./unified-app/server/package-lock.json /app/server/package-lock.json
RUN npm install

# Copy the already built React client (login app) from unified-app to the NestJS public directory
COPY ./unified-app/client/login-build /app/server/public/login-build

# Expose port for NestJS app
EXPOSE 3000

ENV NODE_ENV=production

# Run the NestJS application
CMD ["node", "main.js"]
```

#### Create a Docker Compose File

```
version: '3.8'

services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: sample-app
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=production
    networks:
      - app-network
    restart: always

networks:
  app-network:
    driver: bridge
```

#### Step 1: Enable GitHub Container Registry
Go to your GitHub account settings: Settings > Packages.
Ensure that GitHub Container Registry is enabled for your account or organization.
Example: https://github.com/settings/packages

> Working with the Docker registry
https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-docker-registry

#### Creating a New Docker Registry

```
export CR_PAT=<YOUR_PAT_TOKEN>
echo $CR_PAT | docker login ghcr.io -u l3squad-com --password-stdin
docker stop <container_id_or_name>
docker rm -f <container_id_or_name>
docker build -t sample-app:latest .
docker run -p 3000:3000 sample-app:latest
docker logs <container_id or container_name>
docker logs <container_id or container_name>
docker compose build
docker tag sample-app:latest ghcr.io/l3squad-com/sample-app:latest
```