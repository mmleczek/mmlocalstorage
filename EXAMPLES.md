# Examples
#### Lua
```lua
- Adding a data item to "key_name" key.
exports.mmlocalstorage:Set("key_name", {
	name = "test_name",
	test_value = 123
})

- Async way to get data from "key_name" key.
exports.mmlocalstorage:Get("key_name", function(return_value)
	print(json.encode(return_value))
end)

- Sync way to get data from "key_name" key.
print(json.encode(exports.mmlocalstorage:GetSync("key_name")))

- Removind data item from "key_name" key.
exports.mmlocalstorage:Remove("key_name")
```