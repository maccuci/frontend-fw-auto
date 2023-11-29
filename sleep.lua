local M = {}

function M.invoke(time)
    ---@type number
    
    -- Windows
    if package.config:sub(1,1) == '\\' then
        os.execute('timeout /nobreak /t ' .. time .. ' >nul')
        return
    end
    -- Unix-like
    os.execute('sleep ' .. time)
end

return M