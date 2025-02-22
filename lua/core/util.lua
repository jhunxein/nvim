local M = {}

--- Mapping setup
--- @param mode string The mode to bind the key to
--- @param desc_prefix string A description of the key mapping
--- @param bufnr number? The buffer to bind the key to
M.map = function(mode, desc_prefix, bufnr)
  --- Define the napping utility
  --- @param keys string The keys to bind
  --- @param func string|fun():nil The function to be mapped to the keys
  --- @param desc string A description of the key mapping
  return function(keys, func, desc)
    if desc_prefix then
      desc = desc_prefix .. desc
    end

    vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
  end
end

return M
