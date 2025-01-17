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
  Here’s a detailed README for installing Docker on Windows:

---

# Docker Installation Guide for Windows

This guide will walk you through the process of installing Docker on your Windows machine. Docker Desktop is required to run Docker containers on Windows.

## Prerequisites

- **Windows 10 Pro or Enterprise** (or later). Docker Desktop requires a 64-bit version of Windows 10 with Hyper-V and Windows Containers enabled.
- **Hardware Virtualization** must be enabled in your BIOS settings.
- **WSL 2 (Windows Subsystem for Linux version 2)** must be installed.

## Steps to Install Docker on Windows

### 1. **Download Docker Desktop for Windows**
   - Open your browser and visit the official Docker website: [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop).
   - Click the **Download for Windows** button. This will download the Docker Desktop installer (e.g., `Docker Desktop Installer.exe`).

### 2. **Run the Installer**
   - Locate the downloaded installer file (`Docker Desktop Installer.exe`) and double-click to run it.
   - The installation wizard will guide you through the installation process.
     - **Important:** During installation, the installer may ask you to enable **Hyper-V** and **Windows Containers**. Ensure you allow these options.
   - Once the installation is complete, you may be prompted to restart your computer. Follow the prompt if necessary.

### 3. **Enable WSL 2 (Windows Subsystem for Linux 2)**
   Docker Desktop requires WSL 2, which is available on Windows 10, version 1903 or later. If WSL 2 is not installed, Docker will provide instructions to install it.
   - To install WSL 2, open **PowerShell** as **Administrator** and run:
     ```powershell
     wsl --install
     ```
   - If WSL 1 is already installed, you can upgrade to WSL 2 with the following command:
     ```powershell
     wsl --set-default-version 2
     ```
   - You may need to restart your computer after this process.

### 4. **Start Docker Desktop**
   - After installation and enabling WSL 2, you can start **Docker Desktop** by searching for it in the Start menu or by clicking the Docker icon in the system tray (bottom-right corner of the screen).
   - The Docker icon will appear in the system tray. Wait for Docker to initialize (this may take a few minutes the first time).

### 5. **Verify Docker Installation**
   - Open **Command Prompt** or **PowerShell** and type the following command to verify that Docker is installed correctly:
     ```bash
     docker --version
     ```
   - This should display the version of Docker that is installed, confirming that the installation was successful.

### 6. **Configure Docker (Optional)**
   - Right-click the Docker icon in the system tray and select **Settings** to access Docker’s configuration options.
   - You can adjust the resource allocation (CPU, memory, disk) and configure Docker's general settings based on your preferences.

---

## Troubleshooting

If you encounter issues during installation, consider the following:

- **Enable Hyper-V and Virtualization:**
  Ensure that **Hyper-V** and **Virtualization** are enabled in your system BIOS. These options are necessary for Docker to function properly on Windows.
  
- **Check WSL Version:**
  If Docker Desktop cannot find WSL 2, verify that you have installed and set WSL 2 as the default version:
  ```powershell
  wsl --set-default-version 2
  ```

- Docker Desktop Not Starting:
  If Docker Desktop is not starting, try restarting your computer and checking that the Docker Desktop service is running.
---
Additional Resources
- [Docker Documentation](https://docs.docker.com/)
- [Docker Desktop Release Notes](https://docs.docker.com/desktop/release-notes/)

---

This README should help guide you through installing Docker on Windows. If you encounter any issues or need further assistance, consult the official Docker documentation or seek help from the Docker community.

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
docker run -p 2025:3000 ghcr.io/l3squad-com/sample-app:latest
```

> OR Run in Detached Mode:
```
docker run -d -p 3000:3000 ghcr.io/l3squad-com/sample-app:latest
```
