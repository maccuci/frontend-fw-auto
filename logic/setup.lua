require('switch')

local sleep = require('sleep')
local next = require('logic.next')
local vite = require('logic.vite')

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
            print("Remix logic")
        end)
        :default(function() print(PREFIX .. "Invalid framework.") end)
        :invoke()
end

return S