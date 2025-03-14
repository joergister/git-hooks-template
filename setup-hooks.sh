#!/bin/bash

echo "🔧 Setting up Git hooks..."

# Ensure hooks directory exists
mkdir -p .git/hooks

# Symlink the pre-commit hook
echo "🔗 Installing pre-commit hook..."
ln -sf ../../.hooks/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit

# Ensure pyproject.toml exists and contains Ruff settings
PYPROJECT_FILE="pyproject.toml"

if [ ! -f "$PYPROJECT_FILE" ]; then
    echo "📄 No pyproject.toml found. Creating one with Ruff configuration..."
    cat <<EOL > $PYPROJECT_FILE
[tool.ruff]
# Enforce function length limits

[tool.ruff.lint]
extend-select = ["PLR0915"]  # Enable Pylint's "too-many-statements" rule

[tool.ruff.lint.pylint]
max-statements = 50  # Set the maximum number of statements per function
EOL
else
    echo "✅ pyproject.toml found. Ensuring Ruff settings..."
    
    # Check if the Ruff configuration already exists
    if ! grep -q "\[tool.ruff\]" "$PYPROJECT_FILE"; then
        echo "🔧 Adding Ruff configuration to pyproject.toml..."
        cat <<EOL >> $PYPROJECT_FILE

[tool.ruff]
# Enforce function length limits

[tool.ruff.lint]
extend-select = ["PLR0915"]  # Enable Pylint's "too-many-statements" rule

[tool.ruff.lint.pylint]
max-statements = 50  # Set the maximum number of statements per function
EOL
    else
        echo "⚠️ Ruff configuration already exists in pyproject.toml. Please check manually if needed."
    fi
fi

echo "✅ Git hooks and Ruff configuration installed successfully!"
