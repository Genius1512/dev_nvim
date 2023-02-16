return function(opts, g)
  for k, v in pairs(opts) do
    vim.opt[k] = v
  end

  for k, v in pairs(g) do
    vim.g[k] = v
  end
end
