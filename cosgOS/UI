-- Setup
term.clear()
term.setCursorPos(1,1)
local screenW, screenH = term.getSize()
local option = 1
local version = "1.0"

-- Text Utilities

    -- Center Text Y
function printCenterY(string, x)
    term.setCursorPos(x, screenH/2)
    print(string)
end
    -- Center Text X
function printCenterX(string, y)
    term.setCursorPos(math.floor(screenW - string.len(string))/2, y)
    print(string)
end

function slowPrintCenterX(string, y)
    term.setCursorPos(math.floor(screenW - string.len(string))/2, y)
    textutils.slowPrint(string)
end

-- Boot

printCenterX("Booting CosgOS...", screenH/2-1)
printCenterX("-----------------", screenH/2+1)
slowPrintCenterX("#################", screenH/2+1)
term.clear()
-- Main

function drawMenu()
-- draw base menu
term.setCursorPos(1,1)
print("CosgOS version "..version)
    printCenterX("Applications", screenH/2)
    printCenterX("Command Prompt", screenH/2+2)
    printCenterX("Option 3", screenH/2+4)
    printCenterX("Uninstall", screenH/2+6)
    
-- change drawn menu based on selected option

    if option == 1 then
        printCenterX("[ Applications ]", screenH/2)
    elseif option == 2 then
        printCenterX("[ Command Prompt ]", screenH/2+2)
    elseif option == 3 then
        printCenterX("[ Option 3 ]", screenH/2+4)
    elseif option == 4 then
        printCenterX("[ Uninstall ]", screenH/2+6)
    end
end


function input()
    local event, pressed, x, y = os.pullEvent()
-- option selecting with keys
    if event == "key" then
        local key = keys.getName(pressed)
        if option ~= 1 and key == "up" or option ~= 1 and key == "w" then
            option = option-1
        elseif option ~= 4 and key == "down" or option ~= 4 and key == "s" then
            option = option+1
        elseif option == 1 and key == "up" or option == 1 and key == "w" then
            option = 4
        elseif option == 4 and key == "down" or option == 4 and key == "s" then
            option = 1
        elseif key == "enter" and option == 1 then
            shell.run("cosgOS/applicationMenu")
        elseif key == "enter" and option == 2 then
            shell.run("cosgOS/commandPrompt")
        end
    end

-- option selecting with mouse
    if event == "mouse_click" then
        if y == screenH/2 and x > screenW/2-6 and x < screenW/2+4 then
            option = 1
        elseif y == screenH/2+2 and x > screenW/2-6 and x < screenW/2+4 then
            option = 2
        elseif y == screenH/2+4 and x > screenW/2-6 and x < screenW/2+4 then
            option = 3
        elseif y == screenH/2+6 and x > screenW/2-6 and x < screenW/2+6 then
            option = 4
        end
    end
end

while true do
term.clear()
drawMenu()
input()
end
