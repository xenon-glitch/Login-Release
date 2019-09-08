--[[-------------------------------------------------------------------------------------

LUA LOGIN SYSTEM:

Place the coding in 'LoadFunction' that you want to run when someone enters correct login
Make sure to encode the 'Keys' so people cannot read the login info


NOTE: DON'T CHANGE ANY OF THE CODING AS YOU MIGHT BREAK IT

<CodeVoid> 
----------------------------------------------------------------------------------------]]

AuthNo = false

--[[-------------------------------------------------------------------------------------
Executed Code (enter your code in line 20)
----------------------------------------------------------------------------------------]]

function LoadFunction()


end

--[[-------------------------------------------------------------------------------------
Keys (Recommend to encode)
----------------------------------------------------------------------------------------]]
//	key="test" -- remove // to make real

/////////////////////////////////////DON'T EDIT BELOW/////////////////////////////////////
--[[-------------------------------------------------------------------------------------
Locals
----------------------------------------------------------------------------------------]]
	local AUth = {}
--[[-------------------------------------------------------------------------------------
Gradient
----------------------------------------------------------------------------------------]]
	local grad = Material("gui/gradient")
	local upgrad = Material("gui/gradient_up")
	local downgrad = Material("gui/gradient_down")
--[[-------------------------------------------------------------------------------------
Colors
----------------------------------------------------------------------------------------]]
	local o_color1 = Color(17,17,17,255)
	local o_color11 = Color(22,22,22,255)
	local o_color2 = Color(30,30,30,255)
	local o_color3 = Color(50, 50,50,255)
	local o_color4 = Color(42, 42,42,255)
--[[-------------------------------------------------------------------------------------
Fonts
----------------------------------------------------------------------------------------]]
surface.CreateFont( "button", { font = "Calibri", 
extended = false, 
size = 16, 
weight = 500, 
blursize = 0, 
scanlines = 0, 
antialias = true, 
underline = false, 
italic = false, 
strikeout = false, 
symbol = false, 
rotary = false, 
shadow = false, 
additive = false, 
outline = false, 
} 
)
--[[-------------------------------------------------------------------------------------
Login Section
----------------------------------------------------------------------------------------]]
local login = vgui.Create("DFrame")
	login:SetSize(366, 170)
	login:SetTitle("")
	login:Center()
	login:MakePopup()
	login:ShowCloseButton(false)
	login:SetDraggable(true)
	login.Paint = function(self,w,h)
	surface.SetDrawColor(Color(40, 40, 40, 255))
	surface.DrawRect(0, 0, w, h)
	surface.SetDrawColor(36, 21, 21)
	surface.SetMaterial(upgrad)
	surface.SetDrawColor(o_color2)
	surface.SetMaterial(downgrad)
	surface.SetDrawColor(o_color2)
	surface.SetDrawColor(0, 0, 0, 255)
	surface.DrawOutlinedRect(0, 0, w, h)
	surface.DrawOutlinedRect(1, 1, w - 2, h - 2)
end

local l = vgui.Create('DPanelList', login)
	l:SetSize(346, 150)
	l:SetPos(11, 11)
	l.Paint = function(s, w, h)
	surface.SetDrawColor(Color(26, 26, 26))
	surface.DrawRect(0, 0, w, h)
	surface.SetDrawColor(21, 21, 21)
	surface.SetMaterial(upgrad)
	surface.SetDrawColor(o_color2)
	surface.SetMaterial(downgrad)
	surface.SetDrawColor(o_color2)
	surface.SetDrawColor(35, 35, 35, 255)
	surface.DrawOutlinedRect(0, 0, w, h)
end
--[[-------------------------------------------------------------------------------------
Rainbow Bars / Labels
----------------------------------------------------------------------------------------]]
function AUth.AddRainbow(name, parent)
	local pl = parent:Add("DPanelList")
	pl:SetText("")
	pl:SetSize(346,2)
	pl:SetPos(0,0)
	pl.Paint = function(self, w, h)
	surface.SetDrawColor(Color(100, 100, 100))
	surface.DrawRect(0, 0, w, h)
	surface.SetDrawColor(21, 21, 21)
	surface.SetMaterial(upgrad)
	surface.SetDrawColor(o_color2)
	surface.SetMaterial(downgrad)
	surface.SetDrawColor(o_color2)
	surface.SetDrawColor(HSVToColor(CurTime() % 6 * 60, 1, 1))
	surface.DrawOutlinedRect(0, 0, w, h)
	surface.DrawOutlinedRect(1, 1, w - 2, h - 2)
end
end

	AUth.AddRainbow("Glow", l)
	
function AUth.addLabel(name, posx, posy, parent)
	local T1 = parent:Add("DLabel")
	T1:SetSize(300, 50)
	T1:SetPos(posx, posy)
	T1:SetFont("button")
	T1:SetText(name)
	T1:SetTextColor(Color(255, 255, 255, 255))
end

	AUth.addLabel("SteamID:", 28,0,l)
	AUth.addLabel("Password:", 28,43,l)
--[[-------------------------------------------------------------------------------------
Functions
----------------------------------------------------------------------------------------]]
local b1 = vgui.Create("DButton",l)
	b1:SetSize(135, 33)
	b1:SetPos(28, 106)
	b1:SetText("Login")
	b1:SetFont("button")
	b1:SetTextColor(Color(255, 255, 255, 255))
	b1.Paint = function(self, w, h)
	surface.SetDrawColor(Color(200, 24, 24))
	surface.SetDrawColor(40, 40, 40)
	surface.DrawOutlinedRect(0, 0, w, h)
end

local b2 = vgui.Create("DButton",l)
	b2:SetSize(135, 33)
	b2:SetPos(188, 106)
	b2:SetText("Close")
	b2:SetFont("button")
	b2:SetTextColor(Color(255, 255, 255, 255))
	b2.Paint = function(self, w, h)
	surface.SetDrawColor(Color(200, 24, 24))
	surface.SetDrawColor(40, 40, 40)
	surface.DrawOutlinedRect(0, 0, w, h)
end

b2.DoClick = function()
	surface.PlaySound("npc/turret_floor/click1.wav")
	login:SizeTo(0, 0, .2, 0, .2)
	timer.Simple(0.3,function()
	login:Close()
	end)
end
--[[-------------------------------------------------------------------------------------
TextEntry
----------------------------------------------------------------------------------------]]
local ID = vgui.Create("DTextEntry", l)
	ID:SetPos(106, 14)
	ID:SetSize(217, 23)
	ID:SetText(LocalPlayer():SteamID())
	ID:SetTextColor(Color(255, 255, 255, 255))
	ID:SetFont("button")
	ID.Paint = function(self, w, h)
	surface.SetDrawColor(Color(20, 20, 20))
	surface.DrawRect(0, 0, w, h)
	surface.SetDrawColor(45, 45, 45)
	surface.SetMaterial(upgrad)
	surface.SetDrawColor(o_color2)
	surface.SetMaterial(downgrad)
	surface.SetDrawColor(o_color2)
	surface.SetDrawColor(45, 45, 45, 255)
	surface.DrawOutlinedRect(0, 0, w, h)
	self:DrawTextEntryText(Color(255, 255, 255), Color(20, 20, 150), Color(100, 100, 100))
end

local PAS = vgui.Create("DTextEntry", l)
	PAS:SetPos(106, 58)
	PAS:SetSize(217, 23)
	PAS:SetText("")
	PAS:SetTextColor(Color(255, 255, 255, 255))
	PAS:SetFont("button")
	PAS.Paint = function(self, w, h)
	surface.SetDrawColor(Color(20, 20, 20))
	surface.DrawRect(0, 0, w, h)
	surface.SetDrawColor(45, 45, 45)
	surface.SetMaterial(upgrad)
	surface.SetDrawColor(o_color2)
	surface.SetMaterial(downgrad)
	surface.SetDrawColor(o_color2)
	surface.SetDrawColor(45, 45, 45, 255)
	surface.DrawOutlinedRect(0, 0, w, h)
	self:DrawTextEntryText(Color(255, 255, 255), Color(20, 20, 80), Color(100, 100, 100))
end

b1.DoClick = function(self) 
 if ID:GetValue() ~= (LocalPlayer():SteamID()) then LocalPlayer():EmitSound("ambient/alarms/klaxon1.wav",500,100) return false end
 if PAS:GetValue() == (key) then 
     login:SetVisible(false)
     AuthNo = true
     LoadFunction()
else
     LocalPlayer():EmitSound("ambient/alarms/klaxon1.wav",500,100)
     AuthNo = false
   end
end
