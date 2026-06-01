#!/bin/bash

# Build pokeemerald, move to Windows Desktop, and open with VBA-M
# Source file in WSL
WSL_FILE="/home/wyatt/pokeemerald/pokeemerald.gba"

# Destination on Windows Desktop
WINDOWS_DESKTOP="/mnt/c/Users/Wyatt/Desktop/pokeemerald.gba"

# Windows Desktop path (converted for cmd.exe)
WINDOWS_DESKTOP_CMD="C:\Users\Wyatt\Desktop\pokeemerald.gba"

# Project directory
PROJECT_DIR="/home/wyatt/pokeemerald"

echo "Building pokeemerald..."

# Change to project directory
cd "$PROJECT_DIR" || {
    echo "Error: Could not change to project directory at $PROJECT_DIR"
    exit 1
}

# Run make to build the project
if ! make; then
    echo "Error: Build failed"
    exit 1
fi

echo "Build successful!"

# Check if source file exists after build
if [ ! -f "$WSL_FILE" ]; then
    echo "Error: Built file not found at $WSL_FILE"
    exit 1
fi

# Verify Windows Desktop path is accessible
if [ ! -d "/mnt/c/Users/Wyatt/Desktop" ]; then
    echo "Error: Windows Desktop path not accessible"
    exit 1
fi

# Move the file
if mv "$WSL_FILE" "$WINDOWS_DESKTOP"; then
    echo "Success! File moved to $WINDOWS_DESKTOP"
else
    echo "Error: Failed to move file"
    exit 1
fi

# Open with VBA-M on Windows using proper Windows path format
echo "Opening with VBA-M..."
cmd.exe /c start "" "$WINDOWS_DESKTOP_CMD"

echo "Done!"
