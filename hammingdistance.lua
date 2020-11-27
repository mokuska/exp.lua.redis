--
-- Calculates the Hamming distance of two strings
-- Returns nil if not applicable (because the strings are not the same length
-- or some of the variables are not of string type)
--
-- Arguments:
--   1 - name of the first string variable
--   2 - name of the second string variable
--

local str1 = redis.call('GET', ARGV[1])
local str2 = redis.call('GET', ARGV[2])

if (type(str1) ~= "string") then
	return false
end

if (type(str2) ~= "string") then
	return false
end

if (string.len(str1) ~= string.len(str2)) then
	return false
end

local distance = 0
for i = 1, string.len(str1), 1 do
	if (string.sub(str1, i, i) ~= string.sub(str2, i, i)) then
		distance = distance + 1
	end
end

return distance
