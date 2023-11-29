function Switch(element)
    ---@type table
    local table = {
        Value = element,
        DefaultFunction = nil,
        Functions = {}
    }

    function table:case(e, callback)
        self.Functions[e] = callback
        return self
    end

    function table:default(callback)
        self.DefaultFunction = callback
        return self
    end

    function table:invoke()
        local Case = self.Functions[self.Value]
        if Case then
            Case()
        elseif self.DefaultFunction then
            self.DefaultFunction()
        end
    end

    return table
end
