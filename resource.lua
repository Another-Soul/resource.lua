local Resource = {}
Resource.__index = Resource

Resource.instances = {}

function Resource.new(name, amount, maxAmount)
    local self = setmetatable({name = name or "Resource", amount = math.min(amount, maxAmount or math.huge) or 0, maxAmount = maxAmount or math.huge}, Resource)
    table.insert(Resource.instances, self)
    return self
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

function Resource:scale(scale)
    self.maxAmount = self.maxAmount * scale
    self.amount = self.amount * scale
end

function Resource:printAll()
    local str = ""
    for _,res in pairs(Resource.instances) do
        str = str .. string.format("\nCurrent %s: %d / %s", res.name, res.amount, res.maxAmount)
    end
    return str
end

return Resource