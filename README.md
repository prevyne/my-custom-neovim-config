# Custom Neovim Configuration 

A lightweight, highly optimized Neovim configuration built for speed and efficiency. This setup is tailored specifically for backend development (Python/Django) and C programming, wrapped in a high-contrast, terminal-focused aesthetic.

## Core Perks & Aesthetics
*   **Hacker Aesthetic:** Uses a custom `hacker_green_ultimate` color scheme out of the box.
*   **True Transparency:** The background for normal text and floating windows is completely transparent to blend seamlessly with your terminal.
*   **Performance Focused:** Utilizes `lazy.nvim` as the plugin manager, ensuring plugins are only loaded when absolutely necessary.
*   **Backend & Systems Ready:** Out-of-the-box language server support for Python (Pyright) and C/C++ (Clangd).
*   **Smart Python Environment Detection:** Automatically detects local `.venv` directories or global virtual environments to ensure accurate code analysis.

## Prerequisites
Before installing, ensure your system has the following dependencies:
*   **Neovim:** Version 0.11 or higher (required for native LSP configurations).
*   **C Compiler:** `gcc` must be installed to utilize the custom C-compilation keymaps.
*   **Python 3:** Needed for environment resolution.

## Installation
1.  **Backup your existing configuration:**
    ```bash
    mv ~/.config/nvim ~/.config/nvim.bak
    mv ~/.local/share/nvim ~/.local/share/nvim.bak
    ```
2.  **Clone my repository:**
    ```bash
    git clone https://github.com/prevyne/my-custom-neovim-config.git ~/.config/nvim
    ```
3.  **Start Neovim:**
    
```bash
    nvim
    ```
    *The `lazy.nvim` package manager will automatically bootstrap itself and install all required plugins upon the first launch.*

## 🧩 Plugin Ecosystem
This setup utilizes a curated list of powerful plugins to enhance the developer experience without bloating system memory:
*   **Plugin Manager:** `lazy.nvim`.
*   **LSP & Tooling:** 
    *   `mason.nvim` and `mason-lspconfig` automatically manage language servers.
    *   Pre-configured servers include `pyright`, `clangd`, `html`, and `emmet_ls`.
*   **Autocompletion:** `nvim-cmp` paired with `LuaSnip` for fast, buffer, path, and LSP-aware snippet completion.
*   **Fuzzy Finding:** `fzf-lua` (with `nvim-web-devicons`) for lightning-fast file and text searching.
*   **Syntax Highlighting:** 
    *   `nvim-treesitter` handles HTML, CSS, and JavaScript.
    *   `semshi` is explicitly used for superior Python syntax highlighting, with Treesitter's Python parsing disabled to prevent conflicts. Error signs in `semshi` are disabled to reduce visual clutter.
*   **Linting & Formatting:** `nvim-lint` and `none-ls.nvim` are integrated, triggering tools like `flake8`, `pycodestyle`, and `luacheck` automatically when saving or leaving insert mode.

## ⌨️ Keybindings & Usage
The leader key is mapped to `<Space>`.

### General Navigation & Search (Fzf-Lua)
*   `<leader>ff`: Find files.
*   `<leader>fc`: Find changes.
*   `<leader>fcs`: Switch color schemes.
*   `<leader>lg`: Live grep (search words across the entire codebase).
*   `<leader>h`: Clear search highlighting.

### Code Execution (C/C++)
*   `<F5>`: Instantly compile the current C file using `gcc`.
*   `<F6>`: Execute the compiled C program.

### Language Server Protocol (LSP)
*   `gd`: Go to definition.
*   `gD`: Go to declaration.
*   `gr`: Find references.
*   `gi`: Go to implementation.
*   `K`: Hover for documentation.
*   `<leader>rn`: Rename symbol.
*   `<leader>ca`: View code actions.
*   `[d` / `]d`: Navigate to previous/next diagnostic.

### Autocompletion
*   `<C-Space>`: Trigger completion menu.
*   `<CR>`: Confirm selection.
*   `<Tab>` / `<S-Tab>`: Cycle forward/backward through completion items.

## Filetype Specifics
*   **Django:** Any `.html` file is automatically detected and treated as `htmldjango` for proper template syntax highlighting and support.
*   **Indentation:** Defaults strictly enforce 4 spaces for tabs (`shiftwidth = 4`, `tabstop = 4`, `expandtab = true`).
