function readParameters(filename)
    local file = io.open(filename, "r")
    if file then
        local a = tonumber(file:read("*line"))
        local b = tonumber(file:read("*line"))
        file:close()
        return a, b
    else
        return nil, "Error: Cannot open file"
    end
end

function get_frac(numerator,denominator)
  local num = 1
  local dec = numerator/denominator
  while true do
    if dec * num == 1 then
      return string.format("1/%s", num)
    else
      num = num + 1
    end
  end
end


print("[1] for config, [ENTER] for simulation")
if io.read()=="1" then
  dofile("getParams.lua")
end

local halflife, time = readParameters("Parameter.txt")


os.execute("clear")
print(string.format("Halflife: [%s]", halflife))
print(string.format("Time: [%s]\n", time))

io.write("Initial mass: ")
local initial_mass = io.read()
if type(initial_mass) ~= "number" then initial_mass = 100 end

--header
os.execute("clear")
print(string.format("Halflife: [%s]", halflife))
print(string.format("Time: [%s]", time))
print(string.format("Initial mass: [%s]\n-------------------------", initial_mass))

local minutes = 0
local mass = initial_mass
while minutes < time do
  minutes=minutes+1
  if minutes%6 == 0 then
    mass = mass/2
  end

  --header
  os.execute("clear")
  print(string.format("Halflife: [%s]", halflife))
  print(string.format("Time: [%s]", time))
  print(string.format("Initial mass: [%s]\n-------------------------", initial_mass))

  print("Current Mass: " .. mass)
  print("Time Spent: " .. minutes)
  print("Time Remaining: " .. time-minutes)
  print("Percent Mass Remaining: " .. mass/initial_mass .. "%")
end

print("Fraction of Mass Remaining: " .. get_frac(mass,initial_mass))
