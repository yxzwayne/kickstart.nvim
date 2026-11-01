# Applying configuration changes

1. Save your work and quit Neovim completely.
2. Review the configuration diff and preserve any local changes before pulling or merging.
3. Start Neovim and run `:Lazy restore` to install plugins at the revisions in
   `lazy-lock.json`. Restart Neovim afterward.
4. Open `:Lazy` and check for failed installation or build tasks.

Use `:Lazy update` only when you intend to update plugin versions. Review the
resulting `lazy-lock.json` diff and test before committing it. `:Lazy sync` also
updates plugins; it is not needed just to apply configuration edits.

The old nvim-tree, which-key, nvim-autopairs, and Catppuccin specs have been
removed. Inspect the unused plugin list in `:Lazy` before choosing to clean it.
Their replacements are mini.files, mini.clue, mini.pairs, and Neovim's default
colorscheme. The `nvim-web-devicons` dependency is still used for icons.

## Verify

- `Ctrl-P`: find a file; `Ctrl-F`: search its contents.
- `Space e`: browse files with `h`/`l`, open and close with `L`, or close with `q`.
- Space, then pause: show key hints.
- In a disposable buffer, type an opening bracket or quote to check pairing.
- Open a Lua file and confirm syntax highlighting.
- `Space gg`: open LazyGit, if installed.
- `:ConformInfo`: check whether StyLua is available for manual Lua formatting.
- `:checkhealth`: inspect any remaining dependency or provider issues.

LSP servers are not configured or automatically installed. Mason remains a
debugger dependency; its presence does not enable LSP. Formatting runs only when
requested, and nvim-lint currently has no linters configured.

## Native plugin problems

Treesitter parsers and Telescope's native fuzzy-search extension must match the
architecture of the Neovim executable. If highlighting or fuzzy search fails
after changing machines or Neovim builds, inspect `:messages` and `:checkhealth`.
Rebuild the affected parsers with `:TSUpdate` and the native extension using its
build action in `:Lazy`, then restart Neovim.
