local module = {
	snippets = {}
}

-- register is used for adding new snippets
module.register = function (self, syntax, snippets)
	if type(syntax) ~= "string" then
		return nil, "syntax (2. param) has to be a string"
	end

	if type(snippets) ~= "table" then
		return nil, "snippets (3. param) has to be a table of key - snippet pairs"
	end

	for k, v in pairs(snippets) do
		if self.snippets[syntax] == nil then
			self.snippets[syntax] = {}
		end

		if type(k) ~= "string" or type(v) ~= "string" then
			return nil, "key and value (snippet) should both be strings"
		end
		
		self.snippets[syntax][k] = v
	end

	return true
end

local info = function (fmt, ...)
	vis:info("vis-snippets: " .. string.format(fmt, ...))
end

-- execute :snip with a key selected to replace it with it's snippet
vis:command_register("snip", function (argv, force, win, selection, range)
	-- nothing is selected
	if range == nil then
		return true
	end
	
	local key = win.file:content(range)

	-- default syntax is text
	local syntax = "text"
	if win.syntax ~= nil then
		syntax = win.syntax
	end

	-- syntax does not have any snippets
	if module.snippets[syntax] == nil then
		info("syntax %s does not have any snippets", syntax)
		return true
	end

	local snippet = module.snippets[syntax][key]

	-- key does not relate to a snippet
	if snippet == nil then
		info("syntax %s does not contain a snippet under key %s", syntax, key)
		return true
	end

	local position = range.start

	if not win.file:delete(range) then
		info("delete unsuccessfull")
		return true
	end

	if not win.file:insert(position, snippet) then
		info("insert unsuccessfull")
		return true
	end

	-- set position after operation
	selection.pos = position
	
	return true
end)

return module
