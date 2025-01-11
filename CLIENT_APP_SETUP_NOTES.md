# Steps to Setup Server Apps

#### Create React apps for Login
> Choose Slim
```
npx react-chef login
```

#### Update the dev server 
> Change the DevServer Webpack Configuration proxy in last line like below.
```
proxy: [
      {
        context: ['/api'],
        target: 'http://localhost:9000',
      },
    ],
```

#### Update devDepencies in package.json
> Update only, if not exist.
```
  "devDependencies": {
    "@babel/core": "^7.26.0",
    "@babel/preset-env": "^7.26.0",
    "@babel/preset-react": "^7.26.3",
    "@svgr/webpack": "^8.1.0",
    "babel-loader": "^9.2.1",
    "copy-webpack-plugin": "^12.0.2",
    "file-loader": "^6.2.0",
    "html-webpack-plugin": "^5.6.3",
    "webpack": "^5.97.1",
    "webpack-cli": "^6.0.1",
    "webpack-dev-server": "^5.2.0"
  }
```

#### Update Login App React DOM Change
> Note: Skip the below dollar sign which helps to understand this is command.
```
$ echo "import React from 'react'
import { createRoot } from 'react-dom/client'
import App from './App'

const container = document.getElementById('login')
const root = createRoot(container)
root.render(<App />)" > client/login/src/index.js
```