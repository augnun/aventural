-- inventory.lua
local function createInventory()
    local self = {}
    local items = {}

    function self.add(item)
        table.insert(items, item)
        print(item .. " has been added to your inventory.")
    end

    function self.has(item)
        for _, v in ipairs(items) do
            if v == item then return true end
        end
        return false
    end

    function self.show()
        if #items == 0 then
            print("Your inventory is empty.")
        else
            print("You have the following items:")
            for _, item in ipairs(items) do
                print("- " .. item)
            end
        end
    end

    function self.clear()
        items = {}
    end

    -- test hook
    function self._getItems()
        return items
    end

    return self
end

return createInventory
