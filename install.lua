local args = {...}
if #args ~= 2 then
    print("Usage:")
    print("install [filename] [displayname]")
elseif fs.exists(args[1]) and #args == 2 then
    local directory = fs.getDir(args[1])
    local file = args[1]:sub(string.len(directory)+1)
    local filename = "cosgOS/applications/"..file
    local toFilename = "cosgOS/applications/"..args[2]
    file = fs.open("cosgOS/applications/"..file, "w")
    file.write("shell.run(\""..args[1].."\")")
    file.close()
    shell.run("rename "..filename.." "..toFilename)
    print("File found and installed.")
else
    print("File not found")
end   
