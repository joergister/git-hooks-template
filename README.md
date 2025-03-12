# Git Hooks for Code Quality & Clean Repos

This repository provides a **pre-commit hook** that enforces:
- ✅ **Ruff linting & formatting** for Python code
- ✅ **Pyright type checking** for static analysis
- ✅ **Automatic image removal from Jupyter notebooks**

## 🚀 Installation

To use this in your projects, follow these steps:

### **1️⃣ Clone This Repository**
```sh
git clone <your-repo-url>
cd git-hooks-template
```

### **2️⃣ Copy It to Your New Project**
Inside your new project directory:

```sh
cp -r ../git-hooks-template/.hooks .
cp ../git-hooks-template/setup-hooks.sh .
```

### **3️⃣ Install the Hooks**
Run:

```sh
./setup-hooks.sh
```

Now, your project has the Git hooks installed, and they will run automatically before every commit!

## 🎯 How It Works
- Ruff ensures code quality (linting & formatting).
- Pyright enforces type checking.
- Jupyter notebooks are cleaned to remove unnecessary images.

## 🛠 Updating Hooks
To update hooks from this template in an existing project:

```sh
cp -r ../git-hooks-template/.hooks .
./setup-hooks.sh
```

## 🔥 Want Full Automation?
You can modify your new project setup script to include:

```sh
git clone <your-repo-url> hooks
cd hooks
./setup-hooks.sh
```

## 📌 Why Use This?
- Enforces code style & type checking automatically
- Prevents large notebook files from bloating your repo
- Works on any Git platform (GitHub, GitLab, Bitbucket, etc.)

---

## **📌 Using in New Projects**
Whenever you start a new project, you can reuse the hooks:

1. Clone your new project:
```sh
git clone <your-new-project-repo>
cd <your-new-project>
```

2. Copy hooks from the template:
```sh
git clone <your-hooks-repo> temp-hooks
cp -r temp-hooks/.hooks .
cp temp-hooks/setup-hooks.sh .
rm -rf temp-hooks
```

3. Run the setup script:
```sh
./setup-hooks.sh
```

Now your new project has Git hooks installed automatically. 🚀
