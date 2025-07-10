-- Script to check keybindings
local function check_mapping(mode, lhs)
  local maps = vim.api.nvim_get_keymap(mode)
  for _, map in ipairs(maps) do
    if map.lhs == lhs then
      print(string.format("Found mapping for %s in mode %s:", lhs, mode))
      print(string.format("  rhs: %s", map.rhs or ""))
      print(string.format("  expr: %s", map.expr and "true" or "false"))
      print(string.format("  noremap: %s", map.noremap and "true" or "false"))
      print(string.format("  silent: %s", map.silent and "true" or "false"))
      print(string.format("  nowait: %s", map.nowait and "true" or "false"))
      print(string.format("  buffer: %s", map.buffer and "true" or "false"))
      return true
    end
  end
  return false
end

print("Checking <C-p> mapping:")
local found_cp = false
for _, mode in ipairs({'n', 'i', 'v', 'x', 's', 'o', 't', 'c'}) do
  if check_mapping(mode, "<C-p>") then
    found_cp = true
  end
end
if not found_cp then
  print("No mapping found for <C-p> in any mode")
end

print("\nChecking <C-f> mapping:")
local found_cf = false
for _, mode in ipairs({'n', 'i', 'v', 'x', 's', 'o', 't', 'c'}) do
  if check_mapping(mode, "<C-f>") then
    found_cf = true
  end
end
if not found_cf then
  print("No mapping found for <C-f> in any mode")
end

-- Check if Telescope is loaded
print("\nChecking if Telescope is loaded:")
local telescope_loaded, telescope = pcall(require, 'telescope')
print("Telescope loaded:", telescope_loaded)
if telescope_loaded then
  print("Telescope version:", telescope._version or "unknown")
end

-- Check if builtin is available
print("\nChecking if telescope.builtin is available:")
local builtin_loaded, builtin = pcall(require, 'telescope.builtin')
print("telescope.builtin loaded:", builtin_loaded)
if builtin_loaded then
  print("find_files function available:", type(builtin.find_files) == "function")
  print("live_grep function available:", type(builtin.live_grep) == "function")
end

-- Check for terminal key capture
print("\nTerminal key capture check:")
print("Note: Some terminals might capture <C-p> and <C-f> before they reach Neovim.")
print("Try using the leader-based keybindings instead (<leader>sp and <leader>sg)")
print("or check your terminal settings.")
