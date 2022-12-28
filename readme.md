# Scaler
Uses UIScales to scale UI 

# Links 
Github: https://github.com/Y1195/Scaler  
Model: https://www.roblox.com/library/6522838162/Scaler  
Demo Place: https://www.roblox.com/games/6522817409/UI-Scaler-Demo  
Video Demo: https://www.youtube.com/watch?v=k9rdnu12G88

# Basic Usage
Use [Tag Editor](https://www.roblox.com/library/948084095/Tag-Editor) to tag `UIScale`s with "UIScale" tag.  
You can pick which method you want, LocalScript or ModuleScript.

## [Scaler (LocalScript)](/src/Scaler.client.lua)
Place in StarterPlayerScripts.
```lua
local Scaler = game.Players.LocalPlayer.PlayerScripts.StarterPlayerScripts.Scaler

local currentScale = Scaler:GetAttribute("Scale")
local currentResolution = Scaler:GetAttribute("Resolution")

Scaler:SetAttribute("Resolution", 1080)
```

## [Scale (ModuleScript)](/src/Scaler.lua)
Place in ReplicatedStorage
```lua
local Scaler = require(game:GetService("ReplicatedStorage").Scaler)

local currentScale = Scaler:GetScale()
local currentResolution = Scaler:GetResolution()

Scaler:SetResolution(1080)
```

## [Scale (Fusion)](/src/Scaler-fusion.lua)
TODO