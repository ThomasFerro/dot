local remap = {}

function remap.nmap(keys, func, desc, buffer)
  vim.keymap.set('n', keys, func, { buffer = buffer, desc = desc })
end

return remap
