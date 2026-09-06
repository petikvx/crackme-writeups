local str = "wh4t_1s_a_pr0gr4m_c0unt3r?_jit_eng1n3s_ar3_4wes0m3"

local maxVal = 1000

local ops = {
  [3] = function(a, b) return a + b end,
  [4] = function(a, b) return a - b end,
  [5] = function(a, b) return a * b end,
  [6] = function(a, b) return -a end,
  [7] = function(a, b) return a & b end,
  [8] = function(a, b) return a | b end,
  [9] = function(a, b) return a ~ b end
}

local opNames = {
  [3] = "ADD",
  [4] = "SUB",
  [5] = "MUL",
  [6] = "NEG",
  [7] = "AND",
  [8] = "OR",
  [9] = "XOR"
}

local function makeOpFor(a, b)
  local opsByResult = {}
  for k, v in pairs(ops) do
    local val = v(a, b)
    if opsByResult[val] == nil then
      opsByResult[val] = k
    else
      opsByResult[val] = false
    end
  end
  
  local opList = {}
  local opCount = 0
  for k, v in pairs(opsByResult) do
    if v then
      opCount = opCount + 1
      opList[opCount] = {op = v, val = k}
    end
  end
  
  return opList[math.random(opCount)]
end

local function makeDataForChar(c)
  local a, b = math.random(maxVal), math.random(maxVal)
  local op = makeOpFor(a, b)
  local offset = c - op.op
  local value = op.val
  local opName = opNames[op.op]
  return offset, a, b, value, opName
end


for w in str:gmatch(".") do
  local offset, a, b, value, opName = makeDataForChar(w:byte())
  print("//" .. w .. " -> " .. opName)
  print("data " .. offset .. ", " .. a .. ", " .. b .. ", " .. value)
end

print("data 0")

