# Steps to Setup Client Apps

```
nest new server
```

#### Output
```
$ nest new server
⚡  We will scaffold your app in a few seconds..

? Which package manager would you ❤️  to use? npm
CREATE server/.eslintrc.js (663 bytes)
CREATE server/.prettierrc (51 bytes)
CREATE server/README.md (5205 bytes)
CREATE server/nest-cli.json (171 bytes)
CREATE server/package.json (1942 bytes)
CREATE server/tsconfig.build.json (97 bytes)
CREATE server/tsconfig.json (546 bytes)
CREATE server/src/app.controller.ts (274 bytes)
CREATE server/src/app.module.ts (249 bytes)
CREATE server/src/app.service.ts (142 bytes)
CREATE server/src/main.ts (228 bytes)
CREATE server/src/app.controller.spec.ts (617 bytes)
CREATE server/test/jest-e2e.json (183 bytes)
CREATE server/test/app.e2e-spec.ts (630 bytes)

✔ Installation in progress... ☕

🚀  Successfully created project server
👉  Get started with the following commands:

                          Thanks for installing Nest 🙏
                 Please consider donating to our open collective
                        to help us maintain this package.


               🍷  Donate: https://opencollective.com/nest
```

#### Move to Server Directory
```
$ cd server
```

#### Install other Modules
```
npm i -S @nestjs/platform-express
npm i -D express
```

#### Update main.ts file to call Login App
> Note: Skip the below dollar sign which helps to understand this is command.
```
$ echo "
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
bootstrap();" > src/login/login.controller.ts
```

#### Generate controllers for Login and Dashboard

```
nest g controller login
nest g controller dashboard
```

#### Add a basic route to each controller
> Note: Skip the below dollar sign which helps to understand this is command.

```
$ echo "import { Controller, Get } from '@nestjs/common';

@Controller('login')
export class LoginController {
  @Get()
  getLoginPage() {
    return { message: 'Login page endpoint' };
  }
}" > src/login/login.controller.ts
```

#### Build the app to ensure no errors
> this creates dist directory.

```
npm run build
```

#### Start the App
```
$ npm run start
```