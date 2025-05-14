local createInventory = require("inventory")
local StartingRoom = require("rooms.starting_room")

describe("Starting Room", function()
    local room
    local inventory

    before_each(function()
        inventory = createInventory()
        room = StartingRoom.new(inventory)
    end)

    it("adds the shiny key when taken", function()
        room.handle("take key")
        assert.is_true(inventory.has("shiny key"))
    end)

    it("does not go north when door is locked", function()
        local nextRoom = room.handle("go north")
        assert.is_equal(nextRoom, "starting_room")
    end)

    it("goes north after unlocking the door", function()
        room.handle("take key")
        room.handle("use key")
        local nextRoom = room.handle("go north")
        assert.is_equal(nextRoom, "hallway")
    end)
end)

