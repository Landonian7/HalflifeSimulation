print("*Time units are in minutes*")

io.write("Halflife: ")
local halflife = io.read()
os.execute("clear")
print("*Time units are in minutes*")
print(string.format("Halflife: [%s]", halflife))

io.write("Time: ")
local time = io.read()
os.execute("clear")
print("*Time units are in minutes*")
print(string.format("Halflife: [%s]", halflife))
print(string.format("Time: [%s]", time))

local file = io.open("Parameter.txt", "w")
if file then
    file:write(halflife .. "\n")
    file:write(time .. "\n")
    file:close()
else
    print("Error: Cannot open file for writing")
end
