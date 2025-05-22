-- Checks if the current version file exists, and sets version to the version file

local localVersion = fs.open("localVersion.txt", "r")
local version
if localVersion then
    version = localVersion.readAll()
    localVersion.close()
else
    version = 0
end
-- gets the current version and saves it to the currentVersion file
shell.run("wget https://raw.githubusercontent.com/Cosgos/cosgOS/main/cosgOS/version.txt currentVersion.txt")

-- sets the currentVersion variable to the version in the currentVersion file
local file = fs.open("currentVersion.txt", "r")
local currentVersion = file.readAll()
file.close()

shell.run("delete currentVersion.txt")

if currentVersion ~= version then
    print("New version detected. Updating.")
    --deletes old files
    sleep(1)
    print("Deleting deprecated files...")
    shell.run("delete cosgOS/")
    --Delete non-cosgOS files
    shell.run("delete localVersion.txt")
    shell.run("delete back.lua")
    shell.run("delete startup.lua")
    shell.run("delete install.lua")
    --reinstalls the files from github
    sleep(1)
    print("Installing new version...")

    --CosgOS files
    shell.run("wget https://raw.githubusercontent.com/Cosgos/cosgOS/main/cosgOS/UI.lua cosgOS/UI.lua")
    shell.run("wget https://raw.githubusercontent.com/Cosgos/cosgOS/main/cosgOS/commandPrompt.lua cosgOS/commandPrompt.lua")
    shell.run("wget https://raw.githubusercontent.com/Cosgos/cosgOS/main/cosgOS/applicationMenu.lua cosgOS/applicationMenu.lua")
    shell.run("wget https://raw.githubusercontent.com/Cosgos/cosgOS/main/cosgOS/setup.lua cosgOS/setup.lua")
    shell.run("wget https://raw.githubusercontent.com/Cosgos/cosgOS/main/cosgOS/favoriteInfo.lua cosgOS/favoriteInfo.lua")
    shell.run("wget https://raw.githubusercontent.com/Cosgos/cosgOS/main/cosgOS/favorite.txt cosgOS/favorite.txt")
    shell.run("wget https://raw.githubusercontent.com/Cosgos/cosgOS/main/cosgOS/.uninstall.lua cosgOS/.uninstall.lua")
    --Other Files
    shell.run("wget https://raw.githubusercontent.com/Cosgos/cosgOS/main/startup.lua startup.lua")
    shell.run("wget https://raw.githubusercontent.com/Cosgos/cosgOS/main/back.lua back.lua")
    shell.run("wget https://raw.githubusercontent.com/Cosgos/cosgOS/main/install.lua install.lua")

    --Update the version file
    local newVersion = fs.open("localVersion.txt", "w")
    newVersion.write(currentVersion)
    newVersion.close()
end

shell.run("cosgOS/UI.lua")
