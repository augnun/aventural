local Game = require "game"

describe("Inventory system", function()
    before_each(function()
        Game.clearInventory()
    end)

    it("adds an item to the inventory", function()
        Game.addToInventory("shiny key")
        assert.is_true(Game.hasItem("shiny key"))
    end)

    it("does not falsely report items", function()
        assert.is_false(Game.hasItem("sword"))
    end)
end)

