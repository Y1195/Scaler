--!strict

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


	API:
		number Scaler:GetScale("Scale")

]]

local SCALE_TAG = "UIScale"

local DEFAULT_SCALE = 1
local DEFAULT_RESOLUTION = 720

local Collection = game:GetService("CollectionService")

local camera = workspace.CurrentCamera

local currentScale = 1
local currentResolution = DEFAULT_RESOLUTION

local multiplier = DEFAULT_SCALE / DEFAULT_RESOLUTION

local scales: {UIScale} = {}

local function applyScale(scale: UIScale)
	scale.Scale = currentScale
end

local function scaleAdded(scale: UIScale)
	assert(scale:IsA("UIScale"), scale:GetFullName() .. " is not a UIScale")

	applyScale(scale)
	table.insert(scales, scale)
end

local function scaleRemoved(scale: UIScale)
	local index = table.find(scales, scale)
	if index then
		table.remove(scales, index)
	end
end

local function updateScale()
	local sizeX, sizeY = camera.ViewportSize.X, camera.ViewportSize.Y
	currentScale = if sizeY < sizeX then multiplier * sizeY else multiplier * sizeX

	for _, scale in ipairs(scales) do
		applyScale(scale)
	end
end

for _, scale in ipairs(Collection:GetTagged(SCALE_TAG)) do
	scaleAdded(scale)
end

updateScale()

camera:GetPropertyChangedSignal("ViewportSize"):Connect(updateScale)
Collection:GetInstanceAddedSignal(SCALE_TAG):Connect(scaleAdded)
Collection:GetInstanceRemovedSignal(SCALE_TAG):Connect(scaleRemoved)

local Scaler = {}

function Scaler:SetResolution(resolution: number)
	assert(resolution, "Scaler:SetResolution number expected")

	currentResolution = resolution
	multiplier = DEFAULT_SCALE / resolution
	updateScale()
end

function Scaler:GetResolution()
	return currentResolution
end

function Scaler:GetScale()
	return currentScale
end

return Scaler
