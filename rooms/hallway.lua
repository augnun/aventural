-- rooms/hallway.lua
local Hallway = {}

function Hallway.new(inventory)
    local self = {}

    function self.enter()
        print("You’re in a long hallway with paintings on the walls. There’s a staircase leading up.")
    end

    function self.handle(input)
        if input == "look" then
            print("Paintings line the walls. A staircase leads up.")
        elseif input == "inventory" then
            inventory.show()
        elseif input == "go up" then
            print("You climb the stairs... To be continued!")
            os.exit()
        elseif input == "go back" or input == "go south" then
            print("You return to the starting room.")
            return "starting_room"
        else
            print("You wander the hallway, but nothing happens.")
        end

        return "hallway"
    end

    return self
end

return Hallway
