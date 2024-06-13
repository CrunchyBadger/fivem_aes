-- The password used to encrypt the data
local password = "p@55w0rd"
local message = "My Super Secret Message!"

-- Create an Initialization Vector (This can securely be transported across the network)
-- The IV must be the same when encrypting and decrypting but should be different for every piece of data encrypted
local IV = exports["aes"]:GenerateIV()

-- Encrypt our message and store it as a base64 string in the variable cipherText
local cipherText = exports["aes"]:Encrypt(message, password, IV)

-- Decrypt our message and print it to the server console
local plainText = exports["aes"]:Decrypt(cipherText, password, IV)
print("Decrypted Text:", plainText)