-- Scaler
-- 0_1195
-- March 15, 2021

--[[

	Github:
		https://github.com/Y1195/Scaler
	
	Model:
		https://www.roblox.com/library/6522838162/Scaler
	
	Demo Place:
		https://www.roblox.com/games/6522817409/UI-Scaler-Demo
	
	Video Demo:
		https://www.youtube.com/watch?v=k9rdnu12G88


	Usage:
		Scaler = require(Scaler)
	
	API:
		number Scaler:GetScale()

]]


local Collection = game:GetService("CollectionService")

local camera = workspace.CurrentCamera

local currentScale = 1

local MULTIPLIER = 1/720 -- 1/The Y size of the resolution you build your UI at

local SCALE_TAG = "UIScale"


local scales = {}

local function applyScale(scale)
	scale.Scale = currentScale
end

local function scaleAdded(scale)
	applyScale(scale)
	table.insert(scales, scale)
end

local function scaleRemoved(scale)
	local index = table.find(scales, scale)
	if index then
		table.remove(scales, index)
	end
end

local function updateScale()
	local sizeX, sizeY = camera.ViewportSize.X, camera.ViewportSize.Y
	if sizeY < sizeX then
		currentScale = MULTIPLIER * sizeY
	else
		currentScale = MULTIPLIER * sizeX
	end
	
	for i, scale in ipairs(scales) do
		applyScale(scale)
	end
end

for i, scale in ipairs(Collection:GetTagged(SCALE_TAG)) do
	scaleAdded(scale)
end

updateScale()

camera:GetPropertyChangedSignal("ViewportSize"):Connect(updateScale)
Collection:GetInstanceAddedSignal(SCALE_TAG):Connect(scaleAdded)
Collection:GetInstanceRemovedSignal(SCALE_TAG):Connect(scaleRemoved)


local Scaler = {}

function Scaler:GetScale()
	return currentScale
end

return Scaler
