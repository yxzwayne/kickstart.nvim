# Wayne's Neovim configuration

A modular personal fork of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).

## Current setup

- **Files and search:** mini.files, Telescope, and Flash.
- **Editing:** Treesitter highlighting, mini.ai, mini.surround, mini.pairs, and Comment.nvim.
- **UI:** Neovim's default colorscheme, mini.clue key hints, mini.statusline, and bufferline.
- **Git:** Gitsigns and LazyGit.
- **Completion:** blink.cmp with path, snippet, and lazydev sources. LSP is disabled.
- **Formatting:** manual Lua formatting with Conform and an installed `stylua` executable.
- **Diagnostics:** Trouble and nvim-lint are available; no LSP servers or linters are configured.
- **Sessions and debugging:** possession.nvim and DAP with Go/Delve configuration.

## Install

Install Neovim, Git, `make`, a C compiler, and `ripgrep`. `fd` is optional for
Telescope file search. LazyGit, StyLua, and Go are needed only for their respective
features. Icons are enabled in `lua/config/options.lua` and expect a Nerd Font.
A working system clipboard provider is needed for clipboard integration.

Preserve any existing configuration before cloning this repository into its place:

```sh
git clone git@github.com:yxzwayne/kickstart.nvim.git ~/.config/nvim
```

For HTTPS, use `https://github.com/yxzwayne/kickstart.nvim.git` instead.
Start `nvim`; lazy.nvim bootstraps and installs the configured plugins.
The repository's `lazy-lock.json` records plugin revisions; use `:Lazy restore`
to restore those revisions, then restart Neovim.

## Everyday keys

Leader is **Space**. Use these from Normal mode:

| Keys | Action |
| --- | --- |
| `Ctrl-P` | Find a file by name |
| `Ctrl-F` | Search file contents with ripgrep |
| `Space e` | Toggle mini.files around the current file |
| `Space Space` | Switch buffers with Telescope |
| `Space sk` | Search keybindings |
| `Space sh` | Search help |
| `Space gg` | Open LazyGit |
| `Space GF` | Manually format |

Pause after Space, `g`, `z`, `Ctrl-W`, `[` or `]` for key hints.
See [plugins_and_keys.md](plugins_and_keys.md) for the complete reference.

## Where to change things

`init.lua` loads these modules in order:

- `lua/config/options.lua`: leader, display, indentation, clipboard, and folding.
- `lua/config/keymaps.lua`: general editing and navigation mappings.
- `lua/config/autocmds.lua`: yank highlighting and filetype indentation.
- `lua/config/lazy.lua`: plugin manager bootstrap and imports.

Plugin specs live in `lua/plugins/`, `lua/kickstart/plugins/`, and
`lua/custom/plugins/`. All three directories are imported. Plugin-specific
mappings live alongside the plugin setup; Telescope and the Mini modules are in
`lua/plugins/editor.lua`.

See [migration_steps.md](migration_steps.md) for applying changes to an existing
installation. [update.md](update.md) contains historical notes.
