require('switch')

local sleep = require('sleep')
local S = {}

function S.generate(PREFIX, framework)
    Switch(framework)
        :case("next", function()
            PREFIX = "[NEXT] "
            print(PREFIX .. "Choose the directory to generate project: ")
            local dir = io.read()
        
            local cd_command = "cd " .. dir
            local status = os.execute(cd_command)
        
            if status then
                print(PREFIX .. "Project name: ")
                local name = io.read()
                local command = "yarn create next-app " .. name
                for _, opt in ipairs(next_opts) do
                    command = command .. " " .. opt
                end
                print(PREFIX .. "Creating project using the defaults options.")
                sleep.invoke(1)
                local start_time = os.clock()
                os.execute(command)
                print(PREFIX .. "Your project already finish.")
                print(PREFIX .. "Time elapsed: " .. os.clock() - start_time .. "s")
            else
                print(PREFIX .. "Failed to change directory. Project generation aborted.")
            end
        end)
        :case("vite", function()
            PREFIX = '[VITE] '
            print(PREFIX .. "Choose the directory to generate project: ")
            local dir = io.read()
        
            local cd_command = "cd " .. dir
            local status = os.execute(cd_command)

            if status then
                print(PREFIX .. "Project name: ")
                local name = io.read()
                local command = "yarn create vite " .. name
                for _, opt in ipairs(vite_opts) do
                    command = command .. " " .. opt
                end
                print(PREFIX .. "Creating project using the defaults options.")
                sleep.invoke(1)
                local start_time = os.clock()
                os.execute(command)
                print(PREFIX .. "the your project already finish.")
                print(PREFIX .. "Time elapsed: " .. os.clock() - start_time .. "s")
            else
                print(PREFIX .. "Failed to change directory. Project generation aborted.")
            end
        end)
        :case("remix", function()
            print("Remix logic")
        end)
        :default(function() print(PREFIX .. "Invalid framework.") end)
        :invoke()
end

return S