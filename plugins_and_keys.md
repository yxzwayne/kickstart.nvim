# Neovim Plugins and Keybindings Reference

## Current Status

Leader is **Space**. Unless stated otherwise, shortcuts below are used in Normal mode.

- LSP setup is disabled.
- Completion remains enabled through `blink.cmp` with path, snippet, and lazydev sources.
- Formatting remains manual through Conform.
- Diagnostics UI remains available through Trouble, but no LSP servers or linters are configured here. Symbols need an LSP server.

## Core Navigation

### Window Navigation

- `<C-h>` - Move focus to the left window
- `<C-l>` - Move focus to the right window
- `<C-j>` - Move focus to the lower window
- `<C-k>` - Move focus to the upper window

### Buffer Navigation

- `bn` - Next buffer
- `bp` - Previous buffer
- `bl` - List buffers
- `bd` - Delete current buffer
- `<leader><leader>` - Find existing buffers with Telescope

## Search and Files

### Telescope

- `<C-p>` - Find files with fuzzy filename search
- `<leader>sh` - Search help tags
- `<leader>sk` - Search keymaps
- `<leader>sp` - Search files
- `<leader>ss` - Search Telescope builtins
- `<leader>sw` - Search current word or selected text
- `<leader>sg` - Live grep
- `<C-f>` - Live grep
- `<leader>sd` - Search diagnostics
- `<leader>sr` - Resume last search
- `<leader>s.` - Search recent files
- `<leader>/` - Fuzzy search current buffer
- `<leader>s/` - Search open files
- `<leader>sn` - Search Neovim config files

### Mini.files

- `<leader>e` - Toggle explorer at the current file (cwd for unnamed/special buffers)
- `h` / `l` - Navigate to parent / open directory or file
- `L` - Open file and close explorer
- `q` - Close explorer
- `g?` - Show explorer help
- Edit entries with normal Vim commands to create, rename, move, or delete; `=` reviews and applies changes

### Mini.clue

- Key hints appear after 300 ms for leader mappings, `g`, `z`, `<C-w>`, `[` and `]`.

### Flash.nvim

- `s` - Jump
- `S` - Treesitter jump
- `r` - Remote Flash in operator mode
- `R` - Treesitter search in operator or visual mode
- `<C-s>` - Toggle Flash search in command mode

## Editing

- `<Esc>` - Clear search highlights
- `<Esc><Esc>` - Exit terminal mode
- `<A-S-C>` - Copy absolute file path to clipboard
- `gd` - Built-in local declaration search (no LSP)
- `dd` - Delete line without copying
- `<leader>dd` - Original `dd` behavior
- Arrow keys in normal mode - Show a reminder to use `hjkl`

### Comment.nvim

- `gcc` - Toggle line comment
- `gbc` - Toggle block comment
- `gc` - Comment operator
- `gb` - Block comment operator

### Folding

- `za` - Toggle fold
- `zA` - Toggle all folds recursively
- `zc` - Close fold
- `zo` - Open fold
- `zC` - Close all folds recursively
- `zO` - Open all folds recursively
- `zr` - Reduce folding by opening one more level
- `zR` - Open all folds
- `zm` - Increase folding by closing one more level
- `zM` - Close all folds

### Formatting

- `<leader>GF` - Format buffer with Conform (Lua via `stylua`; executable must be installed)

## Diagnostics

- `<leader>q` - Open diagnostic location list
- `<leader>xx` - Toggle diagnostics in Trouble
- `<leader>xX` - Toggle buffer diagnostics in Trouble
- `<leader>xs` - Toggle symbols in Trouble
- `<leader>xL` - Toggle location list in Trouble
- `<leader>xQ` - Toggle quickfix list in Trouble

## Git

### Gitsigns

- `]c` - Next git change
- `[c` - Previous git change
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk
- `<leader>hS` - Stage buffer
- `<leader>hu` - Undo stage hunk
- `<leader>hR` - Reset buffer
- `<leader>hp` - Preview hunk
- `<leader>hb` - Blame line
- `<leader>hd` - Diff against index
- `<leader>hD` - Diff against last commit
- `<leader>TD` - Preview deleted lines inline

### LazyGit

- `<leader>gg` - Open LazyGit
- `<leader>gf` - LazyGit filter
- `<leader>gc` - LazyGit current file

## Sessions

- `<leader>qs` - Save session
- `<leader>ql` - Load session
- `<leader>qd` - Delete session
- `<leader>qL` - List sessions

## Debugging

- `<F5>` - Start or continue debugging
- `<F1>` - Step into
- `<F2>` - Step over
- `<F3>` - Step out
- `<leader>B` - Set conditional breakpoint
- `<F7>` - Toggle DAP UI

## Active Plugin Groups

- Core: `vim-sleuth`, `todo-comments.nvim`
- UI: built-in default colorscheme, `mini.clue`, `mini.statusline`, `trouble.nvim`, `bufferline.nvim`
- Editing: `mini.ai`, `mini.surround`, `mini.pairs` (part of `mini.nvim`), `Comment.nvim`
- Search/navigation: `telescope.nvim`, `telescope-fzf-native.nvim`, `flash.nvim`
- Files: `mini.files` (part of `mini.nvim`)
- Git: `gitsigns.nvim`, `lazygit.nvim`
- Completion/snippets: `blink.cmp`, `LuaSnip`, `lazydev.nvim`
- Formatting/linting: `conform.nvim`, `nvim-lint`
- Syntax: `nvim-treesitter`, `indent-blankline.nvim`
- Debugging: `nvim-dap`, `nvim-dap-ui`, `mason-nvim-dap.nvim`, `nvim-dap-go`
