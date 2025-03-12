#!/bin/bash

echo "🔧 Setting up Git hooks..."

# Ensure hooks directory exists
mkdir -p .git/hooks

# Symlink the pre-commit hook
ln -sf ../../.hooks/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit

echo "✅ Git hooks installed successfully!"
