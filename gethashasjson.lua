--
-- Retrieves the content of a hash as JSON string
-- If the variable not exists then it returns nil
--
-- Arguments:
--   1 - name of the hash variable
--

local function hgetall(hash_key)
	local flat_map = redis.call('HGETALL', hash_key)
	local result = {}
	for i = 1, #flat_map, 2 do
		result[flat_map[i]] = flat_map[i + 1]
	end
	return result
end

local data = hgetall(ARGV[1])
local pair_items = {}
local count_pairs = 0

for k, v in pairs(data) do
	table.insert(pair_items, '"' .. k .. '":"' .. v .. '"')
	count_pairs = count_pairs + 1
end

if (count_pairs == 0) then
	return false
end

local json_data = "{" .. table.concat(pair_items, ',') .. "}"

return json_data