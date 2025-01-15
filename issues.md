## Errors You May Encounter and Their Solutions

### Error 1:
```bash
$ docker run -p 3000:3000 ghcr.io/l3squad-com/sample-app:latest
docker: error during connect: Head "http://%2F%2F.%2Fpipe%2FdockerDesktopLinuxEngine/_ping": open //./pipe/dockerDesktopLinuxEngine: The system cannot find the file specified.
See 'docker run --help'.

Solution:
Delete the container in Docker.
```
### Error 2:
```bash
$ docker run -p 3000:3000 ghcr.io/l3squad-com/sample-app:latest
docker: Error response from daemon: Ports are not available: exposing port TCP 0.0.0.0:3000 -> 0.0.0.0:0: listen tcp 0.0.0.0:3000: bind: Only one usage of each socket address (protocol/network address/port) is normally permitted.

Solution:
The port number might be the issue. Change the port number and try the following:
bash
Copy code
$ docker run -p 3001:3000 ghcr.io/l3squad-com/sample-app:latest
Ensure the port is available and not already in use.
```