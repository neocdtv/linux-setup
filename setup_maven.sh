#!/bin/bash

# Default Maven version
MAVEN_VERSION=${1:-3.9.6}

MAVEN_DIR="$HOME/Apps/maven"
MAVEN_TAR="apache-maven-$MAVEN_VERSION-bin.tar.gz"
MAVEN_FOLDER="apache-maven-$MAVEN_VERSION"
MAVEN_URL="https://dlcdn.apache.org/maven/maven-3/$MAVEN_VERSION/binaries/$MAVEN_TAR"

# Create directory and download
mkdir -p "$MAVEN_DIR"
cd "$MAVEN_DIR"

echo "Downloading Maven $MAVEN_VERSION..."
curl --progress-bar -O "$MAVEN_URL"

# Extract and clean up
tar -xzvf "$MAVEN_TAR"
rm "$MAVEN_TAR"
chmod -R a+rwx "$MAVEN_FOLDER"

# Update .bashrc
echo "" >> "$HOME/.bashrc"
echo "export M2_HOME=$MAVEN_DIR/$MAVEN_FOLDER" >> "$HOME/.bashrc"
echo 'export PATH="$M2_HOME/bin:$PATH"' >> "$HOME/.bashrc"

echo "Maven $MAVEN_VERSION installation complete."
echo "Restart your terminal or run: source ~/.bashrc"
