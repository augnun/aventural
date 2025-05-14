local createInventory = require("inventory")
local Hallway = require("rooms.hallway")

describe("Hallway", function()
    local room
    local inventory
    local quitCalled

    before_each(function()
        inventory = createInventory()
        quitCalled = false
        local fakeQuit = function() quitCalled = true end
        room = Hallway.new(inventory, fakeQuit)
    end)

    it("goes back to starting room", function()
        local nextRoom = room.handle("go back")
        assert.is_equal(nextRoom, "starting_room")
    end)

    it("calls quit function when going up", function()
        room.handle("go up")
        assert.is_true(quitCalled)
    end)
end)

