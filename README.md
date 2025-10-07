# Resource.lua

A lightweight Lua module for creating and managing simple resource objects.
It’s designed for games, simulations, or any project where you need to keep track of quantities like gold, wood, health, mana, etc.

## ✨ Features

- Simple, object-like resource system built on metatables
- Create, add, and spend resources
- Can be extended with your own methods

# Usage
1. **Require the module:**
```lua
local Resource = require "resource"
```
2. **Create some resources:**
```lua
local gold = Resource.new("Gold", 100)
local wood = Resource.new("Wood", 50)
```
3. **Do stuff with them:**
```lua
gold:add(25)
wood:spend(10)
print(gold.amount .. gold.name)  --> 125 Gold
print(wood.amount .. wood.name)  --> 40 Wood
gold:equalize(wood)
print(gold.amount .. gold.name)  --> 40 Gold
wood:transfer(gold, 10)
print(wood.amount .. wood.name .. "," .. gold.amount .. gold.name)  --> 30 Wood, 50 Gold
```

# API
`Resource.new(name, amount)`\
Creates a new resource and registers it.
___
`*resname:add(value)`\
Increases the resource’s amount.
___
`*resname:spend(value)`\
Attempts to subtract the value. Returns `true` if successful, `false` otherwise.
___
`*resname:reset()`\
Sets the resource amount to 0.
___
`*resname:transfer(recipient, amount)`\
Attempts to transfer the specified amount of one resource to another. Returns `true` if successful, `false` otherwise.
___
`*resname:__print()`\
Outputs the resource info in the format of `resource amount: resource amount`.
___
`*resname:equalize(to)`\
Sets the amount of one resource to the one of another resource.
\
\
<sub>*Switch `resname` for the name of whatever resource you want to work with.</sub>
