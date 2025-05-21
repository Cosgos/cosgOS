-- Setup
term.clear()
term.setCursorPos(1,1)
local applications = fs.find("cosgOS/applications/*")
local applicationNum = #applications
local screenW, screenH = term.getSize()
local option = 1
local scrollOffset = 0
local version = "1.0"
local index = {}
local favoriteFile = fs.open("cosgOS/favorite.txt", "r+")
local favorite = favoriteFile.readAll()

for i = 1, applicationNum do
    index[applications[i]] = i
end
-- Text Utilities

    -- Center Text Y
function printCenterY(string, x)
    term.setCursorPos(x, screenH/2)
    term.write(string)
end
    -- Center Text X
function printCenterX(string, y)
    term.setCursorPos(math.floor(screenW - string.len(string))/2, y)
    term.write(string)
end

function slowPrintCenterX(string, y)
    term.setCursorPos(math.floor(screenW - string.len(string))/2, y)
    textutils.slowPrint(string)
end

-- Boot

printCenterX("Loading Application Menu", screenH/2-1)
printCenterX("------", screenH/2+1)
slowPrintCenterX("######", screenH/2+1)
term.clear()
-- Main

function drawMenu()
-- draw base menu
term.setCursorPos(1,1)
term.write("CosgOS version "..version)
    printCenterX("Back", screenH/2-scrollOffset*2)
    for i = 1, applicationNum do
        if favorite ~= applications[i]:sub(21) then
            printCenterX(applications[i]:sub(21), (screenH/2)+(i*2)-(scrollOffset*2))
        else
            printCenterX("*"..applications[i]:sub(21), (screenH/2)+(i*2)-(scrollOffset*2))
        end
    end
-- change drawn menu based on selected option

    if option == 1 then
        printCenterX("[ Back ]", screenH/2-scrollOffset*2)
    elseif option-1 == index[applications[option-1]] then
        if favorite ~= applications[option-1]:sub(21) then
            printCenterX("[ "..applications[option-1]:sub(21).." ]", screenH/2+option*2-2-(scrollOffset*2))
        else
            printCenterX("[*"..applications[option-1]:sub(21).." ]", screenH/2+option*2-2-(scrollOffset*2))
        end
    end
    if option > scrollOffset+4 then
        scrollOffset = scrollOffset+1
    end
    if option < scrollOffset+1 then
        scrollOffset = scrollOffset-1
    end
end


function input()
    local event, pressed, x, y = os.pullEvent()
-- option selecting with keys
    if event == "key" then
        local key = keys.getName(pressed)
        if key == "up" and option ~= 1 then
            option = option-1
        elseif key == "down" and option ~= applicationNum+1 then
            option = option+1
        elseif key == "enter" and option ~= 1 then
            shell.run(applications[option-1])
        elseif key == "enter" and option == 1 then
            os.reboot()
        elseif key == "leftShift" and option ~= 1 then
            favoriteFile = fs.open("cosgOS/favorite.txt", "w+")
            favoriteFile.write(applications[option-1]:sub(21))
            favoriteFile.close()
        end
        
        
    end
end

while true do
term.clear()
drawMenu()
input()
end



