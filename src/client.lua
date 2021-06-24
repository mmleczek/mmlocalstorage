local _current_request = 0
local waiting_requests = {}

function GetRequestId()
	if _current_request < 65535 then
		_current_request = _current_request + 1
		return _current_request
	else
		_current_request = 0
		return _current_request
	end
end

function GetData(key, cb)
	local id_ = GetRequestId()
	waiting_requests[id_] = cb
	SendNUIMessage({ get = true, id = id_, value = key })
end

RegisterNUICallback("get", function (data, cb)
	if waiting_requests[data.id] then
		waiting_requests[data.id](data.value)
		waiting_requests[data.id] = nil
	end
	cb({})
end)

exports("Get", function (key, cb)
	GetData(key, cb)
end)

exports("GetSync", function(key)
	local __done = false
	local __return = nil
	
	GetData(key, function(data)
		__return = data
		__done = true
	end)

	while not __done do
		Citizen.Wait(0)
	end
	
	return __return
end)

exports("Set", function (key_, val)
	local json_string = ""
	if type(val) ~= "string" then
		json_string = json.encode(val)
	else
		json_string = val
	end
	SendNUIMessage({ set = true, key = key_, value = json_string })
end)

exports("Remove", function (key_)
	SendNUIMessage({ rem = true, key = key_ })
end)