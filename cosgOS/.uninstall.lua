term.clear()
term.setCursorPos(1,1)

while true do
print("Are you sure you want to uninstall? CosgOS will be completely removed from your device. (Y/N)")
local answer = read()
if answer == "N" then
    os.reboot()
elseif answer == "Y" then
    break
end
end



print("Deleting files...")
sleep(1)
    shell.run("delete cosgOS/")
    --Delete non-cosgOS files
    shell.run("delete localVersion.txt")
    shell.run("delete back.lua")
    shell.run("delete startup.lua")
    shell.run("delete install.lua")
os.reboot()