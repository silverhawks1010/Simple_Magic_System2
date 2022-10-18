local modfol = "magicsystem/modules/"
local conffol = "magicsystem/config/"
SH_SMS = {}
SMS_Config = {}

for _, File in SortedPairs(file.Find(conffol .. "*.lua", "LUA"), true) do
    include( conffol .. File )
end

local _, folders = file.Find(modfol .. "*", "LUA")

for _, folder in SortedPairs(folders, true) do

    for _, File in SortedPairs(file.Find(modfol .. folder .. "/sh_*.lua", "LUA"), true) do
        include(modfol .. folder .. "/" .. File)
    end

    for _, File in SortedPairs(file.Find(modfol .. folder .. "/cl_*.lua", "LUA"), true) do
        include(modfol .. folder .. "/" .. File)
    end
end