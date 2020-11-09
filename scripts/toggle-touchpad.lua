local command = "xinput --list-props 14 | grep 'Device Enabled'"
local pipe = io.popen(command)
output = pipe:read("*a")
result = string.sub(output,-2)
print(result)
print(result)
if(result == "0\n") then
    print("result = 0")
else if(result == "1\n") then
    print("result = 1")
end
end

