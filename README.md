# Sample App in NestJS and React Chef App with Docker Setup

## Setting a Sample App from the Beginning.

Follow DOCKER_NOTES.md to create a new Sample App Server

#### Create `Personal access tokens` in your Github Account
 - Login to Github and go to https://github.com/settings/tokens
 - Generate a New Token: 
    - Click on the Generate new token button.
    - Choose Generate new token (classic).
 - Configure Your Token:
    - In the "Note" field, provide a descriptive name for your token, example "general".
    - Set an expiration date for your token if desired; otherwise, you can choose "No expiration".
    - Select the scopes or permissions for your token. For full repository access, check the box for repo and any other necessary permissions.
 - Generate and Copy Your Token
    - Click on the green Generate token button at the bottom of the page.
    - Once generated, make sure to copy your personal access token immediately. You will not be able to see it again after you navigate away from this page.
 - Store Your Token Securely:
    - Save your token in a secure location, such as a password manager or a secure text file.

#### Create 
```
export CR_PAT=<PAT_TOKEN>
echo $CR_PAT | docker login ghcr.io -u <github_username>--password-stdin
```

### Pull the L3Squad Docker Sample App
```
docker pull ghcr.io/l3squad-com/sample-app:latest
```

#### Run the Sample App
```
docker run -p 3000:3000 ghcr.io/l3squad-com/sample-app:latest
```

> OR Run in Detached Mode:
```
docker run -d -p 3000:3000 ghcr.io/l3squad-com/sample-app:latest
```