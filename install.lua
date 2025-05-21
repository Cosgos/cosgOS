local args = {...}
if #args ~= 2 then
    print("Usage:")
    print("install [filename] [displayname]")
elseif fs.exists(args[1]) and #args == 2 then
    local filename = "cosgOS/applications/"..args[1]
    local toFilename = "cosgOS/applications/"..args[2]
    file = fs.open("cosgOS/applications/"..args[1], "w")
    file.write("shell.run(\""..args[1].."\")")
    file.close()
    shell.run("rename "..filename.." "..toFilename)
    print("File found and installed.")
else
    print("File not found")
end   
