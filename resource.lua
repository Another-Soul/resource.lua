local Resource = {}
Resource.__index = Resource

function Resource.new(name, amount, maxAmount)
    return setmetatable({name = name or "Resource", amount = math.min(amount, maxAmount or math.huge) or 0, maxAmount = maxAmount or math.huge}, Resource)
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
    return string.format("Current %s: %d / %s", self.name, self.amount, self.maxAmount)
end

function Resource:equalize(to)
    self.amount = to.amount
end

function Resource:setMax(amount)
    self.maxAmount = amount
end

function Resource:setAmount(amount)
    self.amount = math.min(amount, self.maxAmount)
end

function Resource:getPercent()
    if self.maxAmount == math.huge or self.amount == 0 then
        return 0
    else
        return self.amount / self.maxAmount
    end
end

return Resource