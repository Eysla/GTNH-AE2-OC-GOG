-- credit https://github.com/DylanTaylor1/GTNH-Stocking

local shell = require("shell")
local args  = {...}
local branch
local repo
local scripts = {
  "main/Run.lua",
  "main/env.example.lua",
  "main/src/Scan.lua",
  "main/src/AE2.lua",
  "main/src/Utility.lua",
  "main/src/Network.lua",
  "main/src/Queue.lua",
  "main/src/Machines.lua",
  "main/src/TPS.lua",
  "main/lib/json.lua",
}

-- BRANCH (default to "main" if no argument given)
if #args >= 1 then
  branch = args[1]
else
  branch = "main"
end

-- REPO (must not include "/blob/")
if #args >= 2 then
  repo = args[2]
else
  repo = "https://raw.githubusercontent.com/Eysla/GTNH-AE2-OC-GOG"
end

local folder = "oc"

-- INSTALL: loop over each script and wget from the correct raw URL
for i = 1, #scripts do
  local path = string.format(
    "%s/%s/%s/%s",
    repo,       -- e.g. "https://raw.githubusercontent.com/Eysla/GTNH-AE2-OC-GOG"
    branch,     -- e.g. "main"
    folder,     -- "oc"
    scripts[i]  -- e.g. "main/Run.lua"
  )

  -- example: wget -f https://raw.githubusercontent.com/Eysla/GTNH-AE2-OC-GOG/main/oc/main/Run.lua
  shell.execute(string.format("wget -f %s", path))
end
