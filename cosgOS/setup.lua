-- Checks if the current version file exists, and sets version to the version file

local currentVersion = fs.open("currentVersion.txt")
local version
if currentVersion then
    version = currentVersion
    currentVersion.close()
else
    version = 0
end

shell.run("wget ")