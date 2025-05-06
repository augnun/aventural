-- main.lua
local game = {}

local inventory = {}
local currentRoom = "starting_room"
local hasUnlockedDoor = false

local function addToInventory(item)
    table.insert(inventory, item)
    print(item .. " has been added to your inventory.")
end

local function showInventory()
    if #inventory == 0 then
        print("Your inventory is empty.")
    else
        print("You have the following items:")
        for _, item in ipairs(inventory) do
            print("- " .. item)
        end
    end
end

local function hasItem(name)
    for _, item in ipairs(inventory) do
        if item == name then return true end
    end
    return false
end

local function handleStartingRoom(input)
    if input == "look" then
        print("You see a shiny key on the floor and a door to the north.")
    elseif input == "take key" then
        if not hasItem("shiny key") then
            addToInventory("shiny key")
        else
            print("You already picked up the key.")
        end
    elseif input == "inventory" then
        showInventory()
    elseif input == "use key" or input == "use shiny key" then
        if hasItem("shiny key") then
            print("You unlock the door to the north.")
            hasUnlockedDoor = true
        else
            print("You don't have a key.")
        end
    elseif input == "go north" then
        if hasUnlockedDoor then
            print("You open the door and step into a hallway.")
            currentRoom = "hallway"
        else
            print("The door is locked.")
        end
    else
        print("I don't understand that command.")
    end
end

local function handleHallway(input)
    if input == "look" then
        print("You're in a long hallway with paintings on the walls. There’s a staircase leading up.")
    elseif input == "inventory" then
        showInventory()
    elseif input == "go up" then
        print("You climb the stairs... To be continued!")
        os.exit()
    elseif input == "go back" or input == "go south" then
        print("You return to the starting room.")
        currentRoom = "starting_room"
    else
        print("You wander the hallway, but nothing happens.")
    end
end

function game.start()
    print("Welcome to the Lua Adventure!")
    print("You're in a room. There's a shiny key on the floor and a door to the north.")

    while true do
        io.write("> ")
        local input = io.read()

        if currentRoom == "starting_room" then
            handleStartingRoom(input)
        elseif currentRoom == "hallway" then
            handleHallway(input)
        end
    end
end

game.start()

