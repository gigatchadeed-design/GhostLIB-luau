--Ghost LibUI v2.0.0 (Enhanced with Icons)
--made by "Clmstb" GgTchadeed.
--the code is open source, if you modify it, it would be nice to mansion "Ghost Lib UI" on your github repository and also to mansion it in your script, Happy Scripting, Thank for using!
--check documention for more detail.


print("GhostLib UI v2.0.0 loaded successfully! 👻✅")

local Library = {}
local TweenService = game:GetService("TweenService")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")

-- debug
GuiService.AutoSelectGuiEnabled = false
GuiService.SelectedObject = nil

-- Utilitaire pour créer une icône proprement
local function CreateIcon(parent, iconId)
    if not iconId or iconId == "" then return nil end
    local Icon = Instance.new("ImageLabel")
    Icon.Name = "Icon"
    Icon.Parent = parent
    Icon.BackgroundTransparency = 1
    Icon.Size = UDim2.new(0, 18, 0, 18)
    Icon.Image = "rbxassetid://" .. iconId:gsub("rbxassetid://", "")
    Icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
    return Icon
end

-- Notif Sys

function Library:Notify(data)
    local title = data.Title or "Notification"
    local content = data.Content or ""
    local duration = data.Duration or 5
    local iconID = data.Icon

    local ScreenGui = game:GetService("CoreGui"):FindFirstChild("GhostNotifications") or Instance.new("ScreenGui", game:GetService("CoreGui"))
    ScreenGui.Name = "GhostNotifications"

    local NotifFrame = Instance.new("Frame")
    NotifFrame.Size = UDim2.new(0, 250, 0, 80)
    NotifFrame.Position = UDim2.new(1, 10, 0.8, 0) -- Commence hors écran
    NotifFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    NotifFrame.BorderSizePixel = 0
    NotifFrame.Parent = ScreenGui

    -- Coins arrondis
    local UICorner = Instance.new("UICorner", NotifFrame)
    UICorner.CornerRadius = UDim.new(0, 8)

    -- Bordure stylée
    local UIGradient = Instance.new("UIStroke", NotifFrame)
    UIGradient.Color = Color3.fromRGB(40, 40, 40)
    UIGradient.Thickness = 1

    -- LOGIQUE ICÔNE : On ne crée l'image que si l'ID existe
    if iconID and iconID ~= "" then
        local Icon = Instance.new("ImageLabel")
        Icon.Name = "Icon"
        Icon.Parent = NotifFrame
        Icon.BackgroundTransparency = 1
        Icon.Position = UDim2.new(0, 10, 0.5, -12)
        Icon.Size = UDim2.new(0, 24, 0, 24)
        Icon.Image = iconID
    end

    local TitleLabel = Instance.new("TextLabel", NotifFrame)
    TitleLabel.Text = title
    TitleLabel.Size = UDim2.new(1, -50, 0, 20)
    TitleLabel.Position = iconID and UDim2.new(0, 45, 0, 10) or UDim2.new(0, 15, 0, 10)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Font = Enum.Font.GothamBold

    local ContentLabel = Instance.new("TextLabel", NotifFrame)
    ContentLabel.Text = content
    ContentLabel.Size = UDim2.new(1, -50, 0, 40)
    ContentLabel.Position = iconID and UDim2.new(0, 45, 0, 30) or UDim2.new(0, 15, 0, 30)
    ContentLabel.BackgroundTransparency = 1
    ContentLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    ContentLabel.TextXAlignment = Enum.TextXAlignment.Left
    ContentLabel.TextWrapped = true
    ContentLabel.Font = Enum.Font.Gotham

    -- Animation d'entrée
    NotifFrame:TweenPosition(UDim2.new(1, -260, 0.8, 0), "Out", "Quart", 0.5, true)

    -- Suppression auto
    task.delay(duration, function()
        NotifFrame:TweenPosition(UDim2.new(1, 10, 0.8, 0), "In", "Quart", 0.5, true)
        task.wait(0.5)
        NotifFrame:Destroy()
    end)
end

function Library:CreateWindow(hubName, iconId)
    local hubName = hubName or "Ghost UI"
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "GhostUI_Final"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = game:GetService("CoreGui") or game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local MainFrame = Instance.new("Frame")
    local MainCorner = Instance.new("UICorner")
    local Topbar = Instance.new("Frame")
    local TopCorner = Instance.new("UICorner")
    local WindowsName = Instance.new("TextLabel")
    local CloseBtn = Instance.new("ImageButton")
    local leftbar = Instance.new("Frame")
    local LeftCorner = Instance.new("UICorner")
    local UiTopBarStroke = Instance.new("Frame")

    -- open button
    local OpenBtn = Instance.new("Frame")
    local OpenCorner = Instance.new("UICorner")
    local OpenGrad = Instance.new("UIGradient")
    local OpenText = Instance.new("TextLabel")
    local OpenClick = Instance.new("TextButton")
    local OpenCloseBtn = Instance.new("ImageButton")

    OpenBtn.Name = "open"; OpenBtn.Parent = ScreenGui; OpenBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255); OpenBtn.Position = UDim2.new(0.462, 0, 0.087, 0); OpenBtn.Size = UDim2.new(0, 133, 0, 36); OpenBtn.Visible = false; OpenBtn.Active = true
    OpenCorner.CornerRadius = UDim.new(1, 0); OpenCorner.Parent = OpenBtn
    OpenGrad.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(47, 47, 47)), ColorSequenceKeypoint.new(1, Color3.fromRGB(38, 38, 38))}; OpenGrad.Rotation = 87; OpenGrad.Parent = OpenBtn
    OpenText.Parent = OpenBtn; OpenText.BackgroundTransparency = 1; OpenText.Size = UDim2.new(1, -35, 1, 0); OpenText.Position = UDim2.new(0, 12, 0, 0); OpenText.Font = Enum.Font.GothamMedium; OpenText.Text = "Open "..hubName; OpenText.TextColor3 = Color3.fromRGB(255, 255, 255); OpenText.TextSize = 13; OpenText.TextXAlignment = Enum.TextXAlignment.Left
    OpenClick.Parent = OpenBtn; OpenClick.Size = UDim2.new(1, -35, 1, 0); OpenClick.BackgroundTransparency = 1; OpenClick.Text = ""

    OpenCloseBtn.Name = "DestroyBtn"; OpenCloseBtn.Parent = OpenBtn; OpenCloseBtn.BackgroundTransparency = 1; OpenCloseBtn.Position = UDim2.new(1, -28, 0.5, -10); OpenCloseBtn.Size = UDim2.new(0, 20, 0, 20); OpenCloseBtn.Image = "rbxassetid://10137832201"; OpenCloseBtn.ImageColor3 = Color3.fromRGB(200, 50, 50)
    OpenCloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

    local function MakeDraggable(obj)
        local dragging, dragInput, dragStart, startPos
        obj.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true; dragStart = input.Position; startPos = obj.Position
            end
        end)
        obj.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                local delta = input.Position - dragStart
                obj.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)
        obj.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
        end)
    end
    MakeDraggable(OpenBtn)
    MakeDraggable(MainFrame)

    local function ToggleUI(state)
        if state == "close" then
            TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Size = UDim2.new(0, 590, 0, 42)}):Play()
            task.wait(0.3)
            MainFrame.Visible = false
            OpenBtn.Visible = true
            OpenBtn.Size = UDim2.new(0,0,0,0)
            TweenService:Create(OpenBtn, TweenInfo.new(0.4, Enum.EasingStyle.Back), {Size = UDim2.new(0, 133, 0, 36)}):Play()
        else
            TweenService:Create(OpenBtn, TweenInfo.new(0.2), {Size = UDim2.new(0,0,0,0)}):Play()
            task.wait(0.2)
            OpenBtn.Visible = false
            MainFrame.Visible = true
            MainFrame.Size = UDim2.new(0, 590, 0, 42)
            TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back), {Size = UDim2.new(0, 590, 0, 407)}):Play()
        end
    end

    MainFrame.Name = "MainFrame"; MainFrame.Parent = ScreenGui; MainFrame.BackgroundColor3 = Color3.fromRGB(44, 44, 44); MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.35, 0, 0.25, 0); MainFrame.Size = UDim2.new(0, 590, 0, 407); MainFrame.Active = true; MainFrame.ClipsDescendants = true
    MainCorner.CornerRadius = UDim.new(0, 9); MainCorner.Parent = MainFrame

    Topbar.Name = "Topbar"; Topbar.Parent = MainFrame; Topbar.BackgroundColor3 = Color3.fromRGB(34, 34, 34); Topbar.Size = UDim2.new(1, 0, 0, 42); Topbar.ZIndex = 5
    TopCorner.CornerRadius = UDim.new(0, 9); TopCorner.Parent = Topbar
    local topFix = Instance.new("Frame", Topbar); topFix.Size = UDim2.new(1, 0, 0, 10); topFix.Position = UDim2.new(0, 0, 1, -10); topFix.BackgroundColor3 = Color3.fromRGB(34, 34, 34); topFix.BorderSizePixel = 0

    -- Container pour Titre + Icone
    local TitleContainer = Instance.new("Frame", Topbar)
    TitleContainer.Size = UDim2.new(0, 200, 1, 0); TitleContainer.Position = UDim2.new(0.035, 0, 0, 0); TitleContainer.BackgroundTransparency = 1
    local TitleList = Instance.new("UIListLayout", TitleContainer); TitleList.FillDirection = Enum.FillDirection.Horizontal; TitleList.VerticalAlignment = Enum.VerticalAlignment.Center; TitleList.Padding = UDim.new(0, 8)

    CreateIcon(TitleContainer, iconId)

    WindowsName.Parent = TitleContainer; WindowsName.BackgroundTransparency = 1; WindowsName.Size = UDim2.new(0, 145, 1, 0); WindowsName.Font = Enum.Font.GothamMedium; WindowsName.Text = hubName; WindowsName.TextColor3 = Color3.fromRGB(255, 255, 255); WindowsName.TextSize = 16; WindowsName.TextXAlignment = Enum.TextXAlignment.Left

    CloseBtn.Parent = Topbar; CloseBtn.BackgroundTransparency = 1; CloseBtn.Position = UDim2.new(0.94, 0, 0.2, 0); CloseBtn.Size = UDim2.new(0, 23, 0, 23); CloseBtn.Image = "rbxassetid://10137832201"; CloseBtn.ImageColor3 = Color3.fromRGB(138, 138, 138)
    CloseBtn.MouseButton1Click:Connect(function() ToggleUI("close") end)
    OpenClick.MouseButton1Click:Connect(function() ToggleUI("open") end)

    leftbar.Name = "leftbar"; leftbar.Parent = MainFrame; leftbar.BackgroundColor3 = Color3.fromRGB(34, 34, 34); leftbar.Position = UDim2.new(0, 0, 0.103, 0); leftbar.Size = UDim2.new(0, 157, 0.897, 0)
    LeftCorner.CornerRadius = UDim.new(0, 9); LeftCorner.Parent = leftbar
    local leftFix = Instance.new("Frame", leftbar); leftFix.Size = UDim2.new(1, 0, 0, 10); leftFix.BackgroundColor3 = Color3.fromRGB(34, 34, 34); leftFix.BorderSizePixel = 0

    UiTopBarStroke.Parent = MainFrame; UiTopBarStroke.BackgroundColor3 = Color3.fromRGB(84, 84, 84); UiTopBarStroke.BorderSizePixel = 0; UiTopBarStroke.Position = UDim2.new(0, 0, 0.103, 0); UiTopBarStroke.Size = UDim2.new(1, 0, 0, 1); UiTopBarStroke.ZIndex = 6

    local TabScroll = Instance.new("Frame", leftbar); TabScroll.Size = UDim2.new(1, 0, 1, -15); TabScroll.Position = UDim2.new(0, 0, 0, 8); TabScroll.BackgroundTransparency = 1
    local TabList = Instance.new("UIListLayout", TabScroll); TabList.HorizontalAlignment = Enum.HorizontalAlignment.Center; TabList.Padding = UDim.new(0, 8)
    local PageHolder = Instance.new("Frame", MainFrame); PageHolder.BackgroundTransparency = 1; PageHolder.Position = UDim2.new(0.285, 0, 0.13, 0); PageHolder.Size = UDim2.new(0.68, 0, 0.84, 0)

    local Window = {}
    function Window:CreateTab(name, iconId)
        local TabBtn = Instance.new("Frame", TabScroll); TabBtn.Size = UDim2.new(0, 133, 0, 34); TabBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(1, 0)
        local Stroke = Instance.new("UIStroke", TabBtn); Stroke.Color = Color3.fromRGB(84, 84, 84); Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        local Grad = Instance.new("UIGradient", TabBtn); Grad.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(47, 47, 47)), ColorSequenceKeypoint.new(1, Color3.fromRGB(38, 38, 38))}; Grad.Rotation = 87
        
        local TabContent = Instance.new("Frame", TabBtn); TabContent.Size = UDim2.new(1, 0, 1, 0); TabContent.BackgroundTransparency = 1
        local TabL = Instance.new("UIListLayout", TabContent); TabL.FillDirection = Enum.FillDirection.Horizontal; TabL.HorizontalAlignment = Enum.HorizontalAlignment.Center; TabL.VerticalAlignment = Enum.VerticalAlignment.Center; TabL.Padding = UDim.new(0, 6)

        CreateIcon(TabContent, iconId)

        local Label = Instance.new("TextLabel", TabContent); Label.Size = UDim2.new(0, 0, 1, 0); Label.AutomaticSize = Enum.AutomaticSize.X; Label.BackgroundTransparency = 1; Label.Font = Enum.Font.Gotham; Label.Text = name; Label.TextColor3 = Color3.fromRGB(255, 255, 255); Label.TextSize = 13
        local RealBtn = Instance.new("TextButton", TabBtn); RealBtn.Size = UDim2.new(1, 0, 1, 0); RealBtn.BackgroundTransparency = 1; RealBtn.Text = ""

        local Page = Instance.new("ScrollingFrame", PageHolder); Page.Size = UDim2.new(1, 0, 1, 0); Page.BackgroundTransparency = 1; Page.Visible = false; Page.ScrollBarThickness = 0; Page.CanvasSize = UDim2.new(0,0,0,0)
        local PageList = Instance.new("UIListLayout", Page); PageList.Padding = UDim.new(0, 8); PageList.HorizontalAlignment = Enum.HorizontalAlignment.Center
        PageList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() Page.CanvasSize = UDim2.new(0,0,0, PageList.AbsoluteContentSize.Y + 10) end)

        local function OpenTab()
            for _, v in pairs(PageHolder:GetChildren()) do if v:IsA("ScrollingFrame") then v.Visible = false end end
            Page.Visible = true
        end
        RealBtn.MouseButton1Click:Connect(OpenTab)

        local Tab = {}
        Tab.Show = OpenTab

        function Tab:CreateParagraph(title, content, iconId)
            local PFrame = Instance.new("Frame", Page); PFrame.Size = UDim2.new(0, 390, 0, 60); PFrame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            Instance.new("UICorner", PFrame).CornerRadius = UDim.new(0, 6)
            Instance.new("UIStroke", PFrame).Color = Color3.fromRGB(60, 60, 60)
            
            local PTitleCont = Instance.new("Frame", PFrame); PTitleCont.Position = UDim2.new(0, 10, 0, 5); PTitleCont.Size = UDim2.new(1, -20, 0, 20); PTitleCont.BackgroundTransparency = 1
            local PList = Instance.new("UIListLayout", PTitleCont); PList.FillDirection = Enum.FillDirection.Horizontal; PList.VerticalAlignment = Enum.VerticalAlignment.Center; PList.Padding = UDim.new(0, 6)

            CreateIcon(PTitleCont, iconId)

            local T = Instance.new("TextLabel", PTitleCont); T.Size = UDim2.new(1, -25, 1, 0); T.Font = Enum.Font.GothamBold; T.Text = title; T.TextColor3 = Color3.fromRGB(255, 255, 255); T.TextSize = 13; T.TextXAlignment = Enum.TextXAlignment.Left; T.BackgroundTransparency = 1
            local C = Instance.new("TextLabel", PFrame); C.Position = UDim2.new(0, 10, 0, 25); C.Size = UDim2.new(1, -20, 0, 30); C.Font = Enum.Font.Gotham; C.Text = content; C.TextColor3 = Color3.fromRGB(180, 180, 180); C.TextSize = 12; C.TextXAlignment = Enum.TextXAlignment.Left; C.TextWrapped = true; C.BackgroundTransparency = 1
            PFrame.Size = UDim2.new(0, 390, 0, C.TextBounds.Y + 35)
        end

        function Tab:CreateButton(text, callback, iconId)
            local BFrame = Instance.new("Frame", Page); BFrame.Size = UDim2.new(0, 390, 0, 35); BFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Instance.new("UICorner", BFrame).CornerRadius = UDim.new(0, 6)
            local BStroke = Instance.new("UIStroke", BFrame); BStroke.Color = Color3.fromRGB(84, 84, 84); BStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            local G = Instance.new("UIGradient", BFrame); G.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(47, 47, 47)), ColorSequenceKeypoint.new(1, Color3.fromRGB(38, 38, 38))}; G.Rotation = 87
            
            local BCont = Instance.new("Frame", BFrame); BCont.Position = UDim2.new(0.05, 0, 0, 0); BCont.Size = UDim2.new(0.9, 0, 1, 0); BCont.BackgroundTransparency = 1
            local BList = Instance.new("UIListLayout", BCont); BList.FillDirection = Enum.FillDirection.Horizontal; BList.VerticalAlignment = Enum.VerticalAlignment.Center; BList.Padding = UDim.new(0, 8)

            CreateIcon(BCont, iconId)

            local L = Instance.new("TextLabel", BCont); L.Size = UDim2.new(1, -25, 1, 0); L.BackgroundTransparency = 1; L.Font = Enum.Font.Gotham; L.Text = text; L.TextColor3 = Color3.fromRGB(255, 255, 255); L.TextSize = 13; L.TextXAlignment = Enum.TextXAlignment.Left
            local C = Instance.new("TextButton", BFrame); C.Size = UDim2.new(1, 0, 1, 0); C.BackgroundTransparency = 1; C.Text = ""
            C.MouseButton1Down:Connect(function() TweenService:Create(BFrame, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(200, 200, 200)}):Play() end)
            C.MouseButton1Up:Connect(function() TweenService:Create(BFrame, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play(); callback() end)
        end

        function Tab:CreateToggle(text, callback, iconId)
            local TFrame = Instance.new("Frame", Page); TFrame.Size = UDim2.new(0, 390, 0, 35); TFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Instance.new("UICorner", TFrame).CornerRadius = UDim.new(0, 6)
            local TStroke = Instance.new("UIStroke", TFrame); TStroke.Color = Color3.fromRGB(60, 60, 60)
            local G = Instance.new("UIGradient", TFrame); G.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(47, 47, 47)), ColorSequenceKeypoint.new(1, Color3.fromRGB(38, 38, 38))}; G.Rotation = 87
            
            local TCont = Instance.new("Frame", TFrame); TCont.Position = UDim2.new(0.05, 0, 0, 0); TCont.Size = UDim2.new(0.7, 0, 1, 0); TCont.BackgroundTransparency = 1
            local TList = Instance.new("UIListLayout", TCont); TList.FillDirection = Enum.FillDirection.Horizontal; TList.VerticalAlignment = Enum.VerticalAlignment.Center; TList.Padding = UDim.new(0, 8)

            CreateIcon(TCont, iconId)

            local L = Instance.new("TextLabel", TCont); L.Size = UDim2.new(1, -25, 1, 0); L.BackgroundTransparency = 1; L.Font = Enum.Font.Gotham; L.Text = text; L.TextColor3 = Color3.fromRGB(255, 255, 255); L.TextSize = 13; L.TextXAlignment = Enum.TextXAlignment.Left
            local Switch = Instance.new("Frame", TFrame); Switch.Position = UDim2.new(0.88, 0, 0.22, 0); Switch.Size = UDim2.new(0, 32, 0, 18); Switch.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            Instance.new("UICorner", Switch).CornerRadius = UDim.new(1, 0)
            local Circle = Instance.new("Frame", Switch); Circle.Size = UDim2.new(0, 14, 0, 14); Circle.Position = UDim2.new(0, 2, 0.5, -7); Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Instance.new("UICorner", Circle).CornerRadius = UDim.new(1, 0)
            local TBtn = Instance.new("TextButton", TFrame); TBtn.Size = UDim2.new(1,0,1,0); TBtn.BackgroundTransparency = 1; TBtn.Text = ""
            local toggled = false
            TBtn.MouseButton1Click:Connect(function()
                toggled = not toggled
                TweenService:Create(Circle, TweenInfo.new(0.2), {Position = toggled and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)}):Play()
                TweenService:Create(Switch, TweenInfo.new(0.2), {BackgroundColor3 = toggled and Color3.fromRGB(150, 150, 150) or Color3.fromRGB(55, 55, 55)}):Play()
                callback(toggled)
            end)
        end

        function Tab:CreateSlider(text, min, max, default, callback, iconId)
            local SFrame = Instance.new("Frame", Page); SFrame.Size = UDim2.new(0, 390, 0, 45); SFrame.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
            Instance.new("UICorner", SFrame).CornerRadius = UDim.new(0, 6)
            
            local SCont = Instance.new("Frame", SFrame); SCont.Position = UDim2.new(0.05, 0, 0.1, 0); SCont.Size = UDim2.new(0.5, 0, 0.4, 0); SCont.BackgroundTransparency = 1
            local SList = Instance.new("UIListLayout", SCont); SList.FillDirection = Enum.FillDirection.Horizontal; SList.VerticalAlignment = Enum.VerticalAlignment.Center; SList.Padding = UDim.new(0, 6)

            CreateIcon(SCont, iconId)

            local L = Instance.new("TextLabel", SCont); L.Size = UDim2.new(1, -25, 1, 0); L.BackgroundTransparency = 1; L.Font = Enum.Font.Gotham; L.Text = text; L.TextColor3 = Color3.fromRGB(255, 255, 255); L.TextSize = 12; L.TextXAlignment = Enum.TextXAlignment.Left
            local Val = Instance.new("TextLabel", SFrame); Val.Position = UDim2.new(0.45, 0, 0.1, 0); Val.Size = UDim2.new(0.5, 0, 0.4, 0); Val.BackgroundTransparency = 1; Val.Font = Enum.Font.Gotham; Val.Text = tostring(default); Val.TextColor3 = Color3.fromRGB(255, 255, 255); Val.TextSize = 12; Val.TextXAlignment = Enum.TextXAlignment.Right
            local Bar = Instance.new("Frame", SFrame); Bar.Size = UDim2.new(0.9, 0, 0, 4); Bar.Position = UDim2.new(0.05, 0, 0.7, 0); Bar.BackgroundColor3 = Color3.fromRGB(60, 60, 60); Bar.BorderSizePixel = 0
            local Fill = Instance.new("Frame", Bar); Fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0); Fill.BackgroundColor3 = Color3.fromRGB(255, 255, 255); Fill.BorderSizePixel = 0
            local sliding = false
            local function move(input)
                local pos = math.clamp((input.Position.X - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X, 0, 1)
                local value = math.floor(min + (max - min) * pos)
                Fill.Size = UDim2.new(pos, 0, 1, 0)
                Val.Text = tostring(value)
                callback(value)
            end
            SFrame.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then sliding = true move(input) end end)
            SFrame.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then sliding = false end end)
            UserInputService.InputChanged:Connect(function(input) if sliding and input.UserInputType == Enum.UserInputType.MouseMovement then move(input) end end)
        end

        return Tab
    end
    return Window
end

return Library
