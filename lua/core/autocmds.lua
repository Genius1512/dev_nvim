return function(cmds)
    for _, cmd in ipairs(cmds) do
        vim.api.nvim_create_autocmd(cmd.event, cmd.cmd)
    end
end
