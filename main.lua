
local tweenservice = game:GetService("TweenService")
local Players = game:GetService("Players")
local Map = game.Workspace.Map
local Doll = Map.Doll
local Timer = Map.Model.timer.SurfaceGui
local Durationm = 60
local tweenspin = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
local originl = Doll.Head.CFrame
local greenligt = tweenservice:Create(Doll.Head, tweenspin, {
	CFrame = originl
})
local REDLITE = tweenservice:Create(Doll.Head, tweenspin, {
	CFrame = originl*CFrame.Angles(0, math.rad(180),0)
})

function ok(seconds)
	seconds = math.max(seconds, 0)
	local minits = tostring(math.floor(seconds/60))
	local oversecons = tostring(seconds%60)
	if #oversecons == 1 then
		oversecons = "0"..oversecons
	end
	return tostring(minits)..":"..oversecons
end
function DressCharacter(character)
	for _, object in pairs(character:GetChildren()) do
		if object:IsA("Shirt") or object:IsA("Pants") or object:IsA("ShirtGraphic") then
			object:Destroy()
		end
			
	end
	local Shirt = Instance.new("Shirt")
	Shirt.ShirtTemplate = "rbxassetid://7597521537"
	Shirt.Parent = character
	local Pants = Instance.new("Pants")
	Pants.PantsTemplate = "rbxassetid://7597288954"
Pants.Parent = character
end
function StartGame()
	greenligt:Play()
	local PlayerInAmogus = Players:GetPlayers()
	local Winners = {}
	local SpinDelay = 5
	local LastSpin = tick()
	local TouchBerir
	
	for _, player in pairs(PlayerInAmogus) do
		player:LoadCharacter()
		DressCharacter(player.Character)
	end
	
	TouchBerir = Map.giveaname.Touched:Connect(function(toucher)
		if not toucher or not toucher.Parent then
			return
		end
		local TouchCharacter = toucher.Parent
		local TouchPlayer = Players:GetPlayerFromCharacter(TouchCharacter)
		if TouchPlayer then
			table.insert(Winners, TouchPlayer)
			local PlayerIndex = table.find(PlayerInAmogus, TouchPlayer)
			if PlayerIndex then
				table.remove(PlayerInAmogus, PlayerIndex)
			end
		end
	end)
	for i = Durationm, 0, -1 do
		Timer.TextLabel.Text = ok
	end
end


while true do
	task.wait(5)
	StartGame()
end