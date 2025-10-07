local Resource = {}
Resource.__index = Resource

function Resource.new(name, amount)
    return setmetatable({name = name or "Resource", amount = amount or 0}, Resource)
end

function Resource:add(value)
    self.amount = self.amount + value
end

function Resource:spend(value)
    if self.amount >= value then
        self.amount = self.amount - value
        return true
    else
        return false
    end
end

return Resource