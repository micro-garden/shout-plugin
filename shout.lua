VERSION = "0.0.1"

local micro = import("micro")
local config = import("micro/config")
local shell = import("micro/shell")
local buffer = import("micro/buffer")

function ShOutCmd(bp)
	local lineNum = bp.Cursor.Y
	local line = bp.Buf:Line(lineNum)

	if line:match("^%s*$") then
		micro.InfoBar():Error("Line is empty")
		return
	end

	micro.InfoBar():Message("Running: " .. line)

	local output = shell.RunCommand(line) or ""

	bp.Cursor:End()
	local atEndOfBuffer = bp.Cursor.Loc.X == bp.Buf:End().X and bp.Cursor.Loc.Y == bp.Buf:End().Y

	if atEndOfBuffer then
		output = "\n" .. output
	end

	local insertLoc = buffer.Loc(0, lineNum + 1)
	bp.Buf:Insert(insertLoc, output)

	if not atEndOfBuffer then
		local outputLines = {}
		for line in output:gmatch("([^\n]*)\n?") do
			table.insert(outputLines, line)
		end
		local lineOffset = #outputLines - 1
		local lastLine = outputLines[#outputLines]
		local finalX = #lastLine
		local finalY = lineNum + 1 + lineOffset

		bp.Cursor:GotoLoc(buffer.Loc(finalX, finalY))
	end
end

function init()
	config.MakeCommand("shout", ShOutCmd, config.NoComplete)
	config.TryBindKey("Ctrl-Alt-b", "lua:shout.ShOutCmd", false)
	config.AddRuntimeFile("shout", config.RTHelp, "help/shout.md")
end
