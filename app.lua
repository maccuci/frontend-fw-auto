-- General config
require('config.init')
require("switch")

-- Local modules
local sleep = require("sleep")
local setup = require("logic.setup")

-- Start script
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
    
    setup.generate(PREFIX, framework)
end

start()
