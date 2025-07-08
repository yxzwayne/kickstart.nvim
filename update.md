# Update History

## 2025-07-08 Tuesday

### Major Refactoring and Feature Additions

**Structural Changes:**
- Completely refactored init.lua into a modular structure:
  - `lua/config/` - Core configuration (options, keymaps, autocmds, lazy.nvim bootstrap)
  - `lua/plugins/` - Plugin configurations organized by category (core, ui, editor, lsp, completion, treesitter)
- Unified all keymaps into `lua/config/keymaps.lua` with consistent descriptions
- Fixed global `vim.getVisualSelection()` function - now properly scoped as local in `plugins/editor.lua`

**New Plugins Added:**
- `possession.nvim` - Session management with auto-save functionality
- `lazygit.nvim` - Git UI integration
- `flash.nvim` - Fast navigation with character jumps
- `trouble.nvim` - Enhanced diagnostics UI

**Keybinding Updates:**
- Changed nvim-tree keybindings from `<leader>t` to `<leader>T` (capital T) to avoid conflicts
- Added descriptions to all buffer navigation keymaps
- Added comprehensive folding keymaps with descriptions

**LSP Enhancements:**
- Added language servers: `ts_ls`, `clangd`, `pyright`, `rust_analyzer`, `jdtls`
- Improved LSP configuration with server-specific settings

**Editor Improvements:**
- Enabled relative line numbers
- Increased scrolloff from 10 to 20
- Added treesitter-based folding configuration
- Improved Telescope configuration with visual selection support

**Documentation:**
- Created `plugins_and_keys.md` - Complete reference for all plugins and keybindings
- Added migration steps guide
- Documented all custom keybindings and plugin functionality