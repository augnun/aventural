-- main.lua
local createInventory = require("inventory")
local StartingRoom = require("rooms.starting_room")
local Hallway = require("rooms.hallway")

local game = {}

function game.start()
    local inventory = createInventory()

    local roomInstances = {
        starting_room = StartingRoom.new(inventory),
        hallway = Hallway.new(inventory, os.exit), -- pass real quit function
    }

    local currentRoom = "starting_room"
    roomInstances[currentRoom].enter()

    while true do
        io.write("> ")
        local input = io.read()

        local newRoom = roomInstances[currentRoom].handle(input)
        if newRoom ~= currentRoom then
            currentRoom = newRoom
            roomInstances[currentRoom].enter()
        end
    end
end

game.start()

