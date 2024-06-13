local exp = exports[GetCurrentResourceName()]

local function GenerateIV()
    local tbl = exp:Internal_GenerateIV()
    local err, result = tbl[1], tbl[2]
    if not err then
        return result
    end
    error(result)
end

local function Encrypt(plainText, key, IV)
    local tbl = exp:Internal_Encrypt(plainText, key, IV)
    local err, result = tbl[1], tbl[2]
    if not err then
        return result
    end
    error(result)
end

local function Decrypt(cipherText, key, IV)
    local tbl = exp:Internal_Decrypt(cipherText, key, IV)
    local err, result = tbl[1], tbl[2]
    if not err then
        return result
    end
    error(result)
end

exports("GenerateIV", function()
    local success, result = pcall(GenerateIV)
    if success then
        return result
    end
    error(result)
end)

exports("Encrypt", function(plainText, key, IV)
    local success, result = pcall(function() return Encrypt(plainText, key, IV) end)
    if success then
        return result
    end
    error(result)
end)

exports("Decrypt", function(cipherText, key, IV)
    local success, result = pcall(function() return Decrypt(cipherText, key, IV) end)
    if success then
        return result
    end
    error(result)
end)