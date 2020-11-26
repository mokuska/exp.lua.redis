--
-- It is just a "hello world" example (my very first LUA script)
--
-- Arguments:
--   1 - current timestamp
-- 

local tm = redis.call('GET', 'system_timestamp')
if (tm == false) then
	redis.call('SET', 'system_timestamp', ARGV[1])
	return redis.call('GET', 'system_timestamp')
else
	return tm
end