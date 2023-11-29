require("switch")
local sleep = require("sleep")

-- Next setup
local setup = require("config.next.setup")
require('config.init')

local function start()
    local support_frameworks = { "next", "vite", "remix" }

    print(PREFIX .. "All the scripts will be executed using yarn.")
    print(PREFIX .. "Choose a framework for automation production: ")
    for i, v in ipairs(support_frameworks) do
        print(i .. " - " .. v)
    end
    local input = io.read()
    local index = tonumber(input) or 1
    local framework = support_frameworks[index]

    print(PREFIX .. "You choose: " .. (framework or "Invalid") .. ", start to generate project...")
    sleep.invoke(3)

    Switch(framework)
        :case("next", function()
            setup.invoke(PREFIX)
        end)
        :case("vite", function()
            print("Vite logic")
        end)
        :case("remix", function()
            print("Remix logic")
        end)
        :default(function() print(PREFIX .. "Invalid framework.") end)
        :invoke()
end

start()
