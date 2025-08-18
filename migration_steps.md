# Migration Steps for New Config Structure
## Steps to Apply Changes:
1. **First, quit Neovim completely** (important!)
2. **Backup your current setup** (optional but recommended):
   ```bash
   cd ~/.config
   cp -r nvim nvim.backup
   ```
3. **Start Neovim** - You might see some errors on first launch, that's normal
4. **Run these commands in order**:
   ```vim
   :Lazy sync
   ```
   
   This will:
   - Install new plugins (possession.nvim, lazygit.nvim, flash.nvim, trouble.nvim)
   - Update existing plugins
   - Remove any unused plugins
5. **Restart Neovim** after sync completes
6. **If you see any errors**, run:
   ```vim
   :Lazy update
   :Lazy clean
   ```
7. **For LSP servers**, they'll be auto-installed when you open relevant files, or manually install with:
   ```vim
   :Mason
   ```
   Then press `i` on any server you want to install
## Verify Everything Works:
- Try `<leader>TT` to toggle nvim-tree
- Try `s` in normal mode to test flash.nvim
- Try `<leader>gg` to open lazygit (requires lazygit installed)
- Check `:checkhealth` for any issues
## Troubleshooting:
If you get errors about missing modules:
1. Make sure you're in the nvim directory
2. Check that all files were created properly
3. Try `:Lazy clean` then `:Lazy sync` again
If specific plugins fail:
- Check `:Lazy` to see which ones failed
- Try installing them individually