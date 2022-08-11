if 1 ~= vim.fn.has "nvim-0.6.0" then
  vim.api.nvim_err_writeln "hexer.nvim requires at least nvim-0.6.0"
  return
end

-- make sure to load only once
if vim.g.loaded_nvim_hexer == 1 then
  return
end
vim.g.loaded_nvim_hexer = 1

vim.cmd [[ command! Hexer lua require'nvim_hexer'.hexdump() ]]
