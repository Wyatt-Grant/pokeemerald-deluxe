#!/bin/bash

# Build pokeemerald-deluxe, move to Windows Desktop, and open with VBA-M
# Project directory (the Windows working tree, mounted in WSL — builds exactly
# what you edit in C:\Users\Wyatt\Dev\pokeemerald-deluxe, so no clone drift).
PROJECT_DIR="/mnt/c/Users/Wyatt/Dev/pokeemerald-deluxe"

# Source ROM produced by the build (FILE_NAME = pokeemerald)
WSL_FILE="$PROJECT_DIR/pokeemerald.gba"

# Destination on Windows Desktop
WINDOWS_DESKTOP="/mnt/c/Users/Wyatt/Desktop/pokeemerald.gba"

# Windows Desktop path (converted for cmd.exe)
WINDOWS_DESKTOP_CMD="C:\Users\Wyatt\Desktop\pokeemerald.gba"

echo "Building pokeemerald-deluxe..."

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

# Copy the file (source already lives on the C: drive, so copy rather than move)
if cp "$WSL_FILE" "$WINDOWS_DESKTOP"; then
    echo "Success! File copied to $WINDOWS_DESKTOP"
else
    echo "Error: Failed to copy file"
    exit 1
fi

# Open with VBA-M on Windows using proper Windows path format
echo "Opening with VBA-M..."
cmd.exe /c start "" "$WINDOWS_DESKTOP_CMD"

echo "Done!"
