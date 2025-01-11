#!/bin/bash

# Exit on error
set -e

# Define directory paths
ROOT_DIR=$(pwd)
UNIFIED_APP_DIR="$ROOT_DIR/unified-app"
SERVER_DIST_DIR="$ROOT_DIR/server/dist/"
CLIENT_BUILD_DIR="$ROOT_DIR/client/login/login-build"
SERVER_PACKAGE_DIR="$ROOT_DIR/server"

# Create unified folder structure
echo "Creating unified application folder structure..."
mkdir -p "$UNIFIED_APP_DIR/server"
mkdir -p "$UNIFIED_APP_DIR/client"

# Build the NestJS server
echo "Building the NestJS server..."
cd "$ROOT_DIR/server"
npm install
npm run build

# Copy server build files
echo "Copying server build files..."
cp -R "$SERVER_DIST_DIR" "$UNIFIED_APP_DIR/server"

# Copy package.json and package-lock.json for NestJS dependencies
echo "Copying server package files..."
cp "$SERVER_PACKAGE_DIR/package.json" "$UNIFIED_APP_DIR/server/package.json"
cp "$SERVER_PACKAGE_DIR/package-lock.json" "$UNIFIED_APP_DIR/server/package-lock.json"

# Build the React client
echo "Building the React client..."
cd "$ROOT_DIR/client/login"
npm install
npm run build

# Copy client build files
echo "Copying client build files..."
cp -R "$CLIENT_BUILD_DIR" "$UNIFIED_APP_DIR/client/"

# Verify the structure
echo "Verifying unified folder structure..."
cd "$ROOT_DIR"
find "$UNIFIED_APP_DIR"

echo "Build and setup completed successfully!"
