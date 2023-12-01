require('switch')

local next = require('logic.next')
local vite = require('logic.vite')
local remix = require('logic.remix')

local S = {}

-- Principal function
function S.generate(PREFIX, framework)
    Switch(framework)
        :case("next", function()
            PREFIX = "[NEXT] "
            next.invoke(PREFIX)
        end)
        :case("vite", function()
            PREFIX = '[VITE] '
            vite.invoke(PREFIX)
        end)
        :case("remix", function()
            remix.invoke(PREFIX)
        end)
        :default(function() print(PREFIX .. "Invalid framework.") end)
        :invoke()
end

return S