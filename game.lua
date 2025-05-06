local Game = {}

Game.inventory = {}

function Game.addToInventory(item)
    table.insert(Game.inventory, item)
end

function Game.hasItem(item)
    for _, i in ipairs(Game.inventory) do
        if i == item then return true end
    end
    return false
end

function Game.clearInventory()
    Game.inventory = {}
end

return Game
