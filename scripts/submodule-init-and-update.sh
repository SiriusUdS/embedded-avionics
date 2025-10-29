#!/bin/bash

# Script to initialize and update all git submodules
# Usage: ./update_submodules.sh

set -e  # Exit on error

echo "================================"
echo "Git Submodule Update Script"
echo "================================"
echo ""

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Error: Not in a git repository!"
    exit 1
fi

# Check if .gitmodules exists
if [ ! -f .gitmodules ]; then
    echo "No .gitmodules file found. No submodules to update."
    exit 0
fi

echo "Initializing submodules..."
git submodule init

echo ""
echo "Updating submodules to latest commits..."
git submodule update --recursive --remote

echo ""
echo "Syncing submodule URLs (in case they changed)..."
git submodule sync --recursive

echo ""
echo "================================"
echo "Submodule Status:"
echo "================================"
git submodule status --recursive

echo ""
echo "✓ All submodules updated successfully!"