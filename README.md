# **🚀 Git Hooks for Code Quality & Clean Repos**

This repository provides a **pre-commit hook** that enforces:
- ✅ **Ruff linting & formatting** for Python code
- ✅ **Pyright type checking** for static analysis
- ✅ **Automatic image removal from Jupyter notebooks**

---

## **📌 Why Use This?**
- **Consistent Code Quality**: Enforces style and type checking automatically  
- **Clean Repositories**: Prevents large notebook files from bloating your repo  
- **Platform Agnostic**: Works on any Git platform (GitHub, GitLab, Bitbucket, etc.)  

---
📌 **How It Works:**  
- When committing files, only **staged** (`git add`-ed) files are checked.  
- If an issue is found, the commit is **blocked** until the problems are fixed.  
- The hook ensures **all code committed after the installation of the pre-commit-hook meets quality standards** before it reaches the repository. 


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

📌 **How It Works:**  
- This setup ensures that **from the very first commit**, your project follows best practices.  
- Every commit is automatically checked for **linting, type safety, and Jupyter image removal**.  

---

## **🎯 How It Works**
When you commit code, the pre-commit hook automatically:
- Runs **Ruff** to check code style and formatting  
- Runs **Pyright** to verify type correctness  
- Removes **image outputs from Jupyter notebooks** to keep your repo clean  

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

