# **Git Hooks for Code Quality & Clean Repos with pre-commit**

This repository provides a configuration for the **[pre-commit](https://pre-commit.com/)** framework to enforce:
- ✅ **Ruff formatting** for Python code (auto-fixes enabled)
- ✅ **Ruff linting** for Python code (including rules similar to flake8-annotations, auto-fixes enabled)
- ✅ **Pyright type checking** for static analysis
- ✅ **Automatic output removal from Jupyter notebooks** using `nbstripout`

---

## **📌 Why Use This?**
Maintaining code quality is essential for managing complex codebases. This setup helps with:
- Consistent code style
- Improved code clarity and readability
- Better maintainability
- Cleaner Jupyter notebooks in version control

Learn more about [the purpose of enforcing code style](What_is_the_Purpose_of_CodeStyle.md).

---
## **📋 Prerequisites**
Before using these hooks, ensure you have:
- **Python** (3.8 or higher recommended, as per typical pre-commit tool requirements)
   *   If you don't have Python installed or need a specific version, consider using a tool like [UV](https://github.com/astral-sh/uv) for easy [installation of python Versions](https://docs.astral.sh/uv/concepts/python-versions/) and [environment management](https://docs.astral.sh/uv/pip/environments/)  and also very fast [management of python packages](https://docs.astral.sh/uv/pip/packages/) . It has been becoming the  new industry standart for new projects over the last couple of years. 
- **pip** (or **uv pip**)(for installing Python packages)
- **Git** (for version control and pre-commit integration)

---

## **🚀 Installation & Setup**

These instructions apply to both new projects and existing Git repositories.

1.  **Clone this repository (if starting anew) or navigate to your existing project.**
    ```sh
    # For a new project:
    # git clone <your-repo-url> my-new-project
    # cd my-new-project
    # git init # If not already a git repository

    # For an existing project:
    # cd /path/to/your-project
    ```

2.  **Ensure you have `requirements.txt` and `.pre-commit-config.yaml` from this template in your project root.**
    If you cloned this repository, they are already there. If integrating into an existing project, copy them over.
    **Note:** If you modify `.pre-commit-config.yaml` after the initial setup, remember to stage the changes (`git add .pre-commit-config.yaml`) before committing.

3.  **Create and activate a virtual environment (recommended):**
    ```sh
    python -m venv .venv
    source .venv/bin/activate  # On Windows use ` .venv\Scripts\activate`
    ```

4.  **Install Python dependencies:**
    This will install `pre-commit` and all the configured hook tools (Ruff, Pyright, nbstripout).
    ```sh
    pip install -r requirements.txt
    ```

5.  **Install the pre-commit hooks:**
    This command reads `.pre-commit-config.yaml` and sets up the git hooks.
    ```sh
    pre-commit install
    ```

Now, the hooks will run automatically on `git commit` for staged files.

---
## **⚙️ How It Works**

This project uses the [pre-commit](https://pre-commit.com/) framework to manage and run code quality checks before each commit. The configuration is defined in the `.pre-commit-config.yaml` file.

When you run `git commit`:
1.  **`pre-commit` is triggered.**
2.  It runs the configured hooks on the files staged for commit:
    *   **Ruff Formatter (`ruff-format`):** Automatically formats Python code. Files modified by the formatter are re-staged.
    *   **Ruff Linter (`ruff-check`):** Checks Python code for style issues, errors, and enforces rules (including type annotation checks, replacing `flake8-annotations`). Many issues are auto-fixed.
    *   **Pyright (`pyright`):** Performs static type checking on Python code.
    *   **nbstripout (`nbstripout`):** Removes output cells from Jupyter Notebooks (`.ipynb` files) to keep the repository clean and reduce diff sizes.

If any of these hooks report errors (and cannot auto-fix them), the commit will be aborted. You'll need to fix the reported issues and `git add` the files again before re-attempting the commit.

### **Manually Running Hooks**

You can run the hooks on all files in the repository at any time:
```sh
pre-commit run --all-files
```
Or on specific files:
```sh
pre-commit run --files path/to/file1.py path/to/notebook.ipynb
```

To update the hook versions (defined in `.pre-commit-config.yaml`) to their latest releases:
```sh
pre-commit autoupdate
```

---

## **🔧 Troubleshooting**

### **Hooks aren't running during commits**
1.  **Verify `pre-commit` is installed in your environment:**
    ```sh
    pip show pre-commit
    ```
    If not found, reinstall dependencies: `pip install -r requirements.txt`
2.  **Ensure hooks are installed for your local Git repo:**
    Run `pre-commit install` again. This should confirm if hooks are already installed or install them.
3.  **Check the `.git/hooks/pre-commit` file:**
    It should be a script managed by the `pre-commit` framework. Tampering with it directly can break the setup.

### **Tool-specific errors (Ruff, Pyright, nbstripout)**
-   Consult the specific tool's documentation for error messages.
-   Ensure the versions in `.pre-commit-config.yaml` are compatible with your code or update them using `pre-commit autoupdate` and test.
-   Ruff's behavior (including annotation checks) is configured in `pyproject.toml`.

### **"command not found" for a hook**
-   This usually means the tool (e.g., `ruff`, `pyright`) didn't install correctly via `pip install -r requirements.txt`.
-   Try reinstalling dependencies in a clean virtual environment.
-   Ensure your `PATH` is correctly configured if you have multiple Python versions or environments.

---

## **🔗 Next Steps & References**
-   **[pre-commit Documentation](https://pre-commit.com/):** The official site for the pre-commit framework.
-   **[Ruff](https://docs.astral.sh/ruff/):** Documentation for the Ruff linter and formatter.
-   **[Pyright (Microsoft Pyright GitHub)](https://github.com/microsoft/pyright):** Information on the Pyright type checker.
-   **[nbstripout (GitHub)](https://github.com/kynan/nbstripout):** For `nbstripout` details.
-   **`.pre-commit-config.yaml`:** Review this file in the repository to see the exact hook configurations.
-   **`pyproject.toml`:** Review this file for Ruff's specific linting and formatting rules.

🚀 **Happy coding with clean, high-quality commits!**
