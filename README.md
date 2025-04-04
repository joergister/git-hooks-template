# **🚀 Git Hooks for Code Quality & Clean Repos**

This repository provides a **pre-commit hook** that enforces:
- ✅ **Ruff linting & formatting** for Python code (with auto-formatting enabled)
- ✅ **Pyright type checking** for static analysis
- ✅ **flake8-annotations** to ensure all functions have explicit type annotations
- ✅ **Automatic image removal from Jupyter notebooks** (without running code quality checks on them)


---

## **📌 Why Use This?**
Maintaining code quality is essential for managing complex codebases. Learn more about [the purpose of enforcing code style](What%20is%20the%20Purpose%20of%20CodeStyle%3F.md) and how it helps with:

- Knowledge management
- Faster debugging
- Improved code clarity
- Better maintainability

---
## 📋 How It Works
When you commit code, the pre-commit hook automatically performs the following steps:
1. **Auto-formatting**:  
   - Python files are auto-formatted using Ruff with the `--fix` flag.
   - The modified files are re-added to the staging area.
2. **Code Quality Checks on Python Files**:  
   - **Ruff** checks code style and formatting.
   - **flake8-annotations** ensures every function includes explicit type annotations.
   - **Pyright** verifies type correctness.
3. **Jupyter Notebook Processing**:  
   - Notebook files are processed solely to remove embedded image outputs (using `jq`), keeping them lightweight without performing other code quality checks.

If any issues are detected in Python files, the commit is blocked until the problems are resolved. Only staged files are processed.




---

## **📋 Prerequisites**
Before using these hooks, ensure you have:
- **Python** (3.7 or higher)  
- **jq** for Jupyter notebook processing (required for notebook image removal)  
- **Required Python packages** (installed via `requirements.txt` with `pip` or `uv`)  

---

## **🚀 Installation**

### **Option 1: Setting Up Hooks for an Existing Project**
> This method installs the hooks into an **already existing Git repository**.  
> Only **new or modified** files will be checked when committing.

1. **Navigate to your existing project directory**  
   ```sh
   cd /path/to/your-project
   ```

2. **Clone the hook repository (temporarily)**  
   ```sh
   git clone <Repo-URL> temp-hooks
   ```

3. **Copy the necessary files into your project**  
   ```sh
   cp -r temp-hooks/.hooks .  # Copies the hooks folder
   cp temp-hooks/setup-hooks.sh .  # Copies the setup script
   ```

4. **Merge dependencies into your existing `requirements.txt`**  
   ```sh
   cat temp-hooks/requirements.txt >> requirements.txt
   sort -u requirements.txt -o requirements.txt  # Remove duplicates
   ```

5. **Clean up the temporary hook repo**  
   ```sh
   rm -rf temp-hooks
   ```

6. **Install dependencies and enable the pre-commit hook**  
   ```sh
   pip install -r requirements.txt
   ./setup-hooks.sh
   ```
This will:

- Install the pre-commit hook
- Ensure pyproject.toml is configured (creates one if missing)
- Set the maximum function length to 50 statements using Ruff

7. **Verify the hook is installed**  
   ```sh
   ls -la .git/hooks/pre-commit
   ```  
   You should see a **symbolic link** pointing to `../../.hooks/pre-commit`.


---

### **Option 2: Using This as a Starting Point for a New Project**
> Use this if you're starting a fresh project and want to include these hooks from the beginning.

1. **Clone this repository**  
   ```sh
   git clone <your-repo-url> my-new-project
   cd my-new-project
   ```

2. **Initialize a new Git repository (if starting from scratch)**  
   ```sh
   git init
   ```

3. **Install dependencies and set up hooks**  
   ```sh
   pip install -r requirements.txt
   ./setup-hooks.sh
   ```

4. **Verify installation**  
   ```sh
   ls -la .git/hooks/pre-commit
   ```  




---

## **🔧 Troubleshooting**
### **Hooks aren't running during commits**
- Verify installation with:  
  ```sh
  ls -la .git/hooks/
  ```
- Ensure the pre-commit hook is **executable**:  
  ```sh
  chmod +x .hooks/pre-commit
  ```
- Make sure you **ran the setup script**:  
  ```sh
  ./setup-hooks.sh
  ```

### **jq command not found**
The hook uses `jq` to process Jupyter notebooks. Install it using:
- macOS: `brew install jq`
- Ubuntu/Debian: `sudo apt-get install jq`
- Windows: `choco install jq` or download from [GitHub](https://github.com/jqlang/jq) or the [official website](https://jqlang.org/download/)

---

## **🔗 Next Steps**
- [Customize pre-commit hooks](https://pre-commit.com/)  
- [Learn more about Ruff](https://github.com/charliermarsh/ruff)  
- [Read about Pyright](https://github.com/microsoft/pyright)  


🚀 **Happy coding with clean, high-quality commits!**

