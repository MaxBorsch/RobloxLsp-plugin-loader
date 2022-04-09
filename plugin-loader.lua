local fs = require("bee.filesystem")

local function findExePath()
	local n = 0
	while arg[n - 1] do
		n = n - 1
	end
	return arg[n]
end

local exePath = findExePath()
local exeDir = exePath:match("(.+)[/\\][%w_.-]+$")
local dll = package.cpath:match("[/\\]%?%.([a-z]+)")

local currentPath = debug.getinfo(1, "S").source:sub(2)
local rootPath = fs.path(currentPath):remove_filename():string()

local function getPathDelimiter()
	return dll == "dll" and "\\" or "/"
end

local function formatPath(path)
	path = path:gsub(dll == "dll" and "/" or "\\", getPathDelimiter())
	path = path:gsub(dll == "dll" and "%\\+" or "%/+", getPathDelimiter())
	return path
end

rootPath = formatPath(rootPath)

local pluginsPath = fs.path(rootPath .. getPathDelimiter() .. "plugins" .. getPathDelimiter())

local function loadPlugins()
	-- For each directory in the "../plugins" folder, if there is a "plugin.lua" file in that directory, execute it.
	for path in fs.pairs(pluginsPath) do
		if fs.is_directory(path) then
			local pluginPath = path:string() .. getPathDelimiter() .. "plugin.lua"
			if fs.exists(fs.path(pluginPath)) then
				pluginPath = formatPath(pluginPath)
				log.debug("Loading plugin: ", pluginPath)
				dofile(pluginPath)
			end
		end
	end
end

if fs.exists(pluginsPath) then
	loadPlugins()
end
