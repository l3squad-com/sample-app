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
