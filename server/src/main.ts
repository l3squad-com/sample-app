import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { join } from 'path';
import * as express from 'express';
import * as path from 'path';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  // Determine base path for React app (works both locally and inside Docker)
  const clientAppPath = process.env.NODE_ENV === 'production'
    ? path.join(__dirname, 'public/login-build')  // Inside Docker container
    : path.join(__dirname, '../../client/login/login-build'); // Locally for testing

  // Serve static files for React app
  app.use('/login-app', express.static(clientAppPath));

  // Fallback to index.html for unmatched routes under /login-app
  app.use('/login-app/*', (req, res) => {
    res.sendFile(join(clientAppPath, 'index.html'));
  });

  await app.listen(3000);
}
bootstrap();
