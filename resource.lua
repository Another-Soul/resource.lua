local Resource = {}
Resource.__index = Resource

function Resource.new(name, amount, maxAmount)
    return setmetatable({name = name or "Resource", amount = amount or 0, maxAmount = maxAmount or math.huge}, Resource)
end

function Resource:add(value)
    self.amount = math.min(self.amount + value, self.maxAmount)
end

function Resource:spend(value)
    if self.amount >= value then
        self.amount = self.amount - value
        return true
    else
        return false
    end
end

function Resource:reset()
    self.amount = 0
end

function Resource:transfer(recipient, amount)
    if self:spend(amount) then
        recipient:add(amount)
        return true
    else
        return false
    end
end

function Resource:__print()
    return string.format("Current %s: %d", self.name, self.amount)
end

function Resource:equalize(to)
    self.amount = to.amount
end

return Resource