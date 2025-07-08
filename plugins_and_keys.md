# Neovim Plugins and Keybindings Reference

## Core Navigation

### Window Navigation
- `<C-h>` - Move focus to the left window
- `<C-l>` - Move focus to the right window  
- `<C-j>` - Move focus to the lower window
- `<C-k>` - Move focus to the upper window

### Buffer Navigation
- `<leader>bn` - Next buffer
- `<leader>bp` - Previous buffer
- `<leader>bl` - List all buffers
- `<leader>bd` - Delete current buffer
- `<leader>bw` - Wipe current buffer
- `<leader><leader>` - Find existing buffers (Telescope)

## File Navigation

### Telescope (Fuzzy Finder)
- `<leader>sh` - Search help tags
- `<leader>sk` - Search keymaps
- `<leader>sp` - Search files
- `<C-p>` - Find files (VSCode-like)
- `<leader>ss` - Search Telescope builtins
- `<leader>sw` - Search current word
- `<leader>sg` - Search by grep
- `<C-f>` - Live grep (VSCode-like)
- `<leader>sd` - Search diagnostics
- `<leader>sr` - Resume last search
- `<leader>s.` - Search recent files
- `<leader>/` - Fuzzy search in current buffer
- `<leader>s/` - Search in open files
- `<leader>sn` - Search Neovim config files

### Nvim-tree (File Explorer)
- `<leader>TT` - Toggle file tree
- `<leader>Te` - Find current file in tree
- `<leader>Tc` - Collapse tree
- `<leader>Tb` - Focus tree window

### Flash.nvim (Fast Navigation)
- `s` - Jump to any character (normal/visual mode)
- `S` - Jump using treesitter nodes
- `r` - Remote flash (operator mode)
- `R` - Treesitter search (operator/visual mode)
- `<C-s>` - Toggle flash search (command mode)

## Code Navigation & Editing

### LSP
- `grn` - Rename symbol
- `gra` - Code action
- `grr` - Go to references
- `gri` - Go to implementation
- `grd` - Go to definition
- `grD` - Go to declaration
- `gO` - Document symbols
- `gW` - Workspace symbols
- `grt` - Go to type definition
- `<leader>th` - Toggle inlay hints

### Diagnostics
- `<leader>q` - Open diagnostic quickfix list
- `<leader>xx` - Toggle diagnostics (Trouble)
- `<leader>xX` - Buffer diagnostics (Trouble)
- `<leader>xs` - Symbols (Trouble)
- `<leader>xl` - LSP definitions/references (Trouble)
- `<leader>xL` - Location list (Trouble)
- `<leader>xQ` - Quickfix list (Trouble)

### Folding
- `za` - Toggle fold
- `zA` - Toggle all folds recursively
- `zc` - Close fold
- `zo` - Open fold
- `zC` - Close all folds recursively
- `zO` - Open all folds recursively
- `zr` - Reduce folding (open one level)
- `zR` - Open all folds
- `zm` - More folding (close one level)
- `zM` - Close all folds

## Git Integration

### Gitsigns
- `]c` - Next git change
- `[c` - Previous git change
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk
- `<leader>hS` - Stage buffer
- `<leader>hR` - Reset buffer
- `<leader>hp` - Preview hunk
- `<leader>hb` - Blame line
- `<leader>hd` - Diff this
- `<leader>hD` - Diff this ~
- `<leader>tb` - Toggle blame line

### LazyGit
- `<leader>gg` - Open LazyGit
- `<leader>gf` - LazyGit filter
- `<leader>gc` - LazyGit current file

## Session Management (Possession.nvim)
- `<leader>qs` - Save session
- `<leader>ql` - Load session
- `<leader>qd` - Delete session
- `<leader>qL` - List sessions

## Editing

### Comment.nvim
- `gcc` - Toggle line comment
- `gbc` - Toggle block comment
- `gc` - Comment operator (e.g., `gcap` comments a paragraph)
- `gb` - Block comment operator

### Mini.surround
- `saiw)` - Surround add inner word with parentheses
- `sd'` - Surround delete quotes
- `sr)'` - Surround replace parentheses with quotes

### Formatting
- `<leader>f` - Format buffer

## UI & Toggles
- `<leader>t` - Toggle prefix (various toggles)
- `<Esc>` - Clear search highlights
- `<Esc><Esc>` - Exit terminal mode

## Disabled Keys
- Arrow keys in normal mode - Shows message to use hjkl

## Plugin List

1. **Core Plugins**
   - `vim-sleuth` - Auto-detect indentation
   - `todo-comments.nvim` - Highlight TODOs in comments

2. **UI Plugins**
   - `catppuccin` - Colorscheme
   - `which-key.nvim` - Shows keybindings
   - `trouble.nvim` - Better diagnostics UI
   - `mini.statusline` - Statusline

3. **Editor Enhancement**
   - `telescope.nvim` - Fuzzy finder
   - `flash.nvim` - Fast navigation
   - `possession.nvim` - Session management
   - `Comment.nvim` - Smart commenting
   - `mini.ai` - Better text objects
   - `mini.surround` - Surround functionality

4. **File Management**
   - `nvim-tree.lua` - File explorer

5. **Git Integration**
   - `gitsigns.nvim` - Git signs in gutter
   - `lazygit.nvim` - LazyGit integration

6. **LSP & Completion**
   - `nvim-lspconfig` - LSP configuration
   - `mason.nvim` - LSP installer
   - `blink.cmp` - Completion engine
   - `LuaSnip` - Snippet engine
   - `conform.nvim` - Formatting

7. **Syntax & Highlighting**
   - `nvim-treesitter` - Better syntax highlighting

8. **Development Tools**
   - `nvim-dap` - Debug Adapter Protocol
   - `nvim-lint` - Linting
   - `nvim-autopairs` - Auto-close brackets
   - `indent-blankline.nvim` - Indentation guides