RageUI = {}
RageUI.Item = {}
RageUI.Panel = {}
RageUI.Window = {}
RMenu = setmetatable({}, RMenu)

local TotalMenus = {}

function RMenu.Add(Type, Name, Menu)
    if RMenu[Type] ~= nil then
        RMenu[Type][Name] = {
            Menu = Menu
        }
    else
        RMenu[Type] = {}
        RMenu[Type][Name] = {
            Menu = Menu
        }
    end
    return table.insert(TotalMenus, Menu)
end

function RMenu:Get(Type, Name)
    if self[Type] ~= nil and self[Type][Name] ~= nil then
        return self[Type][Name].Menu
    end
end

function RMenu:GetType(Type)
    if self[Type] ~= nil then
        return self[Type]
    end
end

function RMenu:Settings(Type, Name, Settings, Value)
    if Value ~= nil then
        self[Type][Name][Settings] = Value
    else
        return self[Type][Name][Settings]
    end
end

function RMenu:Delete(Type, Name)
    self[Type][Name] = nil
    collectgarbage()
end

function RMenu:DeleteType(Type)
    self[Type] = nil
    collectgarbage()
end

function math.round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

function string.starts(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end

RageUI.Menus = setmetatable({}, RageUI.Menus)
RageUI.Menus.__call = function()
    return true
end

RageUI.Menus.__index = RageUI.Menus
RageUI.CurrentMenu = nil
RageUI.NextMenu = nil
RageUI.Options = 0
RageUI.ItemOffset = 0
RageUI.StatisticPanelCount = 0
RageUI.UI = {
    Current = "NativeUI",
    Style = {
        RageUI = {
            Width = 0
        },
        NativeUI = {
            Width = 0
        }
    }
}

RageUI.Settings = {
    Debug = false,
    Controls = {
        Up = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 172 },
                { 1, 172 },
                { 2, 172 },
                { 0, 241 },
                { 1, 241 },
                { 2, 241 },
            },
        },
        Down = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 173 },
                { 1, 173 },
                { 2, 173 },
                { 0, 242 },
                { 1, 242 },
                { 2, 242 },
            },
        },
        Left = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 174 },
                { 1, 174 },
                { 2, 174 },
            },
        },
        Right = {
            Enabled = true,
            Pressed = false,
            Active = false,
            Keys = {
                { 0, 175 },
                { 1, 175 },
                { 2, 175 },
            },
        },
        SliderLeft = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 174 },
                { 1, 174 },
                { 2, 174 },
            },
        },
        SliderRight = {
            Enabled = true,
            Pressed = false,
            Active = false,
            Keys = {
                { 0, 175 },
                { 1, 175 },
                { 2, 175 },
            },
        },
        Select = {
            Enabled = true,
            Pressed = false,
            Active = false,
            Keys = {
                { 0, 201 },
                { 1, 201 },
                { 2, 201 },
            },
        },
        Back = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 177 },
                { 1, 177 },
                { 2, 177 },
                { 0, 199 },
                { 1, 199 },
                { 2, 199 },
            },
        },
        Click = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 24 },
            },
        },
        Enabled = {
            Controller = {
                { 0, 2 }, -- Look Up and Down
                { 0, 1 }, -- Look Left and Right
                { 0, 25 }, -- Aim
                { 0, 24 }, -- Attack
            },
            Keyboard = {
                { 0, 201 }, -- Select
                { 0, 195 }, -- X axis
                { 0, 196 }, -- Y axis
                { 0, 187 }, -- Down
                { 0, 188 }, -- Up
                { 0, 189 }, -- Left
                { 0, 190 }, -- Right
                { 0, 202 }, -- Back
                { 0, 217 }, -- Select
                { 0, 242 }, -- Scroll down
                { 0, 241 }, -- Scroll up
                { 0, 239 }, -- Cursor X
                { 0, 240 }, -- Cursor Y
                { 0, 31 }, -- Move Up and Down
                { 0, 30 }, -- Move Left and Right
                { 0, 21 }, -- Sprint
                { 0, 22 }, -- Jump
                { 0, 23 }, -- Enter
                { 0, 75 }, -- Exit Vehicle
                { 0, 71 }, -- Accelerate Vehicle
                { 0, 72 }, -- Vehicle Brake
                { 0, 59 }, -- Move Vehicle Left and Right
                { 0, 89 }, -- Fly Yaw Left
                { 0, 9 }, -- Fly Left and Right
                { 0, 8 }, -- Fly Up and Down
                { 0, 90 }, -- Fly Yaw Right
                { 0, 76 }, -- Vehicle Handbrake
            },
        },
    },
    Audio = {
        Id = nil,
        Use = "NativeUI",
        RageUI = {
            UpDown = {
                audioName = "HUD_FREEMODE_SOUNDSET",
                audioRef = "NAV_UP_DOWN",
            },
            LeftRight = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "NAV_LEFT_RIGHT",
            },
            Select = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "SELECT",
            },
            Back = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "BACK",
            },
            Error = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "ERROR",
            },
            Slider = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "CONTINUOUS_SLIDER",
                Id = nil
            },
        },
        NativeUI = {
            UpDown = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "NAV_UP_DOWN",
            },
            LeftRight = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "NAV_LEFT_RIGHT",
            },
            Select = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "SELECT",
            },
            Back = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "BACK",
            },
            Error = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "ERROR",
            },
            Slider = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "CONTINUOUS_SLIDER",
                Id = nil
            },
        }
    },
    ItSAMS = {
        Title = {
            Background = { Width = 425, Height = 105 },
            Text = { X = 128, Y = 42, Scale = 0.20 }, 
        },        
        Subtitle = {
            Background = { Width = 425, Height = 35 },
            Text = { X = 8, Y = 6, Scale = 0.26 },
            PreText = { X = 425, Y = 6, Scale = 0.26 },
        },
        Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 0, Width = 425 },
        Navigation = {
            Rectangle = { Width = 425, Height = 18 },
            Offset = 5,
            Arrows = { Dictionary = "commonmenu", Texture = "shop_arrows_upanddown", X = 190, Y = -6, Width = 50, Height = 50 },
        },
        Description = {
            Bar = { Y = 4, Width = 425, Height = 4 },
            Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 4, Width = 425, Height = 30 },
            Text = { X = 8, Y = 10, Scale = 0.26 },
        },
    },
    Panels = {
        Grid = {
            Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 4, Width = 425, Height = 275 },
            Grid = { Dictionary = "pause_menu_pages_char_mom_dad", Texture = "nose_grid", X = 115.5, Y = 47.5, Width = 200, Height = 200 },
            Circle = { Dictionary = "mpinventory", Texture = "in_world_circle", X = 115.5, Y = 47.5, Width = 20, Height = 20 },
            Text = {
                Top = { X = 215.5, Y = 15, Scale = 0.36 },
                Bottom = { X = 215.5, Y = 250, Scale = 0.36 },
                Left = { X = 57.75, Y = 130, Scale = 0.36 },
                Right = { X = 373.25, Y = 130, Scale = 0.36 },
            },
        },
        Percentage = {
            Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 4, Width = 425, Height = 76 },
            Bar = { X = 9, Y = 50, Width = 413, Height = 10 },
            Text = {
                Left = { X = 25, Y = 15, Scale = 0.35 },
                Middle = { X = 215.5, Y = 15, Scale = 0.35 },
                Right = { X = 398, Y = 15, Scale = 0.35 },
            },
        },
    },
}

function RageUI.SetScaleformParams(scaleform, data)
    data = data or {}
    for _, v in pairs(data) do
        PushScaleformMovieFunction(scaleform, v.name)
        if v.param then
            for _, par in pairs(v.param) do
                if math.type(par) == "integer" then
                    PushScaleformMovieFunctionParameterInt(par)
                elseif type(par) == "boolean" then
                    PushScaleformMovieFunctionParameterBool(par)
                elseif math.type(par) == "float" then
                    PushScaleformMovieFunctionParameterFloat(par)
                elseif type(par) == "string" then
                    PushScaleformMovieFunctionParameterString(par)
                end
            end
        end
        if v.func then
            v.func()
        end
        PopScaleformMovieFunctionVoid()
    end
end

function RageUI.IsMouseInBounds(X, Y, Width, Height)
    local MX, MY = math.round(GetControlNormal(2, 239) * 1920) / 1920, math.round(GetControlNormal(2, 240) * 1080) / 1080
    X, Y = X / 1920, Y / 1080
    Width, Height = Width / 1920, Height / 1080
    return (MX >= X and MX <= X + Width) and (MY > Y and MY < Y + Height)
end

function RageUI.GetSafeZoneBounds()
    local SafeSize = GetSafeZoneSize()
    SafeSize = math.round(SafeSize, 2)
    SafeSize = (SafeSize * 100) - 90
    SafeSize = 10 - SafeSize

    local W, H = 1920, 1080

    return { X = math.round(SafeSize * ((W / H) * 5.4)), Y = math.round(SafeSize * 5.4) }
end

function RageUI.Visible(Menu, Value)
    if Menu ~= nil and Menu() then
        if Value == true or Value == false then
            if Value then
                if RageUI.CurrentMenu ~= nil then
                    if RageUI.CurrentMenu.Closed ~= nil then
                        RageUI.CurrentMenu.Closed()
                    end
                    RageUI.CurrentMenu.Open = not Value
                    Menu:UpdateInstructionalButtons(Value);
                    Menu:UpdateCursorStyle();

                end
                RageUI.CurrentMenu = Menu
            else
                RageUI.CurrentMenu = nil
            end
            Menu.Open = Value
            RageUI.Options = 0
            RageUI.ItemOffset = 0
            RageUI.LastControl = false
        else
            return Menu.Open
        end
    end
end

function RageUI.CloseAll()
    if RageUI.CurrentMenu ~= nil then
        local parent = RageUI.CurrentMenu.Parent
        while parent ~= nil do
            parent.Index = 1
            parent.Pagination.Minimum = 1
            parent.Pagination.Maximum = parent.Pagination.Total
            parent = parent.Parent
        end
        RageUI.CurrentMenu.Index = 1
        RageUI.CurrentMenu.Pagination.Minimum = 1
        RageUI.CurrentMenu.Pagination.Maximum = RageUI.CurrentMenu.Pagination.Total
        RageUI.CurrentMenu.Open = false
        RageUI.CurrentMenu = nil
    end
    RageUI.Options = 0
    RageUI.ItemOffset = 0
    ResetScriptGfxAlign()
end

function RageUI.Banner()
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() and (CurrentMenu.Display.Header) then
            RageUI.ItSAMSSafeZone(CurrentMenu)
            if CurrentMenu.Sprite ~= nil and CurrentMenu.Sprite.Dictionary ~= nil and CurrentMenu.Sprite.Dictionary ~= 'commonmenua' then
                RenderSprite(CurrentMenu.Sprite.Dictionary, CurrentMenu.Sprite.Texture, CurrentMenu.X + 25, CurrentMenu.Y + 43, 432 + CurrentMenu.WidthOffset, RageUI.Settings.ItSAMS.Title.Background.Height -2, nil)
            else
                RenderRectangle(CurrentMenu.X + 25, CurrentMenu.Y + 42.5, 432 + CurrentMenu.WidthOffset, RageUI.Settings.ItSAMS.Title.Background.Height - 1, 16, 16, 16, 235)
                RenderRectangle(CurrentMenu.X + 25, CurrentMenu.Y + 42.5, 432 + CurrentMenu.WidthOffset, RageUI.Settings.ItSAMS.Title.Background.Height - 1, 250, 250, 250, 5)
            end
            if (CurrentMenu.Display.Glare) then

                local ScaleformMovie = RequestScaleformMovie("MP_MENU_GLARE")
                local Glarewidth = 400
                local Glareheight = RageUI.Settings.ItSAMS.Title.Background.Height + 2
                local GlareX = CurrentMenu.X / 1920 + (CurrentMenu.SafeZoneSize.X / (64.85 - (CurrentMenu.WidthOffset)))
                local GlareY = CurrentMenu.Y / 1080 + CurrentMenu.SafeZoneSize.Y / 30.695020746888
                RageUI.SetScaleformParams(ScaleformMovie, {
                    { name = "SET_ROTATION", param = { GetGameplayCamRelativeHeading() }}
                })
                DrawScaleformMovie(ScaleformMovie, GlareX, GlareY, Glarewidth / 430, Glareheight / 100, 255, 255, 255, 255, 0)
            end
            local PosX = function()
                return CurrentMenu.X + RageUI.Settings.ItSAMS.Title.Text.X + (CurrentMenu.WidthOffset / 2) - 70
            end
            RenderText(CurrentMenu.Title, PosX(), CurrentMenu.Y + 30 + RageUI.Settings.ItSAMS.Title.Text.Y + 5, CurrentMenu.TitleFont, 0.78, 255, 255, 255, 255, 3)
            RageUI.ItemOffset = RageUI.ItemOffset + RageUI.Settings.ItSAMS.Title.Background.Height
        end
    end
end

function RageUI.Subtitle()
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() and (CurrentMenu.Display.Subtitle) then
            RageUI.ItSAMSSafeZone(CurrentMenu)
            if CurrentMenu.Subtitle ~= "" then
                RenderRectangle(CurrentMenu.X + 25, CurrentMenu.Y + 41 + RageUI.ItemOffset, 432 + CurrentMenu.WidthOffset, RageUI.Settings.ItSAMS.Subtitle.Background.Height + CurrentMenu.SubtitleHeight - 2, 16, 16, 16, 185)
                RenderText(CurrentMenu.PageCounterColour .. CurrentMenu.Subtitle, CurrentMenu.X + RageUI.Settings.ItSAMS.Subtitle.Text.X + 25, CurrentMenu.Y + 41 + RageUI.Settings.ItSAMS.Subtitle.Text.Y + RageUI.ItemOffset, 0, RageUI.Settings.ItSAMS.Subtitle.Text.Scale, 245, 245, 245, 255, nil, false, false, 432 + CurrentMenu.WidthOffset)
                if CurrentMenu.Index > CurrentMenu.Options or CurrentMenu.Index < 0 then
                    CurrentMenu.Index = 1
                end
                if (CurrentMenu ~= nil) then
                    if (CurrentMenu.Index > CurrentMenu.Pagination.Total) then
                        local offset = CurrentMenu.Index - CurrentMenu.Pagination.Total
                        CurrentMenu.Pagination.Minimum = 1 + offset
                        CurrentMenu.Pagination.Maximum = CurrentMenu.Pagination.Total + offset
                    else
                        CurrentMenu.Pagination.Minimum = 1
                        CurrentMenu.Pagination.Maximum = CurrentMenu.Pagination.Total
                    end
                end

                if CurrentMenu.Display.PageCounter then
                    if CurrentMenu.PageCounter == nil then
                        RenderText(CurrentMenu.PageCounterColour .. CurrentMenu.Index .. "/" .. CurrentMenu.Options, CurrentMenu.X + 25 + RageUI.Settings.ItSAMS.Subtitle.PreText.X + CurrentMenu.WidthOffset - 5, CurrentMenu.Y + 41 + RageUI.Settings.ItSAMS.Subtitle.PreText.Y + RageUI.ItemOffset, 0, RageUI.Settings.ItSAMS.Subtitle.PreText.Scale, 245, 245, 245, 255, 2)
                    else
                        RenderText(CurrentMenu.PageCounter, CurrentMenu.X + RageUI.Settings.ItSAMS.Subtitle.PreText.X + 25 + CurrentMenu.WidthOffset, CurrentMenu.Y + RageUI.Settings.ItSAMS.Subtitle.PreText.Y + 41 + RageUI.ItemOffset, 0, RageUI.Settings.ItSAMS.Subtitle.PreText.Scale, 245, 245, 245, 255, 2)
                    end
                end
                RageUI.ItemOffset = RageUI.ItemOffset + RageUI.Settings.ItSAMS.Subtitle.Background.Height
            end
        end
    end
end

function RageUI.Background()
    local CurrentMenu = RageUI.CurrentMenu;
    if CurrentMenu ~= nil then
        if CurrentMenu() and (CurrentMenu.Display.Background) then
            RageUI.ItSAMSSafeZone(CurrentMenu)
            SetScriptGfxDrawOrder(0)
            RenderRectangle(CurrentMenu.X + 25, CurrentMenu.Y + RageUI.Settings.ItSAMS.Background.Y + CurrentMenu.SubtitleHeight + 50, RageUI.Settings.ItSAMS.Background.Width + CurrentMenu.WidthOffset + 7, RageUI.ItemOffset - 10, 0, 0, 0, 100)
            SetScriptGfxDrawOrder(1)
        end
    end
end

function RageUI.Description()
    local CurrentMenu = RageUI.CurrentMenu;
    local Description = RageUI.Settings.ItSAMS.Description;
    if CurrentMenu ~= nil and CurrentMenu.Description ~= nil then
        if CurrentMenu() then
            RageUI.ItSAMSSafeZone(CurrentMenu)
            RenderRectangle(CurrentMenu.X + 25, CurrentMenu.Y + Description.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 40, Description.Background.Width + CurrentMenu.WidthOffset + 7.5, CurrentMenu.DescriptionHeight - 5, 0, 0, 0, 150)
            RenderText(CurrentMenu.Description, CurrentMenu.X + 25 + Description.Text.X, CurrentMenu.Y + Description.Text.Y + CurrentMenu.SubtitleHeight + 40 + RageUI.ItemOffset, 0, Description.Text.Scale, 255, 255, 255, 255, nil, false, false, 420)
            RageUI.ItemOffset = RageUI.ItemOffset + CurrentMenu.DescriptionHeight + Description.Bar.Y
        end
    end
end

function RageUI.Render()
    local CurrentMenu = RageUI.CurrentMenu;
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            if CurrentMenu.Safezone then
                ResetScriptGfxAlign()
            end

            if (CurrentMenu.Display.InstructionalButton) then
                if not CurrentMenu.InitScaleform then
                    CurrentMenu:UpdateInstructionalButtons(true)
                    CurrentMenu.InitScaleform = true
                end
                DrawScaleformMovieFullscreen(CurrentMenu.InstructionalScaleform, 255, 255, 255, 255, 0)
            end
            CurrentMenu.Options = RageUI.Options
            CurrentMenu.SafeZoneSize = nil
            RageUI.Controls()
            RageUI.Options = 0
            RageUI.StatisticPanelCount = 0
            RageUI.ItemOffset = 0
            if CurrentMenu.Controls.Back.Enabled then
                if CurrentMenu.Controls.Back.Pressed and CurrentMenu.Closable then
                    CurrentMenu.Controls.Back.Pressed = false
                    local Audio = RageUI.Settings.Audio
                    RageUI.PlaySound(Audio[Audio.Use].Back.audioName, Audio[Audio.Use].Back.audioRef)
                    --CreateDui("https://audio.jukehost.co.uk/ctZWIgrfmDoOgqpGOXYKrPpa9NBrymd0", 100, 100)

                    if CurrentMenu.Closed ~= nil then
                        collectgarbage()
                        CurrentMenu.Closed()
                    end

                    if CurrentMenu.Parent ~= nil then
                        if CurrentMenu.Parent() then
                            RageUI.NextMenu = CurrentMenu.Parent
                            CurrentMenu:UpdateCursorStyle()
                        else
                            RageUI.NextMenu = nil
                            RageUI.Visible(CurrentMenu, false)
                        end
                    else
                        RageUI.NextMenu = nil
                        RageUI.Visible(CurrentMenu, false)
                    end
                elseif CurrentMenu.Controls.Back.Pressed and not CurrentMenu.Closable then
                    CurrentMenu.Controls.Back.Pressed = false
                end
            end
            if RageUI.NextMenu ~= nil then
                if RageUI.NextMenu() then
                    RageUI.Visible(CurrentMenu, false)
                    RageUI.Visible(RageUI.NextMenu, true)
                    CurrentMenu.Controls.Select.Active = false
                    RageUI.NextMenu = nil
                    RageUI.LastControl = false
                end
            end
        end
    end
end

function RageUI.ItSAMSDescription(CurrentMenu, Description, Selected)
    if Description ~= "" or Description ~= nil then
        local SettingsDescription = RageUI.Settings.ItSAMS.Description;
        if Selected and CurrentMenu.Description ~= Description then
            CurrentMenu.Description = Description or nil
            local DescriptionLineCount = GetLineCount(CurrentMenu.Description, CurrentMenu.X + SettingsDescription.Text.X, CurrentMenu.Y + SettingsDescription.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsDescription.Text.Scale, 255, 255, 255, 255, nil, false, false, SettingsDescription.Background.Width + (CurrentMenu.WidthOffset - 5.0))
            if DescriptionLineCount > 1 then
                CurrentMenu.DescriptionHeight = SettingsDescription.Background.Height * DescriptionLineCount
            else
                CurrentMenu.DescriptionHeight = SettingsDescription.Background.Height + 7
            end
        end
    end
end

function RageUI.ItSAMSMouseBounds(CurrentMenu, Selected, Option, SettingsButton)
    local Hovered = false
    Hovered = RageUI.IsMouseInBounds(CurrentMenu.X + CurrentMenu.SafeZoneSize.X, CurrentMenu.Y + SettingsButton.Rectangle.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.Rectangle.Width + CurrentMenu.WidthOffset, SettingsButton.Rectangle.Height)
    if Hovered and not Selected then
        RenderRectangle(CurrentMenu.X, CurrentMenu.Y + SettingsButton.Rectangle.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.Rectangle.Width + CurrentMenu.WidthOffset, SettingsButton.Rectangle.Height, 255, 255, 255, 20)
        if CurrentMenu.Controls.Click.Active then
            CurrentMenu.Index = Option
            local Audio = RageUI.Settings.Audio
            RageUI.PlaySound(Audio[Audio.Use].UpDown.audioName, Audio[Audio.Use].UpDown.audioRef)
        end
    end
    return Hovered;
end

function RageUI.ItSAMSSafeZone(CurrentMenu)
    if not CurrentMenu.SafeZoneSize then
        CurrentMenu.SafeZoneSize = { X = 0, Y = 0 }
        if CurrentMenu.Safezone then
            CurrentMenu.SafeZoneSize = RageUI.GetSafeZoneBounds()
            SetScriptGfxAlign(76, 84)
            SetScriptGfxAlignParams(0, 0, 0, 0)
        end
    end
end

function RageUI.CurrentIsEqualTo(Current, To, Style, DefaultStyle)
    return Current == To and Style or DefaultStyle or {};
end

function RageUI.IsVisible(Menu, ItSAMS, Panels, Banner)
    if (RageUI.Visible(Menu)) and (UpdateOnscreenKeyboard() ~= 0) and (UpdateOnscreenKeyboard() ~= 3) then
        RageUI.CurrentMenu.X = GetResourceKvpInt('MENU_ALIGNMENT') == 1 and 0 or -20 or 0
        local Pagination = GetResourceKvpInt('MENU_LENGTH') == 2 and 10 or 15
        RageUI.CurrentMenu.Pagination = { Minimum = 1, Maximum = Pagination, Total = Pagination }
        if (Banner ~= false) then
            RageUI.Banner()
        end
        RageUI.Subtitle()
        if (ItSAMS ~= nil) then
            ItSAMS()
        end
        RageUI.Background();
        RageUI.Navigation();
        RageUI.Description();
        if (Panels ~= nil) then
            Panels()
        end
        RageUI.Render()
    end
end

function RageUI.SetStyleAudio(StyleAudio)
    RageUI.Settings.Audio.Use = StyleAudio or "RageUI"
end

function RageUI.GetStyleAudio()
    return RageUI.Settings.Audio.Use or "RageUI"
end

function RageUI.CreateMenu(Title, Subtitle, _, _, TextureDictionary, TextureName, _, _, _, _)
    local Menu = {}
    Menu.Display = {};

    Menu.InstructionalButtons = {}

    Menu.Display.Header = true;
    Menu.Display.Glare = false;
    Menu.Display.Subtitle = true;
    Menu.Display.Background = true;
    Menu.Display.Navigation = true;
    Menu.Display.InstructionalButton = true;
    Menu.Display.PageCounter = true;

    Menu.Title = Title or ""
    Menu.TitleFont = 1
    Menu.TitleScale = 0.2
    Menu.Subtitle = Subtitle or nil
    Menu.SubtitleHeight = -37
    Menu.Description = nil
    Menu.DescriptionHeight = RageUI.Settings.ItSAMS.Description.Background.Height
    Menu.X = GetResourceKvpInt('rightMenu') == 1 and 1400 or 0
    Menu.Y = 20
    Menu.Parent = nil
    Menu.WidthOffset = RageUI.UI.Style[RageUI.UI.Current].Width
    Menu.Open = false
    Menu.Controls = RageUI.Settings.Controls
    Menu.Index = 1
    -- Menu.Sprite = { Dictionary = TextureDictionary or "commonmenu", Texture = TextureName or "interaction_bgd" }
    Menu.Rectangle = nil
    Menu.Pagination = { Minimum = 1, Maximum = 10, Total = 10 }
    Menu.Safezone = true
    Menu.SafeZoneSize = nil
    Menu.EnableMouse = false
    Menu.Options = 0
    Menu.Closable = true
    Menu.InstructionalScaleform = RequestScaleformMovie("INSTRUCTIONAL_BUTTONS")
    Menu.CursorStyle = 1

    if string.starts(Menu.Subtitle, "~") then
        Menu.PageCounterColour = string.lower(string.sub(Menu.Subtitle, 1, 3))
    else
        Menu.PageCounterColour = ""
    end

    if Menu.Subtitle ~= "" then
        local SubtitleLineCount = GetLineCount(Menu.Subtitle, Menu.X + RageUI.Settings.ItSAMS.Subtitle.Text.X, Menu.Y + RageUI.Settings.ItSAMS.Subtitle.Text.Y, 0, RageUI.Settings.ItSAMS.Subtitle.Text.Scale, 245, 245, 245, 255, nil, false, false, RageUI.Settings.ItSAMS.Subtitle.Background.Width + Menu.WidthOffset)

        if SubtitleLineCount > 1 then
            Menu.SubtitleHeight = 18 * SubtitleLineCount
        else
            Menu.SubtitleHeight = 0
        end
    end

    Citizen.CreateThread(function()
        if not HasScaleformMovieLoaded(Menu.InstructionalScaleform) then
            Menu.InstructionalScaleform = RequestScaleformMovie("INSTRUCTIONAL_BUTTONS")
            while not HasScaleformMovieLoaded(Menu.InstructionalScaleform) do
                Citizen.Wait(0)
            end
        end
    end)

    Citizen.CreateThread(function()
        local ScaleformMovie = RequestScaleformMovie("MP_MENU_GLARE")
        while not HasScaleformMovieLoaded(ScaleformMovie) do
            Citizen.Wait(0)
        end
    end)

    return setmetatable(Menu, RageUI.Menus)
end

function RageUI.CreateSubMenu(ParentMenu, Title, Subtitle, X, Y, TextureDictionary, TextureName, R, G, B, A)
    if ParentMenu ~= nil then
        if ParentMenu() then
            local Menu = RageUI.CreateMenu(Title or ParentMenu.Title, Subtitle or string.upper(ParentMenu.Subtitle), X or ParentMenu.X, Y or ParentMenu.Y)
            Menu.Parent = ParentMenu
            Menu.WidthOffset = ParentMenu.WidthOffset
            Menu.Safezone = ParentMenu.Safezone
            if ParentMenu.Sprite then
                Menu.Sprite = { Dictionary = TextureDictionary or ParentMenu.Sprite.Dictionary, Texture = TextureName or ParentMenu.Sprite.Texture, Color = { R = R, G = G, B = B, A = A } }
            else
                Menu.Rectangle = ParentMenu.Rectangle
            end
            return setmetatable(Menu, RageUI.Menus)
        else
            return nil
        end
    else
        return nil
    end
end

function RageUI.Menus:DisplayHeader(boolean)
    self.Display.Header = boolean;
    return self.Display.Header;
end

function RageUI.Menus:DisplayGlare(boolean)
    self.Display.Glare = boolean;
    return self.Display.Glare;
end

function RageUI.Menus:DisplaySubtitle(boolean)
    self.Display.Subtitle = boolean;
    return self.Display.Subtitle;
end

function RageUI.Menus:DisplayNavigation(boolean)
    self.Display.Navigation = boolean;
    return self.Display.Navigation;
end

function RageUI.Menus:DisplayInstructionalButton(boolean)
    self.Display.InstructionalButton = boolean;
    return self.Display.InstructionalButton;
end

function RageUI.Menus:DisplayPageCounter(boolean)
    self.Display.PageCounter= boolean;
    return self.Display.PageCounter;
end

function RageUI.Menus:SetTitle(Title)
    self.Title = Title
end

function RageUI.GetInMenu()
    local inMenu = false

    if RageUI.CurrentMenu == nil then
        inMenu = true
    end
    return inMenu
end

function RageUI.Menus:SetStyleSize(Value)
    local witdh
    if Value >= 0 and Value <= 100 then
        witdh = Value
    else
        witdh = 100
    end
    self.WidthOffset = witdh
end

function RageUI.Menus:GetStyleSize()
    if (self.WidthOffset == 100) then
        return "RageUI"
    elseif (self.WidthOffset == 0) then
        return "NativeUI";
    else
        return self.WidthOffset;
    end
end

function RageUI.Menus:SetCursorStyle(Int)
    self.CursorStyle = Int or 1 or 0
    SetMouseCursorSprite(Int)
end

function RageUI.Menus:ResetCursorStyle()
    self.CursorStyle = 1
    SetMouseCursorSprite(1)
end

function RageUI.Menus:UpdateCursorStyle()
    SetMouseCursorSprite(self.CursorStyle)
end

function RageUI.Menus:RefreshIndex()
    self.Index = 1
end

function RageUI.Menus:SetSubtitle(Subtitle)

    self.Subtitle = string.upper(Subtitle) or string.upper(self.Subtitle)

    if string.starts(self.Subtitle, "~") then
        self.PageCounterColour = string.lower(string.sub(self.Subtitle, 1, 3))
    else
        self.PageCounterColour = ""
    end
    if self.Subtitle ~= "" then
        local SubtitleLineCount = GetLineCount(self.Subtitle, self.X + RageUI.Settings.ItSAMS.Subtitle.Text.X, self.Y + RageUI.Settings.ItSAMS.Subtitle.Text.Y, 0, RageUI.Settings.ItSAMS.Subtitle.Text.Scale, 245, 245, 245, 255, nil, false, false, RageUI.Settings.ItSAMS.Subtitle.Background.Width + self.WidthOffset)

        if SubtitleLineCount > 1 then
            self.SubtitleHeight = 18 * SubtitleLineCount
        else
            self.SubtitleHeight = 0
        end

    else
        self.SubtitleHeight = -37
    end
end

function RageUI.Menus:SetPageCounter(Subtitle)
    self.PageCounter = Subtitle
end

function RageUI.Menus:SetPosition(X, Y)
    self.X = tonumber(X) or self.X
    self.Y = tonumber(Y) or self.Y
end
function RageUI.Menus:SetTotalItSAMSPerPage(Value)
    self.Pagination.Total = tonumber(Value) or self.Pagination.Total
end

function RageUI.Menus:SetRectangleBanner(R, G, B, A)
    self.Rectangle = { R = tonumber(R) or 255, G = tonumber(G) or 255, B = tonumber(B) or 255, A = tonumber(A) or 255 }
    self.Sprite = nil
end

function RageUI.Menus:SetSpriteBanner(TextureDictionary, Texture)
    self.Sprite = { Dictionary = TextureDictionary or "commonmenua", Texture = Texture or "interaction_bgd" }
    self.Rectangle = nil
end

function RageUI.Menus:Closable(boolean)
    if type(boolean) == "boolean" then
        self.Closable = boolean
    else
        error("Type is not boolean")
    end
end

function RageUI.Menus:AddInstructionButton(button)
    if type(button) == "table" and #button == 2 then
        table.insert(self.InstructionalButtons, button)
        self.UpdateInstructionalButtons(true);
    end
end

function RageUI.Menus:ClearInstructionButtons()
    self.InstructionalButtons = {}
    self.UpdateInstructionalButtons(true);
end

function RageUI.Menus:RemoveInstructionButton(button)
    if type(button) == "table" then
        for i = 1, #self.InstructionalButtons do
            if button == self.InstructionalButtons[i] then
                table.remove(self.InstructionalButtons, i)
                self.UpdateInstructionalButtons(true);
                break
            end
        end
    else
        if tonumber(button) then
            if self.InstructionalButtons[tonumber(button)] then
                table.remove(self.InstructionalButtons, tonumber(button))
                self.UpdateInstructionalButtons(true);
            end
        end
    end
end

function RageUI.Menus:UpdateInstructionalButtons(Visible)

    if not Visible then
        return
    end

    BeginScaleformMovieMethod(self.InstructionalScaleform, "CLEAR_ALL")
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(self.InstructionalScaleform, "TOGGLE_MOUSE_BUTTONS")
    ScaleformMovieMethodAddParamInt(0)
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(self.InstructionalScaleform, "CREATE_CONTAINER")
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(self.InstructionalScaleform, "SET_DATA_SLOT")
    ScaleformMovieMethodAddParamInt(0)
    PushScaleformMovieMethodParameterButtonName(GetControlInstructionalButton(2, 176, 0))
    PushScaleformMovieMethodParameterString(GetLabelText("HUD_INPUT2"))
    EndScaleformMovieMethod()

    if self.Closable then
        BeginScaleformMovieMethod(self.InstructionalScaleform, "SET_DATA_SLOT")
        ScaleformMovieMethodAddParamInt(1)
        PushScaleformMovieMethodParameterButtonName(GetControlInstructionalButton(2, 177, 0))
        PushScaleformMovieMethodParameterString(GetLabelText("HUD_INPUT3"))
        EndScaleformMovieMethod()
    end

    local count = 2

    if (self.InstructionalButtons ~= nil) then
        for i = 1, #self.InstructionalButtons do
            if self.InstructionalButtons[i] then
                if #self.InstructionalButtons[i] == 2 then
                    BeginScaleformMovieMethod(self.InstructionalScaleform, "SET_DATA_SLOT")
                    ScaleformMovieMethodAddParamInt(count)
                    PushScaleformMovieMethodParameterButtonName(self.InstructionalButtons[i][1])
                    PushScaleformMovieMethodParameterString(self.InstructionalButtons[i][2])
                    EndScaleformMovieMethod()
                    count = count + 1
                end
            end
        end
    end

    BeginScaleformMovieMethod(self.InstructionalScaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
    ScaleformMovieMethodAddParamInt(-1)
    EndScaleformMovieMethod()
end

RageUI.LastControl = false

local ControlActions = {
    'Left',
    'Right',
    'Select',
    'Click',
}

function RageUI.GoUp(Options)
    local CurrentMenu = RageUI.CurrentMenu;
    if CurrentMenu ~= nil then
        Options = CurrentMenu.Options
        if CurrentMenu() then
            if (Options ~= 0) then
                --CreateDui('https://audio.jukehost.co.uk/oxNJdIvrnt5l3qaHlBjPPbsYasQOyjAO', 900, 900)
                if Options > CurrentMenu.Pagination.Total then
                    if CurrentMenu.Index <= CurrentMenu.Pagination.Minimum then
                        if CurrentMenu.Index == 1 then
                            CurrentMenu.Pagination.Minimum = Options - (CurrentMenu.Pagination.Total - 1)
                            CurrentMenu.Pagination.Maximum = Options
                            CurrentMenu.Index = Options
                        else
                            CurrentMenu.Pagination.Minimum = (CurrentMenu.Pagination.Minimum - 1)
                            CurrentMenu.Pagination.Maximum = (CurrentMenu.Pagination.Maximum - 1)
                            CurrentMenu.Index = CurrentMenu.Index - 1
                        end
                    else
                        CurrentMenu.Index = CurrentMenu.Index - 1
                    end
                else
                    if CurrentMenu.Index == 1 then
                        CurrentMenu.Pagination.Minimum = Options - (CurrentMenu.Pagination.Total - 1)
                        CurrentMenu.Pagination.Maximum = Options
                        CurrentMenu.Index = Options
                    else
                        CurrentMenu.Index = CurrentMenu.Index - 1
                    end
                end

                local Audio = RageUI.Settings.Audio
                RageUI.PlaySound(Audio[Audio.Use].UpDown.audioName, Audio[Audio.Use].UpDown.audioRef)
                RageUI.LastControl = true
                if (CurrentMenu.onIndexChange ~= nil) then
                    Citizen.CreateThread(function()
                        CurrentMenu.onIndexChange(CurrentMenu.Index)
                    end)
                end
            else
                local Audio = RageUI.Settings.Audio
                RageUI.PlaySound(Audio[Audio.Use].Error.audioName, Audio[Audio.Use].Error.audioRef)
            end
        end
    end
end

local SettingsInfo = {
    Rectangle = { X = 418, Y = 0, Width = 432, Height = 45, Color = { 13, 20, 34, 255 }},
    Text = {
        Title = { X = 445, Y = 10, Scale = 0.30,},
        Right = { X = 445, Y = 42, Scale = 0.25, Color = { 145, 148, 150, 255 }},
        Left = { X = 865, Y = 42, Scale = 0.25, Color = { 255, 255, 255, 255 }},
    },
}

function RageUI.Info(Title, RightText, LeftText)
    local LineCount = #RightText >= #LeftText and #RightText or #LeftText
    if Title ~= nil then
        RenderText(Title, RageUI.CurrentMenu.WidthOffset + SettingsInfo.Text.Title.X + 20, SettingsInfo.Text.Title.Y + 62, 100, SettingsInfo.Text.Title.Scale, 255, 255, 255, 255, 0)
    end
    if RightText ~= nil then
        RenderText(table.concat(RightText, "\n"), RageUI.CurrentMenu.WidthOffset + SettingsInfo.Text.Right.X + 20, SettingsInfo.Text.Right.Y + 62, 99, SettingsInfo.Text.Right.Scale, 145, 148, 150, 255, 0, true)
    end
    if LeftText ~= nil then
        RenderText(table.concat(LeftText, "\n"), RageUI.CurrentMenu.WidthOffset + SettingsInfo.Text.Left.X + 20, SettingsInfo.Text.Left.Y + 62, 100, SettingsInfo.Text.Left.Scale, 255, 255, 255, 255, 2, true)
    end

    RenderSprite("commonmenu", "gradient_bgd", SettingsInfo.Rectangle.X + 20, SettingsInfo.Rectangle.Y + 62, SettingsInfo.Rectangle.Width, SettingsInfo.Rectangle.Height + (LineCount * 20), 0, 0, 0, 0, 255)
end

function RageUI.GoDown(Options)
    local CurrentMenu = RageUI.CurrentMenu;
    if CurrentMenu ~= nil then
        Options = CurrentMenu.Options
        if CurrentMenu() then
            if (Options ~= 0) then
                --CreateDui('https://audio.jukehost.co.uk/oxNJdIvrnt5l3qaHlBjPPbsYasQOyjAO', 900, 900)
                if Options > CurrentMenu.Pagination.Total then
                    if CurrentMenu.Index >= CurrentMenu.Pagination.Maximum then
                        if CurrentMenu.Index == Options then
                            CurrentMenu.Pagination.Minimum = 1
                            CurrentMenu.Pagination.Maximum = CurrentMenu.Pagination.Total
                            CurrentMenu.Index = 1
                        else
                            CurrentMenu.Pagination.Maximum = (CurrentMenu.Pagination.Maximum + 1)
                            CurrentMenu.Pagination.Minimum = CurrentMenu.Pagination.Maximum - (CurrentMenu.Pagination.Total - 1)
                            CurrentMenu.Index = CurrentMenu.Index + 1
                        end
                    else
                        CurrentMenu.Index = CurrentMenu.Index + 1
                    end
                else
                    if CurrentMenu.Index == Options then
                        CurrentMenu.Pagination.Minimum = 1
                        CurrentMenu.Pagination.Maximum = CurrentMenu.Pagination.Total
                        CurrentMenu.Index = 1
                    else
                        CurrentMenu.Index = CurrentMenu.Index + 1
                    end
                end
                local Audio = RageUI.Settings.Audio
                RageUI.PlaySound(Audio[Audio.Use].UpDown.audioName, Audio[Audio.Use].UpDown.audioRef)
                RageUI.LastControl = false
                if (CurrentMenu.onIndexChange ~= nil) then
                    Citizen.CreateThread(function()
                        CurrentMenu.onIndexChange(CurrentMenu.Index)
                    end)
                end
            else
                local Audio = RageUI.Settings.Audio
                RageUI.PlaySound(Audio[Audio.Use].Error.audioName, Audio[Audio.Use].Error.audioRef)
            end
        end
    end
end

function RageUI.GoActionControl(Controls, Action)
    if Controls[Action or 'Left'].Enabled then
        for Index = 1, #Controls[Action or 'Left'].Keys do
            if not Controls[Action or 'Left'].Pressed then
                if IsDisabledControlJustPressed(Controls[Action or 'Left'].Keys[Index][1], Controls[Action or 'Left'].Keys[Index][2]) then
                    Controls[Action or 'Left'].Pressed = true
                    Citizen.CreateThread(function()
                        Controls[Action or 'Left'].Active = true
                        Citizen.Wait(0.01)
                        Controls[Action or 'Left'].Active = false
                        Citizen.Wait(175)
                        while Controls[Action or 'Left'].Enabled and IsDisabledControlPressed(Controls[Action or 'Left'].Keys[Index][1], Controls[Action or 'Left'].Keys[Index][2]) do
                            Controls[Action or 'Left'].Active = true
                            Citizen.Wait(1)
                            Controls[Action or 'Left'].Active = false
                            Citizen.Wait(124)
                        end
                        Controls[Action or 'Left'].Pressed = false
                        if (Action ~= ControlActions[5]) then
                            Citizen.Wait(10)
                        end
                    end)
                    break
                end
            end
        end
    end
end

function RageUI.GoActionControlSlider(Controls, Action)
    if Controls[Action].Enabled then
        for Index = 1, #Controls[Action].Keys do
            if not Controls[Action].Pressed then
                if IsDisabledControlJustPressed(Controls[Action].Keys[Index][1], Controls[Action].Keys[Index][2]) then
                    Controls[Action].Pressed = true
                    Citizen.CreateThread(function()
                        Controls[Action].Active = true
                        Citizen.Wait(1)
                        Controls[Action].Active = false
                        while Controls[Action].Enabled and IsDisabledControlPressed(Controls[Action].Keys[Index][1], Controls[Action].Keys[Index][2]) do
                            Controls[Action].Active = true
                            Citizen.Wait(1)
                            Controls[Action].Active = false
                        end
                        Controls[Action].Pressed = false
                    end)
                    break
                end
            end
        end
    end
end

function RageUI.Controls()
    local CurrentMenu = RageUI.CurrentMenu;
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            if CurrentMenu.Open then
                local Controls = CurrentMenu.Controls;
                local Options = CurrentMenu.Options
                RageUI.Options = CurrentMenu.Options
                if CurrentMenu.EnableMouse then
                    DisableAllControlActions(2)
                end

                if not IsInputDisabled(2) then
                    for Index = 1, #Controls.Enabled.Controller do
                        EnableControlAction(Controls.Enabled.Controller[Index][1], Controls.Enabled.Controller[Index][2], true)
                    end
                else
                    for Index = 1, #Controls.Enabled.Keyboard do
                        EnableControlAction(Controls.Enabled.Keyboard[Index][1], Controls.Enabled.Keyboard[Index][2], true)
                    end
                end

                if Controls.Up.Enabled then
                    for Index = 1, #Controls.Up.Keys do
                        if not Controls.Up.Pressed then
                            if IsDisabledControlJustPressed(Controls.Up.Keys[Index][1], Controls.Up.Keys[Index][2]) then
                                Controls.Up.Pressed = true
                                Citizen.CreateThread(function()
                                    RageUI.GoUp(Options)
                                    Citizen.Wait(175)
                                    while Controls.Up.Enabled and IsDisabledControlPressed(Controls.Up.Keys[Index][1], Controls.Up.Keys[Index][2]) do
                                        RageUI.GoUp(Options)
                                        Citizen.Wait(50)
                                    end
                                    Controls.Up.Pressed = false
                                end)
                                break
                            end
                        end
                    end
                end

                if Controls.Down.Enabled then
                    for Index = 1, #Controls.Down.Keys do
                        if not Controls.Down.Pressed then
                            if IsDisabledControlJustPressed(Controls.Down.Keys[Index][1], Controls.Down.Keys[Index][2]) then
                                Controls.Down.Pressed = true
                                Citizen.CreateThread(function()
                                    RageUI.GoDown(Options)
                                    Citizen.Wait(175)
                                    while Controls.Down.Enabled and IsDisabledControlPressed(Controls.Down.Keys[Index][1], Controls.Down.Keys[Index][2]) do
                                        RageUI.GoDown(Options)
                                        Citizen.Wait(50)
                                    end
                                    Controls.Down.Pressed = false
                                end)
                                break
                            end
                        end
                    end
                end

                for i = 1, #ControlActions do
                    RageUI.GoActionControl(Controls, ControlActions[i])
                end

                RageUI.GoActionControlSlider(Controls, 'SliderLeft')
                RageUI.GoActionControlSlider(Controls, 'SliderRight')

                if Controls.Back.Enabled then
                    for Index = 1, #Controls.Back.Keys do
                        if not Controls.Back.Pressed then
                            if IsDisabledControlJustPressed(Controls.Back.Keys[Index][1], Controls.Back.Keys[Index][2]) then
                                Controls.Back.Pressed = true
                                Citizen.CreateThread(function()
                                    Citizen.Wait(175)
                                    Controls.Down.Pressed = false
                                end)
                                break
                            end
                        end
                    end
                end

            end
        end
    end
end

function RageUI.Navigation()
    local CurrentMenu = RageUI.CurrentMenu;
    if CurrentMenu ~= nil then
        if CurrentMenu() and (CurrentMenu.Display.Navigation) then
            if CurrentMenu.EnableMouse then
                SetMouseCursorActiveThisFrame()
            end
            if RageUI.Options > CurrentMenu.Pagination.Total then
                local UpHovered = false
                local DownHovered = false

                if not CurrentMenu.SafeZoneSize then
                    CurrentMenu.SafeZoneSize = { X = 0, Y = 0 }

                    if CurrentMenu.Safezone then
                        CurrentMenu.SafeZoneSize = RageUI.GetSafeZoneBounds()

                        SetScriptGfxAlign(76, 84)
                        SetScriptGfxAlignParams(0, 0, 0, 0)
                    end
                end

                if CurrentMenu.EnableMouse then
                    UpHovered = RageUI.IsMouseInBounds(CurrentMenu.X + CurrentMenu.SafeZoneSize.X, CurrentMenu.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.ItSAMS.Navigation.Rectangle.Width + CurrentMenu.WidthOffset, RageUI.Settings.ItSAMS.Navigation.Rectangle.Height)
                    DownHovered = RageUI.IsMouseInBounds(CurrentMenu.X + CurrentMenu.SafeZoneSize.X, CurrentMenu.Y + RageUI.Settings.ItSAMS.Navigation.Rectangle.Height + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.ItSAMS.Navigation.Rectangle.Width + CurrentMenu.WidthOffset, RageUI.Settings.ItSAMS.Navigation.Rectangle.Height)

                    if CurrentMenu.Controls.Click.Active then
                        if UpHovered then
                            RageUI.GoUp(RageUI.Options)
                        elseif DownHovered then
                            RageUI.GoDown(RageUI.Options)
                        end
                    end

                    -- if UpHovered then
                    --     RenderRectangle(CurrentMenu.X, CurrentMenu.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.ItSAMS.Navigation.Rectangle.Width + CurrentMenu.WidthOffset, RageUI.Settings.ItSAMS.Navigation.Rectangle.Height, 30, 30, 30, 255)
                    -- else
                    --     RenderRectangle(CurrentMenu.X, CurrentMenu.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.ItSAMS.Navigation.Rectangle.Width + CurrentMenu.WidthOffset, RageUI.Settings.ItSAMS.Navigation.Rectangle.Height, 0, 0, 0, 200)
                    -- end

                    -- if DownHovered then
                    --     RenderRectangle(CurrentMenu.X, CurrentMenu.Y + RageUI.Settings.ItSAMS.Navigation.Rectangle.Height + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.ItSAMS.Navigation.Rectangle.Width + CurrentMenu.WidthOffset, RageUI.Settings.ItSAMS.Navigation.Rectangle.Height, 30, 30, 30, 255)
                    -- else
                    --     RenderRectangle(CurrentMenu.X, CurrentMenu.Y + RageUI.Settings.ItSAMS.Navigation.Rectangle.Height + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.ItSAMS.Navigation.Rectangle.Width + CurrentMenu.WidthOffset, RageUI.Settings.ItSAMS.Navigation.Rectangle.Height, 0, 0, 0, 200)
                    -- end
                else
                --     RenderRectangle(CurrentMenu.X, CurrentMenu.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.ItSAMS.Navigation.Rectangle.Width + CurrentMenu.WidthOffset, RageUI.Settings.ItSAMS.Navigation.Rectangle.Height, 0, 0, 0, 200)
                --     RenderRectangle(CurrentMenu.X, CurrentMenu.Y + RageUI.Settings.ItSAMS.Navigation.Rectangle.Height + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.ItSAMS.Navigation.Rectangle.Width + CurrentMenu.WidthOffset, RageUI.Settings.ItSAMS.Navigation.Rectangle.Height, 0, 0, 0, 200)
                end
                -- RenderSprite(RageUI.Settings.ItSAMS.Navigation.Arrows.Dictionary, RageUI.Settings.ItSAMS.Navigation.Arrows.Texture, CurrentMenu.X + RageUI.Settings.ItSAMS.Navigation.Arrows.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + RageUI.Settings.ItSAMS.Navigation.Arrows.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.ItSAMS.Navigation.Arrows.Width, RageUI.Settings.ItSAMS.Navigation.Arrows.Height)
                -- RageUI.ItemOffset = RageUI.ItemOffset + (RageUI.Settings.ItSAMS.Navigation.Rectangle.Height * 2)
            end
        end
    end
end

function RageUI.GoBack()
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        local Audio = RageUI.Settings.Audio
        RageUI.PlaySound(Audio[Audio.Use].Back.audioName, Audio[Audio.Use].Back.audioRef)
        if CurrentMenu.Parent ~= nil then
            if CurrentMenu.Parent() then
                RageUI.NextMenu = CurrentMenu.Parent
            else
                RageUI.NextMenu = nil
                RageUI.Visible(CurrentMenu, false)
            end
        else
            RageUI.NextMenu = nil
            RageUI.Visible(CurrentMenu, false)
        end
    end
end

function RageUI.PlaySound(Library, Sound, IsLooped)
    local audioId
    if not IsLooped then
        PlaySoundFrontend(-1, Sound, Library, true)
    else
        if not audioId then
            Citizen.CreateThread(function()
                audioId = GetSoundId()
                PlaySoundFrontend(audioId, Sound, Library, true)
                Citizen.Wait(0.01)
                StopSound(audioId)
                ReleaseSoundId(audioId)
                audioId = nil
            end)
        end
    end
end

local enums = {
    __index = function(table, key)
        if rawget(table.enums, key) then
            return key
        end
    end
}
function RageUI.Enum(t)
    local e = { enums = t }
    return setmetatable(e, enums)
end

Keys = {};
function Keys.Register(Controls, ControlName, Description, Action)
    local _Keys = {
        CONTROLS = Controls
    }
    RegisterKeyMapping(string.format('RageUI-%s', ControlName), Description, "keyboard", Controls)
    RegisterCommand(string.format('RageUI-%s', ControlName), function(_, _)
        if (Action ~= nil) then
            Action();
        end
    end, false)
    return setmetatable(_Keys, Keys)
end

function Keys:Exists(Controls)
    return self.CONTROLS == Controls and true or false
end
function RenderRectangle(X, Y, Width, Height, R, G, B, A)
    X, Y, Width, Height = (tonumber(X) or 0) / 1920, (tonumber(Y) or 0) / 1080, (tonumber(Width) or 0) / 1920, (tonumber(Height) or 0) / 1080
    DrawRect(X + Width * 0.5, Y + Height * 0.5, Width, Height, tonumber(R) or 255, tonumber(G) or 255, tonumber(B) or 255, tonumber(A) or 255)
end

function RenderSprite(TextureDictionary, TextureName, X, Y, Width, Height, Heading, R, G, B, A)
    X, Y, Width, Height = (tonumber(X) or 0) / 1920, (tonumber(Y) or 0) / 1080, (tonumber(Width) or 0) / 1920, (tonumber(Height) or 0) / 1080
    if not HasStreamedTextureDictLoaded(TextureDictionary) then
        RequestStreamedTextureDict(TextureDictionary, true)
    end
    DrawSprite(TextureDictionary, TextureName, X + Width * 0.5, Y + Height * 0.5, Width, Height, Heading or 0, tonumber(R) or 255, tonumber(G) or 255, tonumber(B) or 255, tonumber(A) or 255)
end

function StringToArray(str)
    local charCount = #str
    local strCount = math.ceil(charCount / 99)
    local strings = {}

    for i = 1, strCount do
        local start = (i - 1) * 99 + 1
        local clamp = math.clamp(#string.sub(str, start), 0, 99)
        local finish = ((i ~= 1) and (start - 1) or 0) + clamp

        strings[i] = string.sub(str, start, finish)
    end

    return strings
end

function MeasureStringWidth(str, font, scale)
    BeginTextCommandWidth("CELL_EMAIL_BCON")
    AddTextComponentSubstringPlayerName(str)
    SetTextFont(font or 0)
    SetTextScale(1.0, scale or 0)
    return EndTextCommandGetWidth(true) * 1920
end

function AddText(str)
    str = tostring(str)
    local charCount = #str

    if charCount < 100 then
        AddTextComponentSubstringPlayerName(str)
    else
        local strings = StringToArray(str)

        for s = 1, #strings do
            AddTextComponentSubstringPlayerName(strings[s])
        end
    end
end

function GetLineCount(Text, X, Y, Font, Scale, R, G, B, A, Alignment, DropShadow, Outline, WordWrap)
    Text, X, Y = tostring(Text), (tonumber(X) or 0) / 1920, (tonumber(Y) or 0) / 1080
    SetTextFont(Font or 0)
    SetTextScale(1.0, Scale or 0)
    SetTextColour(tonumber(R) or 255, tonumber(G) or 255, tonumber(B) or 255, tonumber(A) or 255)
    if DropShadow then
        SetTextDropShadow()
    end
    if Outline then
        SetTextOutline()
    end
    if Alignment ~= nil then
        if Alignment == 1 or Alignment == "Center" or Alignment == "Centre" then
            SetTextCentre(true)
        elseif Alignment == 2 or Alignment == "Right" then
            SetTextRightJustify(true)
        end
    end
    if tonumber(WordWrap) and tonumber(WordWrap) ~= 0 then
        if Alignment == 1 or Alignment == "Center" or Alignment == "Centre" then
            SetTextWrap(X - ((WordWrap / 1920) / 2), X + ((WordWrap / 1920) / 2))
        elseif Alignment == 2 or Alignment == "Right" then
            SetTextWrap(0, X)
        else
            SetTextWrap(X, X + (WordWrap / 1920))
        end
    else
        if Alignment == 2 or Alignment == "Right" then
            SetTextWrap(0, X)
        end
    end

    BeginTextCommandLineCount("CELL_EMAIL_BCON")
    AddText(Text)
    return GetTextScreenLineCount(X, Y)
end

function RenderText(Text, X, Y, Font, Scale, R, G, B, A, Alignment, DropShadow, Outline, WordWrap)
    Text, X, Y = tostring(Text), (tonumber(X) or 0) / 1920, (tonumber(Y) or 0) / 1080
    SetTextFont(Font or 0)
    SetTextScale(1.0, Scale or 0)
    SetTextColour(tonumber(R) or 255, tonumber(G) or 255, tonumber(B) or 255, tonumber(A) or 255)
    if DropShadow then
        SetTextDropShadow()
    end
    if Outline then
        SetTextOutline()
    end
    if Alignment ~= nil then
        if Alignment == 1 or Alignment == "Center" or Alignment == "Centre" then
            SetTextCentre(true)
        elseif Alignment == 2 or Alignment == "Right" then
            SetTextRightJustify(true)
        end
    end
    if tonumber(WordWrap) and tonumber(WordWrap) ~= 0 then
        if Alignment == 1 or Alignment == "Center" or Alignment == "Centre" then
            SetTextWrap(X - ((WordWrap / 1920) / 2), X + ((WordWrap / 1920) / 2))
        elseif Alignment == 2 or Alignment == "Right" then
            SetTextWrap(0, X)
        else
            SetTextWrap(X, X + (WordWrap / 1920))
        end
    else
        if Alignment == 2 or Alignment == "Right" then
            SetTextWrap(0, X)
        end
    end
    BeginTextCommandDisplayText("CELL_EMAIL_BCON")
    AddText(Text)
    EndTextCommandDisplayText(X, Y)
end

function RageUI.Text(array)
    ClearPrints()
    SetTextEntry_2("STRING")
    if (array.message ~= nil) then
        AddTextComponentString(tostring(array.message))
    else
        error("Missing arguments, message")
    end
    if (array.time_display ~= nil) then
        DrawSubtitleTimed(tonumber(array.time_display), 1)
    else
        DrawSubtitleTimed(10, 1)
    end
    if (array.sound ~= nil) then
        if (array.sound.audio_name ~= nil) then
            if (array.sound.audio_ref ~= nil) then
                PlaySoundFrontend(-1, array.sound.audio_name, array.sound.audio_ref, true)
            else
                error("Missing arguments, audio_ref")
            end
        else
            error("Missing arguments, audio_name")
        end
    end
end

Visual = Visual or {};

function Visual.Progress(Title, Delay, Sound, FastClose)
    if (Sound) then
        PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", true)
    end
    Citizen.CreateThread(function()
        local startTime = GetGameTimer()
        local endTime = GetGameTimer() + (Delay * 1000)
        local duration = endTime - startTime
        while true do
            Citizen.Wait(0)
            RenderSprite("timerbars", "all_black_bg", 1560, 1030, 350, 35, 0.0, 0, 0, 0, 180)
            RenderRectangle(1745, 1042, 150, 12, 150, 150, 150, 200)
            RenderText(Title:upper(), 1580, 1038, 8, 0.25, 255, 255, 255, 255, 3)

            RenderRectangle(1745, 1042, math.min((150 / duration) * (GetGameTimer() - startTime), 150), 12, 255, 255, 255, 255)
            if not FastClose then
                if GetGameTimer() >= endTime + 3000 then
                    break
                end
            else
                if GetGameTimer() >= endTime then
                    break
                end
            end
        end
    end)
end

RegisterCommand("progress", function(source, args)
--    Visual.Progress("Recolte en cours", 10, true)
    Visual.BarTimer("Recolte en cours", args[1])
end)

local function AddLongString(txt)
    for i = 100, string.len(txt), 99 do
        local sub = string.sub(txt, i, i + 99)
        AddTextComponentSubstringPlayerName(sub)
    end
end

local forceStop = false

function Visual.BarTimerforceStop()
    forceStop = true
    Citizen.Wait(5000)
    forceStop = false
end

function Visual.BarTimer(Title, Time)
    local startTime = GetGameTimer()
    local endTime = GetGameTimer() + (Time * 1000)
    local duration = endTime - startTime
    local secRemaining = false
    while true do
        local currentTime = GetGameTimer()
        local elapsedTime = currentTime - startTime

        if elapsedTime >= duration or forceStop then
            break
        end

        RenderSprite("timerbars", "all_black_bg", 1650, 1030, 260, 35, 0.0, 0, 0, 0, 200)
        RenderText(Title, 1700 - (#Title * 1.5), 1038, 8, 0.25, 255, 255, 255, 255, 0)
        if ((duration - elapsedTime) / 1000) > 10 then
            RenderText(string.format("%02d:%02d", math.floor((duration - elapsedTime) / 60000), math.floor(((duration - elapsedTime) % 60000) / 1000)), 1900, 1032, 8, 0.38, 255, 255, 255, 255, 2)
        else
            if not secRemaining then
                secRemaining = true
                PlaySoundFrontend(-1, "Timer_10s", "DLC_HALLOWEEN_FVJ_Sounds", true)
            end
            RenderSprite("timerbars", "all_red_bg", 1710, 1030, 200, 35, 0.0, 255, 0, 0, 100)
            RenderText(string.format("%02d:%02d", math.floor((duration - elapsedTime) / 60000), math.floor(((duration - elapsedTime) % 60000) / 1000)), 1900, 1032, 8, 0.38, 255, 50, 50, 255, 2)
        end
        Citizen.Wait(0)
    end
end

function Visual.Subtitle(text, time)
    ClearPrints()
    BeginTextCommandPrint("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandPrint(time and math.ceil(time) or 0, true)
end

function Visual.FloatingHelpText(text, sound, loop)
    BeginTextCommandDisplayHelp("jamyfafi")
    AddTextComponentSubstringPlayerName(text)
    if string.len(text) > 99 then
        AddLongString(text)
    end
    EndTextCommandDisplayHelp(0, loop or 0, sound or true, -1)
end

function Visual.Prompt(text, spinner)
    BeginTextCommandBusyspinnerOn("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandBusyspinnerOn(spinner or 1)
end

function Visual.PromptDuration(duration, text, spinner)
    Citizen.CreateThread(function()
        Citizen.Wait(0)
        Visual.Prompt(text, spinner)
        Citizen.Wait(duration)
        if (BusyspinnerIsOn()) then
            BusyspinnerOff();
        end
    end)
end


function Visual.Text(array)
    ClearPrints()
    SetTextEntry_2("STRING")
    if (array.message ~= nil) then
        AddTextComponentString(tostring(array.message))
    else
        error("Missing arguments, message")
    end
    if (array.time_display ~= nil) then
        DrawSubtitleTimed(tonumber(array.time_display), 1)
    else
        DrawSubtitleTimed(10, 1)
    end
    if (array.sound ~= nil) then
        if (array.sound.audio_name ~= nil) then
            if (array.sound.audio_ref ~= nil) then
                PlaySoundFrontend(-1, array.sound.audio_name, array.sound.audio_ref, true)
            else
                error("Missing arguments, audio_ref")
            end
        else
            error("Missing arguments, audio_name")
        end
    end
end
RageUI.BadgeStyle = {
    -- DEFAULT BADGE
    None = function()
        return {
            BadgeTexture = "",
            BadgeDictionary = "commonmenu"
        }
    end,
    BronzeMedal = function()
        return {
            BadgeTexture = "mp_medal_bronze",
        }
    end,
    GoldMedal = function()
        return {
            BadgeTexture = "mp_medal_gold",
        }
    end,
    SilverMedal = function()
        return {
            BadgeTexture = "medal_silver",
        }
    end,
    Alert = function()
        return {
            BadgeTexture = "mp_alerttriangle",
        }
    end,
    Crown = function(Selected)
        return {
            BadgeTexture = "mp_hostcrown",
            BadgeColour = Selected and { R = 0, G = 0, B = 0, A = 255 } or { R = 255, G = 255, B = 255, A = 255 }
        }
    end,
    Ammo = function(Selected)
        return {
            BadgeTexture = Selected and "shop_ammo_icon_b" or "shop_ammo_icon_a",
        }
    end,
    Armour = function(Selected)
        return {
            BadgeTexture = Selected and "shop_armour_icon_b" or "shop_armour_icon_a",
        }
    end,
    Barber = function(Selected)
        return {
            BadgeTexture = Selected and "shop_barber_icon_b" or "shop_barber_icon_a",
        }
    end,
    Clothes = function(Selected)
        return {
            BadgeTexture = Selected and "shop_clothing_icon_b" or "shop_clothing_icon_a",
        }
    end,
    Franklin = function(Selected)
        return {
            BadgeTexture = Selected and "shop_franklin_icon_b" or "shop_franklin_icon_a",
        }
    end,
    Bike = function(Selected)
        return {
            BadgeTexture = Selected and "shop_garage_bike_icon_b" or "shop_garage_bike_icon_a",
        }
    end,
    Car = function(Selected)
        return {
            BadgeTexture = Selected and "shop_garage_icon_b" or "shop_garage_icon_a",
        }
    end,
    Boat = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_boat_black" or "mp_specitem_boat",
            BadgeDictionary = "mpinventory"
        }
    end,
    Heli = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_heli_black" or "mp_specitem_heli",
            BadgeDictionary = "mpinventory"
        }
    end,
    Plane = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_plane_black" or "mp_specitem_plane",
            BadgeDictionary = "mpinventory"
        }
    end,
    BoatPickup = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_boatpickup_black" or "mp_specitem_boatpickup",
            BadgeDictionary = "mpinventory"
        }
    end,
    Card = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_keycard_black" or "mp_specitem_keycard",
            BadgeDictionary = "mpinventory"
        }
    end,
    Gun = function(Selected)
        return {
            BadgeTexture = Selected and "shop_gunclub_icon_b" or "shop_gunclub_icon_a",
        }
    end,
    Heart = function(Selected)
        return {
            BadgeTexture = Selected and "shop_health_icon_b" or "shop_health_icon_a",
        }
    end,
    Makeup = function(Selected)
        return {
            BadgeTexture = Selected and "shop_makeup_icon_b" or "shop_makeup_icon_a",
        }
    end,
    Mask = function(Selected)
        return {
            BadgeTexture = Selected and "shop_mask_icon_b" or "shop_mask_icon_a",
        }
    end,
    Michael = function(Selected)
        return {
            BadgeTexture = Selected and "shop_michael_icon_b" or "shop_michael_icon_a",
        }
    end,
    Star = function()
        return {
            BadgeTexture = "shop_new_star",
        }
    end,
    Tattoo = function(Selected)
        return {
            BadgeTexture = Selected and "shop_tattoos_icon_b" or "shop_tattoos_icon_a",
        }
    end,
    Trevor = function(Selected)
        return {
            BadgeTexture = Selected and "shop_trevor_icon_b" or "shop_trevor_icon_a",
        }
    end,
    Lock = function(Selected)
        return {
            BadgeTexture = "shop_lock",
            BadgeColour = Selected and { R = 0, G = 0, B = 0, A = 255 } or { R = 255, G = 255, B = 255, A = 255 }
        }
    end,
    Tick = function(Selected)
        return {
            BadgeTexture = "shop_tick_icon",
            BadgeColour = Selected and { R = 0, G = 0, B = 0, A = 255 } or { R = 255, G = 255, B = 255, A = 255 }
        }
    end,
    Key = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_cuffkeys_black" or "mp_specitem_cuffkeys",
            BadgeDictionary = "mpinventory"
        }
    end,
    Coke = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_coke_black" or "mp_specitem_coke",
            BadgeDictionary = "mpinventory"
        }
    end,
    Heroin = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_heroin_black" or "mp_specitem_heroin",
            BadgeDictionary = "mpinventory"
        }
    end,
    Meth = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_meth_black" or "mp_specitem_meth",
            BadgeDictionary = "mpinventory"
        }
    end,
    Weed = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_weed_black" or "mp_specitem_weed",
            BadgeDictionary = "mpinventory"
        }
    end,
    Package = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_package_black" or "mp_specitem_package",
            BadgeDictionary = "mpinventory"
        }
    end,
    Cash = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_cash_black" or "mp_specitem_cash",
            BadgeDictionary = "mpinventory"
        }
    end,
    RP = function(_)
        return {
            BadgeTexture = "mp_anim_rp",
            BadgeDictionary = "mphud"
        }
    end,
    SASP = function()
        return {
            BadgeTexture = "mpgroundlogo_cops",
            BadgeDictionary = "3dtextures"
        }
    end,
    Vagos = function()
        return {
            BadgeTexture = "mpgroundlogo_vagos",
            BadgeDictionary = "3dtextures"
        }
    end,
    Bikers = function()
        return {
            BadgeTexture = "mpgroundlogo_bikers",
            BadgeDictionary = "3dtextures"
        }
    end,

    -- CASINO
    Badbeat = function()
        return {
            BadgeTexture = "badbeat",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    CashingOut = function()
        return {
            BadgeTexture = "cashingout",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    FullHouse = function()
        return {
            BadgeTexture = "fullhouse",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    HighRoller = function()
        return {
            BadgeTexture = "highroller",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    HouseKeeping = function()
        return {
            BadgeTexture = "housekeeping",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    LooseCheng = function()
        return {
            BadgeTexture = "loosecheng",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    LuckyLucky = function()
        return {
            BadgeTexture = "luckylucky",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    PlayToWin = function()
        return {
            BadgeTexture = "playtowin",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    StraightFlush = function()
        return {
            BadgeTexture = "straightflush",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    StrongArmTactics = function()
        return {
            BadgeTexture = "strongarmtactics",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    TopPair = function()
        return {
            BadgeTexture = "toppair",
            BadgeDictionary = "mpawardcasino"
        }
    end,
}

RageUI.ItSAMSColour = {
    PureWhite = { 255, 255, 255, 255 },
    White = { 240, 240, 240, 255 },
    Black = { 0, 0, 0, 255 },
    Grey = { 155, 155, 155, 255 },
    GreyLight = { 205, 205, 205, 255 },
    GreyDark = { 77, 77, 77, 255 },
    Red = { 224, 50, 50, 255 },
    RedLight = { 240, 153, 153, 255 },
    RedDark = { 112, 25, 25, 255 },
    Blue = { 93, 182, 229, 255 },
    BlueLight = { 174, 219, 242, 255 },
    BlueDark = { 47, 92, 115, 255 },
    Yellow = { 240, 200, 80, 255 },
    YellowLight = { 254, 235, 169, 255 },
    YellowDark = { 126, 107, 41, 255 },
    Orange = { 255, 133, 85, 255 },
    OrangeLight = { 255, 194, 170, 255 },
    OrangeDark = { 127, 66, 42, 255 },
    Green = { 114, 204, 114, 255 },
    GreenLight = { 185, 230, 185, 255 },
    GreenDark = { 57, 102, 57, 255 },
    Purple = { 132, 102, 226, 255 },
    PurpleLight = { 192, 179, 239, 255 },
    PurpleDark = { 67, 57, 111, 255 },
    Pink = { 203, 54, 148, 255 },
    RadarHealth = { 53, 154, 71, 255 },
    RadarArmour = { 93, 182, 229, 255 },
    RadarDamage = { 235, 36, 39, 255 },
    NetPlayer1 = { 194, 80, 80, 255 },
    NetPlayer2 = { 156, 110, 175, 255 },
    NetPlayer3 = { 255, 123, 196, 255 },
    NetPlayer4 = { 247, 159, 123, 255 },
    NetPlayer5 = { 178, 144, 132, 255 },
    NetPlayer6 = { 141, 206, 167, 255 },
    NetPlayer7 = { 113, 169, 175, 255 },
    NetPlayer8 = { 211, 209, 231, 255 },
    NetPlayer9 = { 144, 127, 153, 255 },
    NetPlayer10 = { 106, 196, 191, 255 },
    NetPlayer11 = { 214, 196, 153, 255 },
    NetPlayer12 = { 234, 142, 80, 255 },
    NetPlayer13 = { 152, 203, 234, 255 },
    NetPlayer14 = { 178, 98, 135, 255 },
    NetPlayer15 = { 144, 142, 122, 255 },
    NetPlayer16 = { 166, 117, 94, 255 },
    NetPlayer17 = { 175, 168, 168, 255 },
    NetPlayer18 = { 232, 142, 155, 255 },
    NetPlayer19 = { 187, 214, 91, 255 },
    NetPlayer20 = { 12, 123, 86, 255 },
    NetPlayer21 = { 123, 196, 255, 255 },
    NetPlayer22 = { 171, 60, 230, 255 },
    NetPlayer23 = { 206, 169, 13, 255 },
    NetPlayer24 = { 71, 99, 173, 255 },
    NetPlayer25 = { 42, 166, 185, 255 },
    NetPlayer26 = { 186, 157, 125, 255 },
    NetPlayer27 = { 201, 225, 255, 255 },
    NetPlayer28 = { 240, 240, 150, 255 },
    NetPlayer29 = { 237, 140, 161, 255 },
    NetPlayer30 = { 249, 138, 138, 255 },
    NetPlayer31 = { 252, 239, 166, 255 },
    NetPlayer32 = { 240, 240, 240, 255 },
    SimpleBlipDefault = { 159, 201, 166, 255 },
    MenuBlue = { 140, 140, 140, 255 },
    MenuGreyLight = { 140, 140, 140, 255 },
    MenuBlueExtraDark = { 40, 40, 40, 255 },
    MenuYellow = { 240, 160, 0, 255 },
    MenuYellowDark = { 240, 160, 0, 255 },
    MenuGreen = { 240, 160, 0, 255 },
    MenuGrey = { 140, 140, 140, 255 },
    MenuGreyDark = { 60, 60, 60, 255 },
    MenuHighlight = { 30, 30, 30, 255 },
    MenuStandard = { 140, 140, 140, 255 },
    MenuDimmed = { 75, 75, 75, 255 },
    MenuExtraDimmed = { 50, 50, 50, 255 },
    BriefTitle = { 95, 95, 95, 255 },
    MidGreyMp = { 100, 100, 100, 255 },
    NetPlayer1Dark = { 93, 39, 39, 255 },
    NetPlayer2Dark = { 77, 55, 89, 255 },
    NetPlayer3Dark = { 124, 62, 99, 255 },
    NetPlayer4Dark = { 120, 80, 80, 255 },
    NetPlayer5Dark = { 87, 72, 66, 255 },
    NetPlayer6Dark = { 74, 103, 83, 255 },
    NetPlayer7Dark = { 60, 85, 88, 255 },
    NetPlayer8Dark = { 105, 105, 64, 255 },
    NetPlayer9Dark = { 72, 63, 76, 255 },
    NetPlayer10Dark = { 53, 98, 95, 255 },
    NetPlayer11Dark = { 107, 98, 76, 255 },
    NetPlayer12Dark = { 117, 71, 40, 255 },
    NetPlayer13Dark = { 76, 101, 117, 255 },
    NetPlayer14Dark = { 65, 35, 47, 255 },
    NetPlayer15Dark = { 72, 71, 61, 255 },
    NetPlayer16Dark = { 85, 58, 47, 255 },
    NetPlayer17Dark = { 87, 84, 84, 255 },
    NetPlayer18Dark = { 116, 71, 77, 255 },
    NetPlayer19Dark = { 93, 107, 45, 255 },
    NetPlayer20Dark = { 6, 61, 43, 255 },
    NetPlayer21Dark = { 61, 98, 127, 255 },
    NetPlayer22Dark = { 85, 30, 115, 255 },
    NetPlayer23Dark = { 103, 84, 6, 255 },
    NetPlayer24Dark = { 35, 49, 86, 255 },
    NetPlayer25Dark = { 21, 83, 92, 255 },
    NetPlayer26Dark = { 93, 98, 62, 255 },
    NetPlayer27Dark = { 100, 112, 127, 255 },
    NetPlayer28Dark = { 120, 120, 75, 255 },
    NetPlayer29Dark = { 152, 76, 93, 255 },
    NetPlayer30Dark = { 124, 69, 69, 255 },
    NetPlayer31Dark = { 10, 43, 50, 255 },
    NetPlayer32Dark = { 95, 95, 10, 255 },
    Bronze = { 180, 130, 97, 255 },
    Silver = { 150, 153, 161, 255 },
    Gold = { 214, 181, 99, 255 },
    Platinum = { 166, 221, 190, 255 },
    Gang1 = { 29, 100, 153, 255 },
    Gang2 = { 214, 116, 15, 255 },
    Gang3 = { 135, 125, 142, 255 },
    Gang4 = { 229, 119, 185, 255 },
    SameCrew = { 252, 239, 166, 255 },
    Freemode = { 45, 110, 185, 255 },
    PauseBg = { 0, 0, 0, 255 },
    Friendly = { 93, 182, 229, 255 },
    Enemy = { 194, 80, 80, 255 },
    Location = { 240, 200, 80, 255 },
    Pickup = { 114, 204, 114, 255 },
    PauseSingleplayer = { 114, 204, 114, 255 },
    FreemodeDark = { 22, 55, 92, 255 },
    InactiveMission = { 154, 154, 154, 255 },
    Damage = { 194, 80, 80, 255 },
    PinkLight = { 252, 115, 201, 255 },
    PmMitemHighlight = { 252, 177, 49, 255 },
    ScriptVariable = { 0, 0, 0, 255 },
    Yoga = { 109, 247, 204, 255 },
    Tennis = { 241, 101, 34, 255 },
    Golf = { 214, 189, 97, 255 },
    ShootingRange = { 112, 25, 25, 255 },
    FlightSchool = { 47, 92, 115, 255 },
    NorthBlue = { 93, 182, 229, 255 },
    SocialClub = { 234, 153, 28, 255 },
    PlatformBlue = { 11, 55, 123, 255 },
    PlatformGreen = { 146, 200, 62, 255 },
    PlatformGrey = { 234, 153, 28, 255 },
    FacebookBlue = { 66, 89, 148, 255 },
    IngameBg = { 0, 0, 0, 255 },
    Darts = { 114, 204, 114, 255 },
    Waypoint = { 164, 76, 242, 255 },
    Michael = { 101, 180, 212, 255 },
    Franklin = { 171, 237, 171, 255 },
    Trevor = { 255, 163, 87, 255 },
    GolfP1 = { 240, 240, 240, 255 },
    GolfP2 = { 235, 239, 30, 255 },
    GolfP3 = { 255, 149, 14, 255 },
    GolfP4 = { 246, 60, 161, 255 },
    WaypointLight = { 210, 166, 249, 255 },
    WaypointDark = { 82, 38, 121, 255 },
    PanelLight = { 0, 0, 0, 255 },
    MichaelDark = { 72, 103, 116, 255 },
    FranklinDark = { 85, 118, 85, 255 },
    TrevorDark = { 127, 81, 43, 255 },
    ObjectiveRoute = { 240, 200, 80, 255 },
    PausemapTint = { 0, 0, 0, 255 },
    PauseDeselect = { 100, 100, 100, 255 },
    PmWeaponsPurchasable = { 45, 110, 185, 255 },
    PmWeaponsLocked = { 240, 240, 240, 255 },
    ScreenBg = { 0, 0, 0, 255 },
    Chop = { 224, 50, 50, 255 },
    PausemapTintHalf = { 0, 0, 0, 255 },
    NorthBlueOfficial = { 0, 71, 133, 255 },
    ScriptVariable2 = { 0, 0, 0, 255 },
    H = { 33, 118, 37, 255 },
    HDark = { 37, 102, 40, 255 },
    T = { 234, 153, 28, 255 },
    TDark = { 225, 140, 8, 255 },
    HShard = { 20, 40, 0, 255 },
    ControllerMichael = { 48, 255, 255, 255 },
    ControllerFranklin = { 48, 255, 0, 255 },
    ControllerTrevor = { 176, 80, 0, 255 },
    ControllerChop = { 127, 0, 0, 255 },
    VideoEditorVideo = { 53, 166, 224, 255 },
    VideoEditorAudio = { 162, 79, 157, 255 },
    VideoEditorText = { 104, 192, 141, 255 },
    HbBlue = { 29, 100, 153, 255 },
    HbYellow = { 234, 153, 28, 255 },
    VideoEditorGameMode = { 240, 160, 1, 255 },
    VideoEditorAudioFadeout = { 59, 34, 57, 255 },
    VideoEditorTextFadeout = { 41, 68, 53, 255 },
    VideoEditorGameModeFadeout = { 82, 58, 10, 255 },
    HeistBackground = { 37, 102, 40, 255 },
    VideoEditorAmbient = { 240, 200, 80, 255 },
    VideoEditorAmbientFadeout = { 80, 70, 34, 255 },
    Gb = { 255, 133, 85, 255 },
    G = { 255, 194, 170, 255 },
    B = { 255, 133, 85, 255 },
    LowFlow = { 240, 200, 80, 255 },
    LowFlowDark = { 126, 107, 41, 255 },
    G1 = { 247, 159, 123, 255 },
    G2 = { 226, 134, 187, 255 },
    G3 = { 239, 238, 151, 255 },
    G4 = { 113, 169, 175, 255 },
    G5 = { 160, 140, 193, 255 },
    G6 = { 141, 206, 167, 255 },
    G7 = { 181, 214, 234, 255 },
    G8 = { 178, 144, 132, 255 },
    G9 = { 0, 132, 114, 255 },
    G10 = { 216, 85, 117, 255 },
    G11 = { 30, 100, 152, 255 },
    G12 = { 43, 181, 117, 255 },
    G13 = { 233, 141, 79, 255 },
    G14 = { 137, 210, 215, 255 },
    G15 = { 134, 125, 141, 255 },
    Adversary = { 109, 34, 33, 255 },
    DegenRed = { 255, 0, 0, 255 },
    DegenYellow = { 255, 255, 0, 255 },
    DegenGreen = { 0, 255, 0, 255 },
    DegenCyan = { 0, 255, 255, 255 },
    DegenBlue = { 0, 0, 255, 255 },
    DegenMagenta = { 255, 0, 255, 255 },
    Stunt1 = { 38, 136, 234, 255 },
    Stunt2 = { 224, 50, 50, 255 },
}

RageUI.PanelColour = {
    HairCut = {
        { 28, 31, 33 }, -- 0
        { 39, 42, 44 }, -- 1
        { 49, 46, 44 }, -- 2
        { 53, 38, 28 }, -- 3
        { 75, 50, 31 }, -- 4
        { 92, 59, 36 }, -- 5
        { 109, 76, 53 }, -- 6
        { 107, 80, 59 }, -- 7
        { 118, 92, 69 }, -- 8
        { 127, 104, 78 }, -- 9
        { 153, 129, 93 }, -- 10
        { 167, 147, 105 }, -- 11
        { 175, 156, 112 }, -- 12
        { 187, 160, 99 }, -- 13
        { 214, 185, 123 }, -- 14
        { 218, 195, 142 }, -- 15
        { 159, 127, 89 }, -- 16
        { 132, 80, 57 }, -- 17
        { 104, 43, 31 }, -- 18
        { 97, 18, 12 }, -- 19
        { 100, 15, 10 }, -- 20
        { 124, 20, 15 }, -- 21
        { 160, 46, 25 }, -- 22
        { 182, 75, 40 }, -- 23
        { 162, 80, 47 }, -- 24
        { 170, 78, 43 }, -- 25
        { 98, 98, 98 }, -- 26
        { 128, 128, 128}, -- 27
        { 170, 170, 170 }, -- 28
        { 197, 197, 197 }, -- 29
        { 70, 57, 85 }, -- 30
        { 90, 63, 107 }, -- 31
        { 118, 60, 118 }, -- 32
        { 237, 116, 227 }, -- 33
        { 235, 75, 147 }, -- 34
        { 242, 153, 188 }, -- 35
        { 4, 149, 158 }, -- 36
        { 2, 95, 134 }, -- 37
        { 2, 57, 116 }, -- 38
        { 63, 161, 106 }, -- 39
        { 33, 124, 97 }, -- 40
        { 24, 92, 85 }, -- 41
        { 182, 192, 52 }, -- 42
        { 112, 169, 11 }, -- 43
        { 67, 157, 19 }, -- 44
        { 220, 184, 87 }, -- 45
        { 229, 177, 3 }, -- 46
        { 230, 145, 2 }, -- 47
        { 242, 136, 49 }, -- 48
        { 251, 128, 87 }, -- 49
        { 226, 139, 88 }, -- 50
        { 209, 89, 60 }, -- 51
        { 206, 49, 32 }, -- 52
        { 173, 9, 3 }, -- 53
        { 136, 3, 2 }, -- 54
        { 31, 24, 20 }, -- 55
        { 41, 31, 25 }, -- 56
        { 46, 34, 27 }, -- 57
        { 55, 41, 30 }, -- 58
        { 46, 34, 24 }, -- 59
        { 35, 27, 21 }, -- 60
        { 2, 2, 2 }, -- 61
        { 112, 108, 102 }, -- 62
        { 157, 122, 80 } -- 63
    },
    Lscustom = {
        { 13, 17, 22 }, -- 0
        { 28, 29, 33	 }, -- 1
        { 50, 56, 61 }, -- 2
        { 69, 75, 79 }, -- 3
        { 153, 157, 160 }, -- 4
        { 194, 196, 198	 }, -- 5
        { 151, 154, 151	 }, -- 6
        { 99, 115, 128 }, -- 7
        { 99, 98, 92 }, -- 8
        { 60, 63, 71 }, -- 9
        { 68, 78, 84 }, -- 10
        { 29, 33, 41 }, -- 11
        { 19, 24, 31 }, -- 12
        { 38, 40, 42 }, -- 13
        { 81, 85, 84 }, -- 14
        { 21, 25, 33 }, -- 15
        { 30, 36, 41 }, -- 16
        { 51, 58, 60 }, -- 17
        { 140, 144, 149 }, -- 18
        { 57, 67, 77 }, -- 19
        { 80, 98, 114 }, -- 20 --
        {30, 35, 47 }, -- 21
        { 54, 58, 63 }, -- 22
        { 160, 161, 153 }, -- 23
        { 211, 211, 211 }, -- 24
        { 183, 191, 202 }, -- 25
        { 119, 135, 148 }, -- 26
        { 192, 14, 26 }, -- 27
        { 218, 25, 24 }, -- 28
        { 182, 17, 27 }, -- 29
        { 165, 30, 35 }, -- 30
        { 123, 26, 34 }, -- 31
        { 142, 27, 31 }, -- 32
        { 111, 24, 24 }, -- 33
        { 73, 17, 29 }, -- 34
        { 182, 15, 37 }, -- 35
        { 212, 74, 23 }, -- 36
        { 194, 148, 79 }, -- 37
        { 247, 134, 22 }, -- 38
        { 207, 31, 33 }, -- 39
        { 115, 32, 33 }, -- 40
        { 242, 125, 32 }, -- 41
        { 255, 201, 31 }, -- 42
        { 156, 16, 22 }, -- 43
        { 222, 15, 24 }, -- 44
        { 143, 30, 23 }, -- 45
        { 169, 71, 68 }, -- 46
        { 177, 108, 81 }, -- 47
        { 55, 28, 37 }, -- 48
        { 19, 36, 40 }, -- 49
        { 18, 46, 43 }, -- 50
        { 18, 56, 60 }, -- 51
        { 49, 66, 63 }, -- 52
        { 21, 92, 45 }, -- 53
        { 27, 103, 112 }, -- 54
        { 102, 184, 31 }, -- 55
        { 34, 56, 62 }, -- 56
        { 29, 90, 63 }, -- 57
        { 45, 66, 63 }, -- 58
        { 69, 89, 75 }, -- 59
        { 101, 134, 127 }, -- 60
        { 34, 46, 70 }, -- 61
        { 35, 49, 85 }, -- 62
        { 48, 76, 126 }, -- 63
        { 71, 87, 143 }, -- 64
        { 99, 123, 167 }, -- 65
        { 57, 71, 98 }, -- 66
        { 214, 231, 241 }, -- 67
        { 118, 175, 190 }, -- 68
        { 52, 94, 114 }, -- 69
        { 11, 156, 241 }, -- 70
        { 47, 45, 82 }, -- 71
        { 40, 44, 77 }, -- 72
        { 35, 84, 161 }, -- 73
        { 110, 163, 198 }, -- 74
        { 17, 37, 82 }, -- 75
        { 27, 32, 62 }, -- 76
        { 39, 81, 144 }, -- 77
        { 96, 133, 146 }, -- 78
        { 36, 70, 168 }, -- 79
        { 66, 113, 225 }, -- 80
        { 59, 57, 224 }, -- 81
        { 31, 40, 82 }, -- 82
        { 37, 58, 167 }, -- 83
        { 28, 53, 81 }, -- 84
        { 76, 95, 129 }, -- 85
        { 88, 104, 142 }, -- 86
        { 116, 181, 216 }, -- 87
        { 255, 207, 32 }, -- 88
        { 251, 226, 18 }, -- 89
        { 145, 101, 50 }, -- 90
        { 224, 225, 61 }, -- 91
        { 152, 210, 35 }, -- 92
        { 155, 140, 120 }, -- 93
        { 80, 50, 24 }, -- 94
        { 71, 63, 43 }, -- 95
        { 34, 27, 25 }, -- 96
        { 101, 63, 35 }, -- 97
        { 119, 92, 62 }, -- 98
        { 172, 153, 117 }, -- 99
        { 108, 107, 75 }, -- 100
        { 64, 46, 43 }, -- 101
        { 164, 150, 95 }, -- 102
        { 70, 35, 26 }, -- 103
        { 117, 43, 25 }, -- 104
        { 191, 174, 123 }, -- 105
        { 223, 213, 178 }, -- 106
        { 247, 237, 213 }, -- 107
        { 58, 42, 27 }, -- 108
        { 120, 95, 51 }, -- 109
        { 181, 160, 121 }, -- 110
        { 255, 255, 246 }, -- 111
        { 234, 234, 234 }, -- 112
        { 176, 171, 148 }, -- 113
        { 69, 56, 49 }, -- 114
        { 42, 40, 43 }, -- 115
        { 114, 108, 87 }, -- 116
        { 106, 116, 124 },
        { 53, 65, 88 },
        { 155, 160, 168 },
        { 88, 112, 161 },
        { 234, 230, 222 },
        { 223, 221, 208 },
        { 242, 173, 46 },
        { 249, 164, 88 },
        { 131, 197, 102 },
        { 241, 204, 64 },
        { 76, 195, 218 },
        { 78, 100, 67 },
        { 188, 172, 143 },
        { 248, 182, 88 },
        { 252, 249, 241 },
        { 255, 255, 251 },
        { 129, 132, 76 },
        { 255, 255, 255 },
        { 242, 31, 153 },
        { 253, 214, 205 },
        { 223, 88, 145 },
        { 246, 174, 32 },
        { 176, 238, 110 }, -- 140
        { 10, 12, 23 },
        { 12, 13, 24 },
        { 14, 13, 20 },
        { 159, 158, 138 },
        { 98, 18, 118 },
        { 11, 20, 33 },
        { 17, 20, 26 },
        { 107, 31, 123 },
        { 30, 29, 34 },
        { 188, 25, 23 },
        { 45, 54, 42 },
        { 105, 103, 72 },
        { 122, 108, 85 },
        { 195, 180, 146 },
        { 90, 99, 82 },
        { 129, 130, 127 },
        { 175, 214, 228 },
        { 122, 100, 64 },
        { 127, 106, 72 },
    },
    MakeUp = {
        { 153, 37, 50 }, -- 0
        { 200, 57, 93 }, -- 1
        { 189, 81, 108 }, -- 2
        { 184, 99, 122 }, -- 3
        { 166, 82, 107 }, -- 4
        { 177, 67, 76 }, -- 5
        { 127, 49, 51 }, -- 6
        { 164, 100, 93 }, -- 7
        { 193, 135, 121 }, -- 8
        { 203, 160, 150 }, -- 9
        { 198, 145, 143 }, -- 10
        { 171, 111, 99}, -- 11
        { 176, 96, 80 }, -- 12
        { 168, 76, 51 }, -- 13
        { 180, 113, 120 }, -- 14
        { 202, 127, 146 }, -- 15
        { 237, 156, 190 }, -- 16
        { 231, 117, 164 }, -- 17
        { 222, 62, 129 }, -- 18
        { 179, 76, 110 }, -- 19
        { 113, 39, 57 }, -- 20
        { 79, 31, 42 }, -- 21
        { 170, 34, 47 }, -- 22
        { 222, 32, 52 }, -- 23
        { 207, 8, 19 }, -- 24
        { 229, 84, 112 }, -- 25
        { 220, 63, 181 }, -- 26
        { 192, 39, 178 }, -- 27
        { 160, 28, 169 }, -- 28
        { 110, 24, 117 }, -- 29
        { 115, 20, 101 }, -- 30
        { 86, 22, 92 }, -- 31
        { 109, 26, 157 }, -- 32
        { 27, 55, 113 }, -- 33
        { 29, 78, 167 }, -- 34
        { 30, 116, 187 }, -- 35
        { 33, 163, 206 }, -- 36
        { 37, 194, 210 }, -- 37
        { 35, 204, 165 }, -- 38
        { 39, 192, 125 }, -- 39
        { 27, 156, 50 }, -- 40
        { 20, 134, 4 }, -- 41
        { 112, 208, 65 }, -- 42
        { 197, 234, 52 }, -- 43
        { 225, 227, 47 }, -- 44
        { 255, 221, 38 }, -- 45
        { 250, 192, 38 }, -- 46
        { 247, 138, 39 }, -- 47
        { 254, 89, 16 }, -- 48
        { 190, 110, 25 }, -- 49
        { 247, 201, 127 }, -- 50
        { 251, 229, 192 }, -- 51
        { 245, 245, 245 }, -- 52
        { 179, 180, 179 }, -- 53
        { 145, 145, 145 }, -- 54
        { 86, 78, 78 }, -- 55
        { 24, 14, 14 }, -- 56
        { 88, 150, 158 }, -- 57
        { 77, 111, 140 }, -- 58
        { 26, 43, 85 }, -- 59
        { 160, 126, 107 }, -- 60
        { 130, 99, 85 }, -- 61
        { 109, 83, 70 }, -- 62
        { 62, 45, 39 } -- 63
    }
}

local SettingsButton = {
    Rectangle = { Y = 40, Width = 432, Height = 31 },
    Text = { X = 8, Y = 44.5, Scale = 0.268 },
    LeftBadge = { Y = 2, Width = 30, Height = 30 },
    RightBadge = { X = 395, Y = 38, Width = 35, Height = 35 },
    RightText = { X = 425, Y = 44, Scale = 0.27 },
    SelectedSprite = { Dictionary = "commonmenu", Texture = "gradient_nav", Y = 40, Width = 432, Height = 31 },
}

function RageUI.Button(Label, Description, Style, Enabled, Action, Submenu)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil and CurrentMenu() then
        local Option = RageUI.Options + 1
        if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then
            local Active = CurrentMenu.Index == Option

            RageUI.ItSAMSSafeZone(CurrentMenu)

            local haveLeftBadge = Style.LeftBadge and Style.LeftBadge ~= RageUI.BadgeStyle.None
            local haveRightBadge = (Style.RightBadge and Style.RightBadge ~= RageUI.BadgeStyle.None) or (not Enabled and Style.LockBadge ~= RageUI.BadgeStyle.None)
            local LeftBadgeOffset = haveLeftBadge and 27 or 0
            local RightBadgeOffset = haveRightBadge and 32 or 0
            if Style.Color and Style.Color.BackgroundColor then
                RenderRectangle(CurrentMenu.X + 25, CurrentMenu.Y + SettingsButton.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButton.SelectedSprite.Height, Style.Color.BackgroundColor[1], Style.Color.BackgroundColor[2], Style.Color.BackgroundColor[3], Style.Color.BackgroundColor[4])
            end
            if Active then
                if Style.Color and Style.Color.HightLightColor then
                    RenderRectangle(CurrentMenu.X + 25, CurrentMenu.Y + SettingsButton.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButton.SelectedSprite.Height, Style.Color.HightLightColor[1], Style.Color.HightLightColor[2], Style.Color.HightLightColor[3], Style.Color.HightLightColor[4])
                else
                    RenderRectangle(CurrentMenu.X + 25, CurrentMenu.Y + SettingsButton.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButton.SelectedSprite.Height, 255, 255, 255, 255)
                end
            end
            if Enabled then
                if haveLeftBadge then
                    if (Style.LeftBadge ~= nil) then
                        local LeftBadge = Style.LeftBadge(Active)
                        RenderSprite(LeftBadge.BadgeDictionary or "commonmenu", LeftBadge.BadgeTexture or "", CurrentMenu.X + 25, CurrentMenu.Y + SettingsButton.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.LeftBadge.Width, SettingsButton.LeftBadge.Height, 0, LeftBadge.BadgeColour and LeftBadge.BadgeColour.R or 255, LeftBadge.BadgeColour and LeftBadge.BadgeColour.G or 255, LeftBadge.BadgeColour and LeftBadge.BadgeColour.B or 255, LeftBadge.BadgeColour and LeftBadge.BadgeColour.A or 255)
                    end
                end
                if haveRightBadge then
                    if (Style.RightBadge ~= nil) then
                        local RightBadge = Style.RightBadge(Active)
                        RenderSprite(RightBadge.BadgeDictionary or "commonmenu", RightBadge.BadgeTexture or "", CurrentMenu.X + 25 + SettingsButton.RightBadge.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.RightBadge.Width, SettingsButton.RightBadge.Height, 0, RightBadge.BadgeColour and RightBadge.BadgeColour.R or 255, RightBadge.BadgeColour and RightBadge.BadgeColour.G or 255, RightBadge.BadgeColour and RightBadge.BadgeColour.B or 255, RightBadge.BadgeColour and RightBadge.BadgeColour.A or 255)
                    end
                end
                if Style.RightLabel then
                    RenderText(Style.RightLabel, CurrentMenu.X + 25 + SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.RightText.Scale, Active and 0 or 245, Active and 0 or 245, Active and 0 or 245, 255, 2)
                end
                RenderText(Label, CurrentMenu.X + 25 + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, Active and 0 or 245, Active and 0 or 245, Active and 0 or 245, 255)
            else
                if haveRightBadge then
                    local RightBadge = RageUI.BadgeStyle.Lock(Active)
                    RenderSprite(RightBadge.BadgeDictionary or "commonmenu", RightBadge.BadgeTexture or "", CurrentMenu.X + 25 + SettingsButton.RightBadge.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.RightBadge.Width, SettingsButton.RightBadge.Height, 0, RightBadge.BadgeColour and RightBadge.BadgeColour.R or 255, RightBadge.BadgeColour and RightBadge.BadgeColour.G or 255, RightBadge.BadgeColour and RightBadge.BadgeColour.B or 255, RightBadge.BadgeColour and RightBadge.BadgeColour.A or 255)
                end

                RenderText(Label, CurrentMenu.X + 25 + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 163, 159, 148, 255)
            end
            RageUI.ItemOffset = RageUI.ItemOffset + SettingsButton.Rectangle.Height
            RageUI.ItSAMSDescription(CurrentMenu, Description, Active);
            if Enabled then
                local Selected = (CurrentMenu.Controls.Select.Active or (Hovered and CurrentMenu.Controls.Click.Active)) and Active
                if (Action.onActive ~= nil) and Active then
                    Action.onActive();
                end
                if Selected then
                    local Audio = RageUI.Settings.Audio
                    --CreateDui("https://audio.jukehost.co.uk/bg5dpReuSdDWDCduEvFw0ejitjheA4dE", 1, 1)
                    RageUI.PlaySound(Audio[Audio.Use].Select.audioName, Audio[Audio.Use].Select.audioRef)
                    if (Action.onSelected ~= nil) then
                        Citizen.CreateThread(function()
                            Action.onSelected();
                        end)
                    end
                    if Submenu and Submenu() then
                        RageUI.NextMenu = Submenu
                    end
                end
            end
        end
        RageUI.Options = RageUI.Options + 1
    end
end

local SettingsCheckbox = {
    Dictionary = "commonmenu", Textures = {
        "shop_box_blankb", -- 1
        "shop_box_tickb", -- 2
        "shop_box_blank", -- 3
        "shop_box_tick", -- 4
        "shop_box_crossb", -- 5
        "shop_box_cross", -- 6
    },
    X = 395, Y = 40, Width = 35, Height = 35
}

RageUI.CheckboxStyle = {
    Tick = 1,
    Cross = 2
}

local function StyleCheckBox(Selected, Checked, Box, BoxSelect, OffSet)
    local CurrentMenu = RageUI.CurrentMenu;
    if OffSet == nil then
        OffSet = 0
    end
    if Selected then
        if Checked then
            RenderSprite(SettingsCheckbox.Dictionary, SettingsCheckbox.Textures[Box], CurrentMenu.X + 25 + SettingsCheckbox.X + CurrentMenu.WidthOffset - OffSet, CurrentMenu.Y + SettingsCheckbox.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsCheckbox.Width, SettingsCheckbox.Height)
        else
            RenderSprite(SettingsCheckbox.Dictionary, SettingsCheckbox.Textures[1], CurrentMenu.X + 25 + SettingsCheckbox.X + CurrentMenu.WidthOffset - OffSet, CurrentMenu.Y + SettingsCheckbox.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsCheckbox.Width, SettingsCheckbox.Height)
        end
    else
        if Checked then
            RenderSprite(SettingsCheckbox.Dictionary, SettingsCheckbox.Textures[BoxSelect], CurrentMenu.X + 25 + SettingsCheckbox.X + CurrentMenu.WidthOffset - OffSet, CurrentMenu.Y + SettingsCheckbox.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsCheckbox.Width, SettingsCheckbox.Height)
        else
            RenderSprite(SettingsCheckbox.Dictionary, SettingsCheckbox.Textures[3], CurrentMenu.X + 25 + SettingsCheckbox.X + CurrentMenu.WidthOffset - OffSet, CurrentMenu.Y + SettingsCheckbox.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsCheckbox.Width, SettingsCheckbox.Height)
        end
    end
end

local checkBox = {}


function RageUI.Checkbox(Label, Description, Checked, Style, Actions)
    ---@type table
    local CurrentMenu = RageUI.CurrentMenu;
    if CurrentMenu ~= nil then
        if CurrentMenu() then

            ---@type number
            local Option = RageUI.Options + 1
            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then
                ---@type number
                local Selected = CurrentMenu.Index == Option
                local LeftBadgeOffset = ((Style.LeftBadge == RageUI.BadgeStyle.None or Style.LeftBadge == nil) and 0 or 27)
                local RightBadgeOffset = ((Style.RightBadge == RageUI.BadgeStyle.None or Style.RightBadge == nil) and 0 or 32)
                local BoxOffset = 0
                RageUI.ItSAMSSafeZone(CurrentMenu)

                local Hovered = false;

                ---@type boolean
                if CurrentMenu.EnableMouse == true and (CurrentMenu.CursorStyle == 0) or (CurrentMenu.CursorStyle == 1) then
                    Hovered = RageUI.ItSAMSMouseBounds(CurrentMenu, Selected, Option, SettingsButton);
                end
                if Selected then
                    RenderSprite(SettingsButton.SelectedSprite.Dictionary, SettingsButton.SelectedSprite.Texture, CurrentMenu.X + 25, CurrentMenu.Y + SettingsButton.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButton.SelectedSprite.Height)
                end

                if type(Style) == "table" then
                    if Style.Enabled == true or Style.Enabled == nil then
                        if Selected then
                            RenderText(Label, CurrentMenu.X + 25 + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 0, 0, 0, 255)
                        else
                            RenderText(Label, CurrentMenu.X + 25 + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 245, 245, 245, 255)
                        end
                        if type(Style) == 'table' then
                            if Style.LeftBadge ~= nil then
                                if Style.LeftBadge ~= RageUI.BadgeStyle.None then
                                    local BadgeData = Style.LeftBadge(Selected)
                                    RenderSprite(BadgeData.BadgeDictionary or "commonmenu", BadgeData.BadgeTexture or "", CurrentMenu.X, CurrentMenu.Y + SettingsButton.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.LeftBadge.Width, SettingsButton.LeftBadge.Height, 0, BadgeData.BadgeColour and BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.A or 255)
                                end
                            end
                            if Style.RightBadge ~= nil then
                                if Style.RightBadge ~= RageUI.BadgeStyle.None then
                                    local BadgeData = Style.RightBadge(Selected)
                                    RenderSprite(BadgeData.BadgeDictionary or "commonmenu", BadgeData.BadgeTexture or "", CurrentMenu.X + SettingsButton.RightBadge.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.RightBadge.Width, SettingsButton.RightBadge.Height, 0, BadgeData.BadgeColour and BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.A or 255)
                                end
                            end
                        end
                    else
                        ---@type table
                        local LeftBadge = RageUI.BadgeStyle.Lock
                        ---@type number
                        local LeftBadgeOffset = ((LeftBadge == RageUI.BadgeStyle.None or LeftBadge == nil) and 0 or 27)

                        if Selected then
                            RenderText(Label, CurrentMenu.X + 25 + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 0, 0, 0, 255)
                        else
                            RenderText(Label, CurrentMenu.X + 25 + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 163, 159, 148, 255)
                        end

                        if LeftBadge ~= RageUI.BadgeStyle.None and LeftBadge ~= nil then
                            local BadgeData = LeftBadge(Selected)

                            RenderSprite(BadgeData.BadgeDictionary or "commonmenu", BadgeData.BadgeTexture or "", CurrentMenu.X, CurrentMenu.Y + SettingsButton.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.LeftBadge.Width, SettingsButton.LeftBadge.Height, 0, BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour.A or 255)
                        end
                    end

                    if Style.Enabled == true or Style.Enabled == nil then
                        if Selected then
                            if Style.RightLabel ~= nil and Style.RightLabel ~= "" then

                                RenderText(Style.RightLabel, CurrentMenu.X + SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.RightText.Scale, 0, 0, 0, 255, 2)
                                BoxOffset = MeasureStringWidth(Style.RightLabel, 0, 0.35)
                            end
                        else
                            if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                                RenderText(Style.RightLabel, CurrentMenu.X + SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.RightText.Scale, 245, 245, 245, 255, 2)
                                BoxOffset = MeasureStringWidth(Style.RightLabel, 0, 0.35)
                            end
                        end
                    end

                    BoxOffset = RightBadgeOffset + BoxOffset
                    if Style.Style ~= nil then
                        if Style.Style == RageUI.CheckboxStyle.Tick then
                            StyleCheckBox(Selected, Checked, 2, 4, BoxOffset)
                        elseif Style.Style == RageUI.CheckboxStyle.Cross then
                            StyleCheckBox(Selected, Checked, 5, 6, BoxOffset)
                        else
                            StyleCheckBox(Selected, Checked, 2, 4, BoxOffset)
                        end
                    else
                        StyleCheckBox(Selected, Checked, 2, 4, BoxOffset)
                    end

                    if Selected and (CurrentMenu.Controls.Select.Active or (Hovered and CurrentMenu.Controls.Click.Active)) and (Style.Enabled == true or Style.Enabled == nil) then
                        local Audio = RageUI.Settings.Audio
                        RageUI.PlaySound(Audio[Audio.Use].Select.audioName, Audio[Audio.Use].Select.audioRef)
                        Checked = not Checked
                        if (Checked) then
                            if (Actions.onChecked ~= nil) then
                                Actions.onChecked();
                            end
                        else
                            if (Actions.onUnChecked ~= nil) then
                                Actions.onUnChecked();
                            end
                        end
                    end
                else
                    error("UICheckBox Style is not a `table`")
                end

                RageUI.ItemOffset = RageUI.ItemOffset + SettingsButton.Rectangle.Height

                RageUI.ItSAMSDescription(CurrentMenu, Description, Selected)

                if (Actions.onSelected ~= nil) and (Selected) then
                    Actions.onSelected(Checked);
                end

            end
            RageUI.Options = RageUI.Options + 1
        end
    end
end

local SettingsList = {
    LeftArrow = { Dictionary = "commonmenu", Texture = "arrowleft", X = 398, Y = 3, Width = 25, Height = 25 },
    RightArrow = { Dictionary = "commonmenu", Texture = "arrowright", X = 420, Y = 3, Width = 25, Height = 25 },
    Text = { X = 423, Y = 45, Scale = 0.26 },
}

function RageUI.List(Label, ItSAMS, Index, Description, Style, Enabled, Actions, Submenu)
    local CurrentMenu = RageUI.CurrentMenu;
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            local Option = RageUI.Options + 1

            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then
                local Selected = CurrentMenu.Index == Option
                local LeftArrowHovered, RightArrowHovered = false, false

                RageUI.ItSAMSSafeZone(CurrentMenu)

                local Hovered = false;
                local LeftBadgeOffset = ((Style.LeftBadge == RageUI.BadgeStyle.None or Style.LeftBadge == nil) and 0 or 27)
                local RightBadgeOffset = ((Style.RightBadge == RageUI.BadgeStyle.None or Style.RightBadge == nil) and 0 or 32)
                local RightOffset = 0
                if CurrentMenu.EnableMouse == true and (CurrentMenu.CursorStyle == 0) or (CurrentMenu.CursorStyle == 1) then
                    Hovered = RageUI.ItSAMSMouseBounds(CurrentMenu, Selected, Option, SettingsButton);
                end
                local ListText = (type(ItSAMS[Index]) == "table") and string.format("← %s →", ItSAMS[Index].Name) or string.format("← %s →", ItSAMS[Index]) or "NIL"

                if Selected then
                    RenderRectangle(CurrentMenu.X + 25, CurrentMenu.Y + SettingsButton.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButton.SelectedSprite.Height, 255, 255, 255, 255)
                end
                if Enabled == true or Enabled == nil then
                    if Selected then
                        if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                            RenderText(Style.RightLabel, CurrentMenu.X + 25+ SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.RightText.Scale, 0, 0, 0, 255, 2)
                            RightOffset = MeasureStringWidth(Style.RightLabel, 0, 0.35)
                        end
                    else
                        if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                            RightOffset = MeasureStringWidth(Style.RightLabel, 0, 0.35)
                            RenderText(Style.RightLabel, CurrentMenu.X + 25+ SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.RightText.Scale, 245, 245, 245, 255, 2)
                        end
                    end
                end
                RightOffset = RightBadgeOffset * 1.3 + RightOffset
                if Enabled == true or Enabled == nil then
                    if Selected then
                        RenderText(Label, CurrentMenu.X + 25+ SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 0, 0, 0, 255)
                        RenderText(ListText, CurrentMenu.X + 25+ SettingsList.Text.X + 5 + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsList.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsList.Text.Scale, 0, 0, 0, 255, 2)
                    else
                        RenderText(Label, CurrentMenu.X + 25+ SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 245, 245, 245, 255)
                        RenderText(ListText, CurrentMenu.X + 25+ SettingsList.Text.X + 5 + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsList.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsList.Text.Scale, 245, 245, 245, 255, 2)
                    end
                else
                    RenderText(Label, CurrentMenu.X + 25+ SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 163, 159, 148, 255)
                    if Selected then
                        RenderText(ListText, CurrentMenu.X + 25+ SettingsList.Text.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsList.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsList.Text.Scale, 163, 159, 148, 255, 2)
                    else
                        RenderText(ListText, CurrentMenu.X + 25+ SettingsList.Text.X + 5 + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsList.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsList.Text.Scale, 163, 159, 148, 255, 2)
                    end
                end

                if type(Style) == "table" then
                    if Style.Enabled == true or Style.Enabled == nil then
                        if type(Style) == 'table' then
                            if Style.LeftBadge ~= nil then
                                if Style.LeftBadge ~= RageUI.BadgeStyle.None then
                                    local BadgeData = Style.LeftBadge(Selected)

                                    RenderSprite(BadgeData.BadgeDictionary or "commonmenu", BadgeData.BadgeTexture or "", CurrentMenu.X + 25, CurrentMenu.Y + SettingsButton.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.LeftBadge.Width, SettingsButton.LeftBadge.Height, 0, BadgeData.BadgeColour and BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.A or 255)
                                end
                            end

                            if Style.RightBadge ~= nil then
                                if Style.RightBadge ~= RageUI.BadgeStyle.None then
                                    local BadgeData = Style.RightBadge(Selected)

                                    RenderSprite(BadgeData.BadgeDictionary or "commonmenu", BadgeData.BadgeTexture or "", CurrentMenu.X + 25+ SettingsButton.RightBadge.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.RightBadge.Width, SettingsButton.RightBadge.Height, 0, BadgeData.BadgeColour and BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.A or 255)
                                end
                            end
                        end
                    else
                        local LeftBadge = RageUI.BadgeStyle.Lock
                        if LeftBadge ~= RageUI.BadgeStyle.None and LeftBadge ~= nil then
                            local BadgeData = LeftBadge(Selected)

                            RenderSprite(BadgeData.BadgeDictionary or "commonmenu", BadgeData.BadgeTexture or "", CurrentMenu.X + 25, CurrentMenu.Y + SettingsButton.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.LeftBadge.Width, SettingsButton.LeftBadge.Height, 0, BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour.A or 255)
                        end
                    end
                else
                    error("UICheckBox Style is not a `table`")
                end

                LeftArrowHovered = RageUI.IsMouseInBounds(CurrentMenu.X + 25+ SettingsList.Text.X + CurrentMenu.WidthOffset - RightOffset + CurrentMenu.SafeZoneSize.X, CurrentMenu.Y + SettingsList.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 2.5  + CurrentMenu.SafeZoneSize.Y , 15, 22.5)

                RightArrowHovered = RageUI.IsMouseInBounds(CurrentMenu.X + 25+ SettingsList.Text.X + CurrentMenu.WidthOffset + CurrentMenu.SafeZoneSize.X - RightOffset - MeasureStringWidth(ListText, 0, SettingsList.Text.Scale), CurrentMenu.Y + SettingsList.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 2.5 + CurrentMenu.SafeZoneSize.Y , 15, 22.5)
                RageUI.ItemOffset = RageUI.ItemOffset + SettingsButton.Rectangle.Height

                RageUI.ItSAMSDescription(CurrentMenu, Description, Selected);

                if Selected and (CurrentMenu.Controls.Left.Active or (CurrentMenu.Controls.Click.Active and LeftArrowHovered)) and not (CurrentMenu.Controls.Right.Active or (CurrentMenu.Controls.Click.Active and RightArrowHovered)) then
                    Index = Index - 1
                    if Index < 1 then
                        Index = #ItSAMS
                    end
                    if (Actions.onListChange ~= nil) then
                        Actions.onListChange(Index, ItSAMS[Index]);
                    end
                    local Audio = RageUI.Settings.Audio
                    RageUI.PlaySound(Audio[Audio.Use].LeftRight.audioName, Audio[Audio.Use].LeftRight.audioRef)
                elseif Selected and (CurrentMenu.Controls.Right.Active or (CurrentMenu.Controls.Click.Active and RightArrowHovered)) and not (CurrentMenu.Controls.Left.Active or (CurrentMenu.Controls.Click.Active and LeftArrowHovered)) then
                    Index = Index + 1
                    if Index > #ItSAMS then
                        Index = 1
                    end
                    if (Actions.onListChange ~= nil) then
                        Actions.onListChange(Index, ItSAMS[Index]);
                    end
                    local Audio = RageUI.Settings.Audio
                    RageUI.PlaySound(Audio[Audio.Use].LeftRight.audioName, Audio[Audio.Use].LeftRight.audioRef)
                end

                if Selected and (CurrentMenu.Controls.Select.Active or ((Hovered and CurrentMenu.Controls.Click.Active) and (not LeftArrowHovered and not RightArrowHovered))) then
                    local Audio = RageUI.Settings.Audio
                    RageUI.PlaySound(Audio[Audio.Use].Select.audioName, Audio[Audio.Use].Select.audioRef)

                    if (Actions.onSelected ~= nil) then
                        Actions.onSelected(Index, ItSAMS[Index]);
                    end

                    if Submenu ~= nil and type(Submenu) == "table" then
                        RageUI.NextMenu = Submenu[Index]
                    end
                elseif Selected then
                    if(Actions.onActive ~= nil) then
                        Actions.onActive()
                    end
                end
            end

            RageUI.Options = RageUI.Options + 1
        end
    end
end
function RageUI.Separator(Label)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            local Option = RageUI.Options + 1
            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then
                if (Label ~= nil) then
                    RenderText(Label, CurrentMenu.X + 25 + SettingsButton.Text.X + (CurrentMenu.WidthOffset * 2.5 ~= 0 and CurrentMenu.WidthOffset * 2.5 or 200), CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 245, 245, 245, 255, 1)
                end
                RageUI.ItemOffset = RageUI.ItemOffset + SettingsButton.Rectangle.Height
                if (CurrentMenu.Index == Option) then
                    if (RageUI.LastControl) then
                        CurrentMenu.Index = Option - 1
                        if (CurrentMenu.Index < 1) then
                            CurrentMenu.Index = RageUI.CurrentMenu.Options
                        end
                    else
                        CurrentMenu.Index = Option + 1
                    end
                end
            end
            RageUI.Options = RageUI.Options + 1
        end
    end
end

local SettingsSlider = {
    Background = { X = 255, Y = 51, Width = 150, Height = 9 },
    Slider = { X = 255, Y = 51, Width = 75, Height = 9 },
    Divider = { X = 329, Y = 48, Width = 2.5, Height = 15 },
    LeftArrow = { Dictionary = "commonmenu", Texture = "arrowleft", X = 235, Y = 46.5, Width = 20, Height = 20 },
    RightArrow = { Dictionary = "commonmenu", Texture = "arrowright", X = 405, Y = 46.5, Width = 20, Height = 20 },
}

function RageUI.Slider(Label, ProgressStart, ProgressMax, Description, Divider, Style, Enabled, Actions)
    local CurrentMenu = RageUI.CurrentMenu;
    local Audio = RageUI.Settings.Audio
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            local ItSAMS = {}
            for i = 1, ProgressMax do
                table.insert(ItSAMS, i)
            end
            local Option = RageUI.Options + 1

            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then
                local Selected = CurrentMenu.Index == Option
                local LeftArrowHovered, RightArrowHovered = false, false

                RageUI.ItSAMSSafeZone(CurrentMenu)

                local Hovered = false;
                local LeftBadgeOffset = ((Style.LeftBadge == RageUI.BadgeStyle.None or Style.LeftBadge == nil) and 0 or 27)
                local RightBadgeOffset = ((Style.RightBadge == RageUI.BadgeStyle.None or Style.RightBadge == nil) and 0 or 32)
                local RightOffset = 0
                if CurrentMenu.EnableMouse == true and (CurrentMenu.CursorStyle == 0) or (CurrentMenu.CursorStyle == 1) then
                    Hovered = RageUI.ItSAMSMouseBounds(CurrentMenu, Selected, Option, SettingsButton);
                end

                if Selected then
                    RenderSprite(SettingsButton.SelectedSprite.Dictionary, SettingsButton.SelectedSprite.Texture, CurrentMenu.X + 25, CurrentMenu.Y + SettingsButton.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButton.SelectedSprite.Height)
                    LeftArrowHovered = RageUI.IsMouseInBounds(CurrentMenu.X + 25 + SettingsSlider.LeftArrow.X + CurrentMenu.SafeZoneSize.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsSlider.LeftArrow.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.LeftArrow.Width, SettingsSlider.LeftArrow.Height)
                    RightArrowHovered = RageUI.IsMouseInBounds(CurrentMenu.X + 25 + SettingsSlider.RightArrow.X + CurrentMenu.SafeZoneSize.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsSlider.RightArrow.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.RightArrow.Width, SettingsSlider.RightArrow.Height)
                end
                if Enabled == true or Enabled == nil then
                    if Selected then
                        if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                            RenderText(Style.RightLabel, CurrentMenu.X + 25 + SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.RightText.Scale, 0, 0, 0, 255, 2)
                            RightOffset = MeasureStringWidth(Style.RightLabel, 0, 0.35)
                        end
                    else
                        if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                            RightOffset = MeasureStringWidth(Style.RightLabel, 0, 0.35)
                            RenderText(Style.RightLabel, CurrentMenu.X + 25 + SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.RightText.Scale, 245, 245, 245, 255, 2)
                        end
                    end
                end
                RightOffset = RightOffset + RightBadgeOffset
                if Enabled == true or Enabled == nil then
                    if Selected then
                        RenderText(Label, CurrentMenu.X + 25 + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 0, 0, 0, 255)

                        RenderSprite(SettingsSlider.LeftArrow.Dictionary, SettingsSlider.LeftArrow.Texture, CurrentMenu.X + 25 + SettingsSlider.LeftArrow.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.LeftArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.LeftArrow.Width, SettingsSlider.LeftArrow.Height, 0, 0, 0, 0, 255)
                        RenderSprite(SettingsSlider.RightArrow.Dictionary, SettingsSlider.RightArrow.Texture, CurrentMenu.X + 25 + SettingsSlider.RightArrow.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.RightArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.RightArrow.Width, SettingsSlider.RightArrow.Height, 0, 0, 0, 0, 255)
                    else
                        RenderText(Label, CurrentMenu.X + 25 + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 245, 245, 245, 255)
                    end
                else
                    RenderText(Label, CurrentMenu.X + 25 + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 163, 159, 148, 255)

                    if Selected then
                        RenderSprite(SettingsSlider.LeftArrow.Dictionary, SettingsSlider.LeftArrow.Texture, CurrentMenu.X + 25 + SettingsSlider.LeftArrow.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.LeftArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.LeftArrow.Width, SettingsSlider.LeftArrow.Height, 163, 159, 148, 255)
                        RenderSprite(SettingsSlider.RightArrow.Dictionary, SettingsSlider.RightArrow.Texture, CurrentMenu.X + 25 + SettingsSlider.RightArrow.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.RightArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.RightArrow.Width, SettingsSlider.RightArrow.Height, 163, 159, 148, 255)
                    end
                end

                if type(Style) == "table" then
                    if Style.Enabled == true or Style.Enabled == nil then
                        if type(Style) == 'table' then
                            if Style.LeftBadge ~= nil then
                                if Style.LeftBadge ~= RageUI.BadgeStyle.None then
                                    local BadgeData = Style.LeftBadge(Selected)

                                    RenderSprite(BadgeData.BadgeDictionary or "commonmenu", BadgeData.BadgeTexture or "", CurrentMenu.X + 25, CurrentMenu.Y + SettingsButton.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.LeftBadge.Width, SettingsButton.LeftBadge.Height, 0, BadgeData.BadgeColour and BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.A or 255)
                                end
                            end

                            if Style.RightBadge ~= nil then
                                if Style.RightBadge ~= RageUI.BadgeStyle.None then
                                    local BadgeData = Style.RightBadge(Selected)

                                    RenderSprite(BadgeData.BadgeDictionary or "commonmenu", BadgeData.BadgeTexture or "", CurrentMenu.X + 25 + SettingsButton.RightBadge.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.RightBadge.Width, SettingsButton.RightBadge.Height, 0, BadgeData.BadgeColour and BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.A or 255)
                                end
                            end
                        end
                    else
                        local LeftBadge = RageUI.BadgeStyle.Lock

                        if LeftBadge ~= RageUI.BadgeStyle.None and LeftBadge ~= nil then
                            local BadgeData = LeftBadge(Selected)

                            RenderSprite(BadgeData.BadgeDictionary or "commonmenu", BadgeData.BadgeTexture or "", CurrentMenu.X + 25, CurrentMenu.Y + SettingsButton.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.LeftBadge.Width, SettingsButton.LeftBadge.Height, 0, BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour.A or 255)
                        end
                    end
                else
                    error("UICheckBox Style is not a `table`")
                end
                RenderRectangle(CurrentMenu.X + 25 + SettingsSlider.Background.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.Background.Width, SettingsSlider.Background.Height, 4, 32, 57, 255)
                RenderRectangle(CurrentMenu.X + 25 + SettingsSlider.Slider.X + (((SettingsSlider.Background.Width - SettingsSlider.Slider.Width) / (#ItSAMS - 1)) * (ProgressStart - 1)) + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.Slider.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.Slider.Width, SettingsSlider.Slider.Height, 57, 116, 200, 255)
                if Divider then
                    RenderRectangle(CurrentMenu.X + 25 + SettingsSlider.Divider.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsSlider.Divider.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.Divider.Width, SettingsSlider.Divider.Height, 0, 0, 0, 255)
                end

                RageUI.ItemOffset = RageUI.ItemOffset + SettingsButton.Rectangle.Height

                RageUI.ItSAMSDescription(CurrentMenu, Description, Selected);

                if Selected and (CurrentMenu.Controls.Left.Active or (CurrentMenu.Controls.Click.Active and LeftArrowHovered)) and not (CurrentMenu.Controls.Right.Active or (CurrentMenu.Controls.Click.Active and RightArrowHovered)) then
                    ProgressStart = ProgressStart - 1
                    if ProgressStart < 1 then
                        ProgressStart = #ItSAMS
                    end
                    if (Actions.onSliderChange ~= nil) then
                        Actions.onSliderChange(ProgressStart);
                    end
                    RageUI.PlaySound(Audio[Audio.Use].LeftRight.audioName, Audio[Audio.Use].LeftRight.audioRef)
                elseif Selected and (CurrentMenu.Controls.Right.Active or (CurrentMenu.Controls.Click.Active and RightArrowHovered)) and not (CurrentMenu.Controls.Left.Active or (CurrentMenu.Controls.Click.Active and LeftArrowHovered)) then
                    ProgressStart = ProgressStart + 1
                    if ProgressStart > #ItSAMS then
                        ProgressStart = 1
                    end
                    if (Actions.onSliderChange ~= nil) then
                        Actions.onSliderChange(ProgressStart);
                    end
                    RageUI.PlaySound(Audio[Audio.Use].LeftRight.audioName, Audio[Audio.Use].LeftRight.audioRef)
                end

                if Selected and (CurrentMenu.Controls.Select.Active or ((Hovered and CurrentMenu.Controls.Click.Active) and (not LeftArrowHovered and not RightArrowHovered))) then
                    if (Actions.onSelected ~= nil) then
                        Actions.onSelected(ProgressStart);
                    end
                    RageUI.PlaySound(Audio[Audio.Use].Select.audioName, Audio[Audio.Use].Select.audioRef)
                elseif Selected then
                    if(Actions.onActive ~= nil) then
                        Actions.onActive()
                    end
                end
            end

            RageUI.Options = RageUI.Options + 1
        end
    end
end

local ItSAMS = {}
for i = 1, 10 do
    table.insert(ItSAMS, i)
end

function RageUI.UISliderHeritage(Label, ItemIndex, Description, Actions, Value)

    local CurrentMenu = RageUI.CurrentMenu;
    local Audio = RageUI.Settings.Audio

    if CurrentMenu ~= nil then
        if CurrentMenu() then
            local Option = RageUI.Options + 1

            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then
                local value = Value or 0.1
                local Selected = CurrentMenu.Index == Option
                local LeftArrowHovered, RightArrowHovered = false, false

                RageUI.ItSAMSSafeZone(CurrentMenu)

                local Hovered = false;
                local RightOffset = 0

                if CurrentMenu.EnableMouse == true and (CurrentMenu.CursorStyle == 0) or (CurrentMenu.CursorStyle == 1) then
                    Hovered = RageUI.ItSAMSMouseBounds(CurrentMenu, Selected, Option, SettingsButton);
                end

                if Selected then
                    RenderSprite(SettingsButton.SelectedSprite.Dictionary, SettingsButton.SelectedSprite.Texture, CurrentMenu.X + 25, CurrentMenu.Y + SettingsButton.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButton.SelectedSprite.Height)
                    LeftArrowHovered = RageUI.IsMouseInBounds(CurrentMenu.X + 25 + SettingsSlider.LeftArrow.X + CurrentMenu.SafeZoneSize.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsSlider.LeftArrow.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.LeftArrow.Width, SettingsSlider.LeftArrow.Height)
                    RightArrowHovered = RageUI.IsMouseInBounds(CurrentMenu.X + 25 + SettingsSlider.RightArrow.X + CurrentMenu.SafeZoneSize.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsSlider.RightArrow.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.RightArrow.Width, SettingsSlider.RightArrow.Height)
                end

                RightOffset = RightOffset

                if Selected then
                    RenderText(Label, CurrentMenu.X + 25 + SettingsButton.Text.X, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 0, 0, 0, 255)

                    RenderSprite(SettingsSlider.LeftArrow.Dictionary, SettingsSlider.LeftArrow.Texture, CurrentMenu.X + 25 + SettingsSlider.LeftArrow.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.LeftArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.LeftArrow.Width, SettingsSlider.LeftArrow.Height, 0, 0, 0, 0, 255)
                    RenderSprite(SettingsSlider.RightArrow.Dictionary, SettingsSlider.RightArrow.Texture, CurrentMenu.X + 25 + SettingsSlider.RightArrow.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.RightArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.RightArrow.Width, SettingsSlider.RightArrow.Height, 0, 0, 0, 0, 255)
                else
                    RenderText(Label, CurrentMenu.X + 25 + SettingsButton.Text.X, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 245, 245, 245, 255)

                    RenderSprite(SettingsSlider.LeftArrow.Dictionary, SettingsSlider.LeftArrow.Texture, CurrentMenu.X + 25 + SettingsSlider.LeftArrow.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.LeftArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.LeftArrow.Width, SettingsSlider.LeftArrow.Height, 0, 255, 255, 255, 255)
                    RenderSprite(SettingsSlider.RightArrow.Dictionary, SettingsSlider.RightArrow.Texture, CurrentMenu.X + 25 + SettingsSlider.RightArrow.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.RightArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.RightArrow.Width, SettingsSlider.RightArrow.Height, 0, 255, 255, 255, 255)
                end

                RenderRectangle(CurrentMenu.X + 25 + SettingsSlider.Background.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.Background.Width, SettingsSlider.Background.Height, 4, 32, 57, 255)
                RenderRectangle(CurrentMenu.X + 25 + SettingsSlider.Slider.X + (((SettingsSlider.Background.Width - SettingsSlider.Slider.Width) / (#ItSAMS)) * (ItemIndex)) + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.Slider.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.Slider.Width, SettingsSlider.Slider.Height, 57, 116, 200, 255)

                RenderRectangle(CurrentMenu.X + 25 + SettingsSlider.Divider.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsSlider.Divider.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.Divider.Width, SettingsSlider.Divider.Height, 245, 245, 245, 255)

                RageUI.ItemOffset = RageUI.ItemOffset + SettingsButton.Rectangle.Height

                RageUI.ItSAMSDescription(CurrentMenu, Description, Selected);

                if Selected and (CurrentMenu.Controls.SliderLeft.Active or (CurrentMenu.Controls.Click.Active and LeftArrowHovered)) and not (CurrentMenu.Controls.SliderRight.Active or (CurrentMenu.Controls.Click.Active and RightArrowHovered)) then
                    ItemIndex = ItemIndex - value
                    if ItemIndex < 0.1 then
                        ItemIndex = 0.0
                    else
                        RageUI.PlaySound(Audio[Audio.Use].Slider.audioName, Audio[Audio.Use].Slider.audioRef, true)
                    end
                    if (Actions.onSliderChange ~= nil) then
                        Actions.onSliderChange(ItemIndex / 10, ItemIndex);
                    end
                elseif Selected and (CurrentMenu.Controls.SliderRight.Active or (CurrentMenu.Controls.Click.Active and RightArrowHovered)) and not (CurrentMenu.Controls.SliderLeft.Active or (CurrentMenu.Controls.Click.Active and LeftArrowHovered)) then
                    ItemIndex = ItemIndex + value
                    if ItemIndex > #ItSAMS then
                        ItemIndex = 10
                    else
                        RageUI.PlaySound(Audio[Audio.Use].Slider.audioName, Audio[Audio.Use].Slider.audioRef, true)
                    end
                    if (Actions.onSliderChange ~= nil) then
                        Actions.onSliderChange(ItemIndex / 10, ItemIndex);
                    end
                end

                if Selected and (CurrentMenu.Controls.Select.Active or ((Hovered and CurrentMenu.Controls.Click.Active) and (not LeftArrowHovered and not RightArrowHovered))) then
                    if (Actions.onSelected ~= nil) then
                        Actions.onSelected(ItemIndex / 10, ItemIndex);
                    end
                    RageUI.PlaySound(Audio[Audio.Use].Select.audioName, Audio[Audio.Use].Select.audioRef, false)
                elseif Selected then
                    if(Actions.onActive ~= nil) then
                        Actions.onActive()
                    end
                end

            end

            RageUI.Options = RageUI.Options + 1
        end
    end
end

function RageUI.SliderProgress(Label, ProgressStart, ProgressMax, Description, Style, Enabled, Actions)

    local CurrentMenu = RageUI.CurrentMenu;
    local Audio = RageUI.Settings.Audio

    if CurrentMenu ~= nil then
        if CurrentMenu() then

            local ItSAMS = {}
            for i = 1, ProgressMax do
                table.insert(ItSAMS, i)
            end
            local Option = RageUI.Options + 1

            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then
                local Selected = CurrentMenu.Index == Option
                local LeftArrowHovered, RightArrowHovered = false, false

                RageUI.ItSAMSSafeZone(CurrentMenu)

                local Hovered = false;
                local LeftBadgeOffset = ((Style.LeftBadge == RageUI.BadgeStyle.None or Style.LeftBadge == nil) and 0 or 27)
                local RightBadgeOffset = ((Style.RightBadge == RageUI.BadgeStyle.None or Style.RightBadge == nil) and 0 or 32)
                local RightOffset = 0
                if CurrentMenu.EnableMouse == true and (CurrentMenu.CursorStyle == 0) or (CurrentMenu.CursorStyle == 1) then
                    Hovered = RageUI.ItSAMSMouseBounds(CurrentMenu, Selected, Option, SettingsButton);
                end

                if Selected then
                    RenderSprite(SettingsButton.SelectedSprite.Dictionary, SettingsButton.SelectedSprite.Texture, CurrentMenu.X, CurrentMenu.Y + SettingsButton.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButton.SelectedSprite.Height)
                    LeftArrowHovered = RageUI.IsMouseInBounds(CurrentMenu.X + SettingsSlider.LeftArrow.X + CurrentMenu.SafeZoneSize.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsSlider.LeftArrow.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.LeftArrow.Width, SettingsSlider.LeftArrow.Height)
                    RightArrowHovered = RageUI.IsMouseInBounds(CurrentMenu.X + SettingsSlider.RightArrow.X + CurrentMenu.SafeZoneSize.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsSlider.RightArrow.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.RightArrow.Width, SettingsSlider.RightArrow.Height)
                end
                if Enabled == true or Enabled == nil then
                    if Selected then
                        if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                            RenderText(Style.RightLabel, CurrentMenu.X + SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.RightText.Scale, 0, 0, 0, 255, 2)
                            RightOffset = MeasureStringWidth(Style.RightLabel, 0, 0.35)
                        end
                    else
                        if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                            RightOffset = MeasureStringWidth(Style.RightLabel, 0, 0.35)
                            RenderText(Style.RightLabel, CurrentMenu.X + SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.RightText.Scale, 245, 245, 245, 255, 2)
                        end
                    end
                end
                RightOffset = RightOffset + RightBadgeOffset
                if Enabled == true or Enabled == nil then
                    if Selected then
                        RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 0, 0, 0, 255)

                        RenderSprite(SettingsSlider.LeftArrow.Dictionary, SettingsSlider.LeftArrow.Texture, CurrentMenu.X + SettingsSlider.LeftArrow.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.LeftArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.LeftArrow.Width, SettingsSlider.LeftArrow.Height, 0, 0, 0, 0, 255)
                        RenderSprite(SettingsSlider.RightArrow.Dictionary, SettingsSlider.RightArrow.Texture, CurrentMenu.X + SettingsSlider.RightArrow.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.RightArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.RightArrow.Width, SettingsSlider.RightArrow.Height, 0, 0, 0, 0, 255)
                    else
                        RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 245, 245, 245, 255)
                    end
                else
                    RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 163, 159, 148, 255)

                    if Selected then
                        RenderSprite(SettingsSlider.LeftArrow.Dictionary, SettingsSlider.LeftArrow.Texture, CurrentMenu.X + SettingsSlider.LeftArrow.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.LeftArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.LeftArrow.Width, SettingsSlider.LeftArrow.Height, 163, 159, 148, 255)
                        RenderSprite(SettingsSlider.RightArrow.Dictionary, SettingsSlider.RightArrow.Texture, CurrentMenu.X + SettingsSlider.RightArrow.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.RightArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.RightArrow.Width, SettingsSlider.RightArrow.Height, 163, 159, 148, 255)
                    end
                end

                if type(Style) == "table" then
                    if Style.Enabled == true or Style.Enabled == nil then
                        if type(Style) == 'table' then
                            if Style.LeftBadge ~= nil then
                                if Style.LeftBadge ~= RageUI.BadgeStyle.None then
                                    local BadgeData = Style.LeftBadge(Selected)

                                    RenderSprite(BadgeData.BadgeDictionary or "commonmenu", BadgeData.BadgeTexture or "", CurrentMenu.X, CurrentMenu.Y + SettingsButton.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.LeftBadge.Width, SettingsButton.LeftBadge.Height, 0, BadgeData.BadgeColour and BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.A or 255)
                                end
                            end

                            if Style.RightBadge ~= nil then
                                if Style.RightBadge ~= RageUI.BadgeStyle.None then
                                    local BadgeData = Style.RightBadge(Selected)

                                    RenderSprite(BadgeData.BadgeDictionary or "commonmenu", BadgeData.BadgeTexture or "", CurrentMenu.X + SettingsButton.RightBadge.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.RightBadge.Width, SettingsButton.RightBadge.Height, 0, BadgeData.BadgeColour and BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.A or 255)
                                end
                            end
                        end
                    else
                        local LeftBadge = RageUI.BadgeStyle.Lock

                        if LeftBadge ~= RageUI.BadgeStyle.None and LeftBadge ~= nil then
                            local BadgeData = LeftBadge(Selected)

                            RenderSprite(BadgeData.BadgeDictionary or "commonmenu", BadgeData.BadgeTexture or "", CurrentMenu.X, CurrentMenu.Y + SettingsButton.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.LeftBadge.Width, SettingsButton.LeftBadge.Height, 0, BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour.A or 255)
                        end
                    end
                else
                    error("UICheckBox Style is not a `table`")
                end

                if (type(Style.ProgressBackgroundColor) == "table") then
                    RenderRectangle(CurrentMenu.X + SettingsSlider.Background.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.Background.Width, SettingsSlider.Background.Height, Style.ProgressBackgroundColor.R, Style.ProgressBackgroundColor.G, Style.ProgressBackgroundColor.B, Style.ProgressBackgroundColor.A)
                else
                    error("Style ProgressBackgroundColor is not a table or undefined")
                end

                if (type(Style.ProgressColor) == "table") then
                    RenderRectangle(CurrentMenu.X + SettingsSlider.Slider.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.Slider.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, (((SettingsSlider.Slider.Width) / (#ItSAMS - 1)) * (ProgressStart - 1)), SettingsSlider.Slider.Height, Style.ProgressColor.R, Style.ProgressColor.G, Style.ProgressColor.B, Style.ProgressColor.A)
                else
                    error("Style ProgressColor is not a table or undefined")
                end

                RageUI.ItemOffset = RageUI.ItemOffset + SettingsButton.Rectangle.Height

                RageUI.ItSAMSDescription(CurrentMenu, Description, Selected);

                if Selected and (CurrentMenu.Controls.Left.Active or (CurrentMenu.Controls.Click.Active and LeftArrowHovered)) and not (CurrentMenu.Controls.Right.Active or (CurrentMenu.Controls.Click.Active and RightArrowHovered)) then
                    ProgressStart = ProgressStart - 1
                    if ProgressStart < 1 then
                        ProgressStart = #ItSAMS
                    end
                    if (Actions.onSliderChange ~= nil) then
                        Actions.onSliderChange(ProgressStart);
                    end
                    RageUI.PlaySound(Audio[Audio.Use].LeftRight.audioName, Audio[Audio.Use].LeftRight.audioRef)
                elseif Selected and (CurrentMenu.Controls.Right.Active or (CurrentMenu.Controls.Click.Active and RightArrowHovered)) and not (CurrentMenu.Controls.Left.Active or (CurrentMenu.Controls.Click.Active and LeftArrowHovered)) then
                    ProgressStart = ProgressStart + 1
                    if ProgressStart > #ItSAMS then
                        ProgressStart = 1
                    end
                    if (Actions.onSliderChange ~= nil) then
                        Actions.onSliderChange(ProgressStart);
                    end
                    RageUI.PlaySound(Audio[Audio.Use].LeftRight.audioName, Audio[Audio.Use].LeftRight.audioRef)
                end

                if Selected and (CurrentMenu.Controls.Select.Active or ((Hovered and CurrentMenu.Controls.Click.Active) and (not LeftArrowHovered and not RightArrowHovered))) then
                    if (Actions.onSelected ~= nil) then
                        Actions.onSelected(ProgressStart);
                    end
                    RageUI.PlaySound(Audio[Audio.Use].Select.audioName, Audio[Audio.Use].Select.audioRef)
                elseif Selected then
                    if(Actions.onActive ~= nil) then
                        Actions.onActive()
                    end
                end
            end

            RageUI.Options = RageUI.Options + 1
        end
    end
end

local TextPanels = {
    Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 4, Width = 471, Height = 42 },
    Text = {
        Left = { X = 8, Y = 10, Scale = 0.28 },
        Right = { X = 8, Y = 10, Scale = 0.28 },
    },
}

function RageUI.BoutonPanel(LeftText, RightText, Index)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        local leftTextSize = MeasureStringWidth(LeftText)
        if CurrentMenu() and (Index == nil or (CurrentMenu.Index == Index)) then
            RenderRectangle(CurrentMenu.X, CurrentMenu.Y + TextPanels.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + (RageUI.StatisticPanelCount * 42), TextPanels.Background.Width + CurrentMenu.WidthOffset, TextPanels.Background.Height, 0, 0, 0, 170)
            RenderText(LeftText or "", CurrentMenu.X + TextPanels.Text.Left.X, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + TextPanels.Text.Left.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, TextPanels.Text.Left.Scale, 245, 245, 245, 255, 0)
            RenderText(RightText or "", CurrentMenu.X + TextPanels.Background.Width + CurrentMenu.WidthOffset - leftTextSize, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + TextPanels.Text.Left.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, TextPanels.Text.Left.Scale, 245, 245, 245, 255, 2)
            RageUI.StatisticPanelCount = RageUI.StatisticPanelCount + 1
        end
    end
end

local Colour = {
    Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 4, Width = 431, Height = 112 },
    LeftArrow = { Dictionary = "commonmenu", Texture = "arrowleft", X = 7.5 + 25, Y = 15 + 40, Width = 30, Height = 30 },
    RightArrow = { Dictionary = "commonmenu", Texture = "arrowright", X = 393.5 + 25, Y = 15 + 40, Width = 30, Height = 30 },
    Header = { X = 215.5 + 25, Y = 15 + 40, Scale = 0.35 },
    Box = { X = 15 + 25, Y = 55 + 40, Width = 44.5, Height = 44.5 },
    SelectedRectangle = { X = 15 + 25, Y = 47 + 40, Width = 44.5, Height = 8 },
    Seperator = { Text = "of" }
}

function RageUI.ColourPanel(Title, Colours, MinimumIndex, CurrentIndex, Action, Index, Style)
    local CurrentMenu = RageUI.CurrentMenu;

    if CurrentMenu ~= nil then
        if CurrentMenu() and (CurrentMenu.Index == Index) then
            local Maximum = (#Colours > 9) and 9 or #Colours
            local Hovered = RageUI.IsMouseInBounds(CurrentMenu.X + Colour.Box.X + CurrentMenu.SafeZoneSize.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Colour.Box.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, (Colour.Box.Width * Maximum), Colour.Box.Height)
            local LeftArrowHovered = RageUI.IsMouseInBounds(CurrentMenu.X + Colour.LeftArrow.X + CurrentMenu.SafeZoneSize.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Colour.LeftArrow.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Colour.LeftArrow.Width, Colour.LeftArrow.Height)
            local RightArrowHovered = RageUI.IsMouseInBounds(CurrentMenu.X + Colour.RightArrow.X + CurrentMenu.SafeZoneSize.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Colour.RightArrow.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Colour.RightArrow.Width, Colour.RightArrow.Height)
            local Selected = false

            RenderSprite(Colour.Background.Dictionary, Colour.Background.Texture, CurrentMenu.X + 25, CurrentMenu.Y + Colour.Background.Y + 40 + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Colour.Background.Width + CurrentMenu.WidthOffset, Colour.Background.Height)
            RenderSprite(Colour.LeftArrow.Dictionary, Colour.LeftArrow.Texture, CurrentMenu.X + Colour.LeftArrow.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Colour.LeftArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Colour.LeftArrow.Width, Colour.LeftArrow.Height)
            RenderSprite(Colour.RightArrow.Dictionary, Colour.RightArrow.Texture, CurrentMenu.X + Colour.RightArrow.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Colour.RightArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Colour.RightArrow.Width, Colour.RightArrow.Height)

            RenderRectangle(CurrentMenu.X + Colour.SelectedRectangle.X + (Colour.Box.Width * (CurrentIndex - MinimumIndex)) + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Colour.SelectedRectangle.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Colour.SelectedRectangle.Width, Colour.SelectedRectangle.Height, 245, 245, 245, 255)

            for i = 1, Maximum do
                RenderRectangle(CurrentMenu.X + Colour.Box.X + (Colour.Box.Width * (i - 1)) + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Colour.Box.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Colour.Box.Width, Colour.Box.Height, table.unpack(Colours[MinimumIndex + i - 1]))
            end

            local ColourSeperator = {}
            if type(Style) == "table" then
                if type(Style.Seperator) == "table" then
                    ColourSeperator = Style.Seperator
                else
                    ColourSeperator = Colour.Seperator
                end
            else
                ColourSeperator = Colour.Seperator
            end

            RenderText((Title and Title or "") .. " (" .. CurrentIndex .. "/" .. #Colours .. ")", CurrentMenu.X + 25 + RageUI.Settings.Panels.Grid.Text.Top.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + RageUI.Settings.Panels.Grid.Text.Top.Y + 40 + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Panels.Grid.Text.Top.Scale, 245, 245, 245, 255, 1)

            if Hovered or LeftArrowHovered or RightArrowHovered then
                if RageUI.Settings.Controls.Click.Active then
                    Selected = true

                    if LeftArrowHovered then
                        CurrentIndex = CurrentIndex - 1

                        if CurrentIndex < 1 then
                            CurrentIndex = #Colours
                            MinimumIndex = #Colours - Maximum + 1
                        elseif CurrentIndex < MinimumIndex then
                            MinimumIndex = MinimumIndex - 1
                        end
                    elseif RightArrowHovered then
                        CurrentIndex = CurrentIndex + 1

                        if CurrentIndex > #Colours then
                            CurrentIndex = 1
                            MinimumIndex = 1
                        elseif CurrentIndex > MinimumIndex + Maximum - 1 then
                            MinimumIndex = MinimumIndex + 1
                        end
                    elseif Hovered then
                        for i = 1, Maximum do
                            if RageUI.IsMouseInBounds(CurrentMenu.X + Colour.Box.X + (Colour.Box.Width * (i - 1)) + CurrentMenu.SafeZoneSize.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Colour.Box.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Colour.Box.Width, Colour.Box.Height) then
                                CurrentIndex = MinimumIndex + i - 1
                            end
                        end
                    end

                    if (Action.onColorChange ~= nil) then
                        Action.onColorChange(MinimumIndex, CurrentIndex)
                    end
                end
            end

            RageUI.ItemOffset = RageUI.ItemOffset + Colour.Background.Height + Colour.Background.Y

            if (Hovered or LeftArrowHovered or RightArrowHovered) and RageUI.Settings.Controls.Click.Active then
                local Audio = RageUI.Settings.Audio
                RageUI.PlaySound(Audio[Audio.Use].Select.audioName, Audio[Audio.Use].Select.audioRef)
            end
        end
    end
end

local GridType = RageUI.Enum {
    Default = 1,
    Horizontal = 2,
    Vertical = 3
}

local GridSprite = {
    [GridType.Default] = { Dictionary = "pause_menu_pages_char_mom_dad", Texture = "nose_grid", },
    [GridType.Horizontal] = { Dictionary = "RageUI_", Texture = "horizontal_grid", },
    [GridType.Vertical] = { Dictionary = "RageUI_", Texture = "vertical_grid", },
}

local Grid = {
    Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 4, Width = 431, Height = 275 },
    Grid = { X = 115.5, Y = 47.5, Width = 200, Height = 200 },
    Circle = { Dictionary = "mpinventory", Texture = "in_world_circle", X = 115.5, Y = 47.5, Width = 20, Height = 20 },
    Text = {
        Top = { X = 215.5, Y = 15, Scale = 0.35 },
        Bottom = { X = 215.5, Y = 250, Scale = 0.35 },
        Left = { X = 57.75, Y = 130, Scale = 0.35 },
        Right = { X = 373.25, Y = 130, Scale = 0.35 },
    },
}

local function UIGridPanel(Type, StartedX, StartedY, TopText, BottomText, LeftText, RightText, Action, Index)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() and ((CurrentMenu.Index == Index)) then
            local X = Type == GridType.Default and StartedX or Type == GridType.Horizontal and StartedX or Type == GridType.Vertical and 0.5
            local Y = Type == GridType.Default and StartedY or Type == GridType.Horizontal and 0.5 or Type == GridType.Vertical and StartedY
            local Hovered = RageUI.IsMouseInBounds(CurrentMenu.X + Grid.Grid.X + CurrentMenu.SafeZoneSize.X + 20, CurrentMenu.Y + Grid.Grid.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20, Grid.Grid.Width + CurrentMenu.WidthOffset - 40, Grid.Grid.Height - 40)
            local Selected = false
            local CircleX = CurrentMenu.X + Grid.Grid.X + (CurrentMenu.WidthOffset / 2) + 20
            local CircleY = CurrentMenu.Y + Grid.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20
            if X < 0.0 or X > 1.0 then
                X = 0.0
            end
            if Y < 0.0 or Y > 1.0 then
                Y = 0.0
            end
            CircleX = CircleX + ((Grid.Grid.Width - 40) * X) - (Grid.Circle.Width / 2)
            CircleY = CircleY + ((Grid.Grid.Height - 40) * Y) - (Grid.Circle.Height / 2)
            RenderSprite(Grid.Background.Dictionary, Grid.Background.Texture, CurrentMenu.X, CurrentMenu.Y + Grid.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Grid.Background.Width + CurrentMenu.WidthOffset, Grid.Background.Height)
            RenderSprite(GridSprite[Type].Dictionary, GridSprite[Type].Texture, CurrentMenu.X + Grid.Grid.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Grid.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Grid.Grid.Width, Grid.Grid.Height)
            RenderSprite(Grid.Circle.Dictionary, Grid.Circle.Texture, CircleX, CircleY, Grid.Circle.Width, Grid.Circle.Height)
            if (Type == GridType.Default) then
                RenderText(TopText or "", CurrentMenu.X + Grid.Text.Top.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Grid.Text.Top.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Grid.Text.Top.Scale, 245, 245, 245, 255, 1)
                RenderText(BottomText or "", CurrentMenu.X + Grid.Text.Bottom.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Grid.Text.Bottom.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Grid.Text.Bottom.Scale, 245, 245, 245, 255, 1)
                RenderText(LeftText or "", CurrentMenu.X + Grid.Text.Left.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Grid.Text.Left.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Grid.Text.Left.Scale, 245, 245, 245, 255, 1)
                RenderText(RightText or "", CurrentMenu.X + Grid.Text.Right.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Grid.Text.Right.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Grid.Text.Right.Scale, 245, 245, 245, 255, 1)
            end
            if (Type == GridType.Vertical) then
                RenderText(TopText or "", CurrentMenu.X + Grid.Text.Top.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Grid.Text.Top.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Grid.Text.Top.Scale, 245, 245, 245, 255, 1)
                RenderText(BottomText or "", CurrentMenu.X + Grid.Text.Bottom.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Grid.Text.Bottom.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Grid.Text.Bottom.Scale, 245, 245, 245, 255, 1)
            end
            if (Type == GridType.Horizontal) then
                RenderText(LeftText or "", CurrentMenu.X + Grid.Text.Left.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Grid.Text.Left.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Grid.Text.Left.Scale, 245, 245, 245, 255, 1)
                RenderText(RightText or "", CurrentMenu.X + Grid.Text.Right.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Grid.Text.Right.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Grid.Text.Right.Scale, 245, 245, 245, 255, 1)
            end
            if Hovered then
                if IsDisabledControlPressed(0, 24) then
                    Selected = true
                    CircleX = math.round(GetControlNormal(2, 239) * 1920) - CurrentMenu.SafeZoneSize.X - (Grid.Circle.Width / 2)
                    CircleY = math.round(GetControlNormal(2, 240) * 1080) - CurrentMenu.SafeZoneSize.Y - (Grid.Circle.Height / 2)
                    if CircleX > (CurrentMenu.X + Grid.Grid.X + (CurrentMenu.WidthOffset / 2) + 20 + Grid.Grid.Width - 40) then
                        CircleX = CurrentMenu.X + Grid.Grid.X + (CurrentMenu.WidthOffset / 2) + 20 + Grid.Grid.Width - 40
                    elseif CircleX < (CurrentMenu.X + Grid.Grid.X + 20 - (Grid.Circle.Width / 2)) then
                        CircleX = CurrentMenu.X + Grid.Grid.X + 20 - (Grid.Circle.Width / 2)
                    end
                    if CircleY > (CurrentMenu.Y + Grid.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20 + Grid.Grid.Height - 40) then
                        CircleY = CurrentMenu.Y + Grid.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20 + Grid.Grid.Height - 40
                    elseif CircleY < (CurrentMenu.Y + Grid.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20 - (Grid.Circle.Height / 2)) then
                        CircleY = CurrentMenu.Y + Grid.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20 - (Grid.Circle.Height / 2)
                    end
                    X = math.round((CircleX - (CurrentMenu.X + Grid.Grid.X + (CurrentMenu.WidthOffset / 2) + 20) + (Grid.Circle.Width / 2)) / (Grid.Grid.Width - 40), 2)
                    Y = math.round((CircleY - (CurrentMenu.Y + Grid.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20) + (Grid.Circle.Height / 2)) / (Grid.Grid.Height - 40), 2)
                    if (X ~= StartedX) and (Y ~= StartedY) then
                        Action.onPositionChange(X, Y, (X * 2 - 1), (Y * 2 - 1))
                    end
                    StartedX = X;
                    StartedY = Y;
                    if X > 1.0 then
                        X = 1.0
                    end
                    if Y > 1.0 then
                        Y = 1.0
                    end
                end
            end
            RageUI.ItemOffset = RageUI.ItemOffset + Grid.Background.Height + Grid.Background.Y
            if Hovered and Selected then
                local Audio = RageUI.Settings.Audio
                RageUI.PlaySound(Audio[Audio.Use].Slider.audioName, Audio[Audio.Use].Slider.audioRef, true)
                if (Action.onSelected ~= nil) then
                    Action.onSelected(X, Y, (X * 2 - 1), (Y * 2 - 1));
                end
            end

        end
    end
end

function RageUI.Grid(StartedX, StartedY, TopText, BottomText, LeftText, RightText, Action, Index)
    UIGridPanel(GridType.Default, StartedX, StartedY, TopText, BottomText, LeftText, RightText, Action, Index)
end

function RageUI.GridHorizontal(StartedX, LeftText, RightText, Action, Index)
    UIGridPanel(GridType.Horizontal, StartedX, nil, nil, nil, LeftText, RightText, Action, Index)
end

function RageUI.GridVertical(StartedY, TopText, BottomText, Action, Index)
    UIGridPanel(GridType.Vertical, nil, StartedY, TopText, BottomText, nil, nil, Action, Index)
end

local BoxSettings = {
    itemPerLine = 4,
    width = 215,
    height = 120,
    space = 5
}

function RageUI.RenderBox(ItSAMS)
    local lastLine = 0;
    for k, v in pairs(VisualitionCaisse[ItSAMS]) do
        local x = 525 + (((k -1) - (BoxSettings.itemPerLine * lastLine)) * (BoxSettings.width + BoxSettings.space))
        local y = (lastLine * (BoxSettings.height + BoxSettings.space))
        RenderSprite("caissemystere", v.model, x, y, BoxSettings.width, BoxSettings.height, 0, 255, 255, 255, 255)
        if math.tointeger(k / BoxSettings.itemPerLine) ~= nil then
            lastLine = math.tointeger(k / BoxSettings.itemPerLine)
        end
    end
end
local Percentage = {
    Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 54, Width = 425, Height = 50 },
    Bar = { X = 45, Y = 105, Width = 400, Height = 10 },
    Text = {
        Left = { X = 55, Y = 50, Scale = 0.36 },
        Middle = { X = 245.5, Y = 50, Scale = 0.36  },
        Right = { X = 425, Y = 50, Scale = 0.36  },
    },
}

function RageUI.PercentagePanel(Percent, HeaderText, MinText, MaxText, Action, Index)
    local CurrentMenu = RageUI.CurrentMenu

    if CurrentMenu ~= nil then
        if CurrentMenu() and (Index == nil or (CurrentMenu.Index == Index)) then
            local Hovered = RageUI.IsMouseInBounds(CurrentMenu.X + Percentage.Bar.X + CurrentMenu.SafeZoneSize.X, CurrentMenu.Y + Percentage.Bar.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset - 4, Percentage.Bar.Width + CurrentMenu.WidthOffset, Percentage.Bar.Height + 8)
            local Selected = false
            local Progress = Percentage.Bar.Width

            if Percent < 0.0 then
                Percent = 0.0
            elseif Percent > 1.0 then
                Percent = 1.0
            end

            Progress = Progress * Percent

            --RenderSprite(Percentage.Background.Dictionary, Percentage.Background.Texture, CurrentMenu.X, CurrentMenu.Y + Percentage.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Percentage.Background.Width + CurrentMenu.WidthOffset, 3)
            RenderRectangle(CurrentMenu.X + Percentage.Bar.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Percentage.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Percentage.Bar.Width, Percentage.Bar.Height, 150,150,150, 255)
            RenderRectangle(CurrentMenu.X + Percentage.Bar.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Percentage.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Progress, Percentage.Bar.Height, 245, 245, 245, 255)

            RenderText(HeaderText or "Opacity", CurrentMenu.X + Percentage.Text.Middle.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Percentage.Text.Middle.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 4, Percentage.Text.Middle.Scale, 245, 245, 245, 255, 1)
            RenderText(MinText or "0%", CurrentMenu.X + Percentage.Text.Left.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Percentage.Text.Left.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 4, Percentage.Text.Left.Scale, 245, 245, 245, 255, 1)
            RenderText(MaxText or "100%", CurrentMenu.X + Percentage.Text.Right.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Percentage.Text.Right.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 4, Percentage.Text.Right.Scale, 245, 245, 245, 255, 1)

            if Hovered then
                if IsDisabledControlPressed(0, 24) then
                    Selected = true

                    Progress = math.round(GetControlNormal(2, 239) * 1920) - CurrentMenu.SafeZoneSize.X - (CurrentMenu.X + Percentage.Bar.X + (CurrentMenu.WidthOffset / 2))

                    if Progress < 0 then
                        Progress = 0
                    elseif Progress > (Percentage.Bar.Width) then
                        Progress = Percentage.Bar.Width
                    end

                    Percent = math.round(Progress / Percentage.Bar.Width, 2)
                    if (Action.onProgressChange ~= nil) then
                        Action.onProgressChange(Percent)
                    end
                end
            end

            RageUI.ItemOffset = RageUI.ItemOffset + Percentage.Background.Height + Percentage.Background.Y

            if Hovered and Selected then
                local Audio = RageUI.Settings.Audio
                RageUI.PlaySound(Audio[Audio.Use].Slider.audioName, Audio[Audio.Use].Slider.audioRef, true)
                if (Action.onSelected ~= nil) then
                    Action.onSelected(Percent)
                end
            end
        end
    end
end

local Slider = {
	Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 4, Width = 431, Height = 76 },
	Text = {
		Left = { X = 18, Y = 8, Scale = 0.32 },
		Right = { X = 380, Y = 8, Scale = 0.32 },
		Upper = {X = 230, Y = 8, Scale = 0.32},
	},
	Bar = { X = 25, Y = 36, Width = 250, Height = 16 },
	Slider = { X = 20, Y = 14.5, Width = 35, Height = 9 },
	LeftArrow = { Dictionary = "commonmenu", Texture = "arrowleft", X = 12, Y = 32.5, Width = 25, Height = 25 },
	RightArrow = { Dictionary = "commonmenu", Texture = "arrowright", X = 389, Y = 32.5, Width = 25, Height = 25 },
}

function RageUI.SliderPanel(Value, MinValue, UpperText, MaxValue, Actions, Index)
	local CurrentMenu = RageUI.CurrentMenu
	if CurrentMenu ~= nil then
		if CurrentMenu() and ((CurrentMenu.Index == Index)) then
			Value = Value or 0
			Slider.Bar.Width = Slider.RightArrow.X- Slider.LeftArrow.X - Slider.LeftArrow.Width - 5 + CurrentMenu.WidthOffset
			Slider.Bar.X = Slider.LeftArrow.X + Slider.LeftArrow.Width
			Slider.Text.Upper.X = (Slider.Bar.Width) / 2 + Slider.Bar.X
			Slider.Text.Right.X = Slider.RightArrow.X + Slider.LeftArrow.Width
			local Hovered = false
			local LeftArrowHovered, RightArrowHovered = false, false
			local SliderW = Slider.Bar.Width / (64 + 1)
			local SliderX =  CurrentMenu.X + Slider.Bar.X + Value * Slider.Bar.Width / MaxValue

			Hovered = RageUI.IsMouseInBounds(CurrentMenu.X + Slider.Bar.X + CurrentMenu.SafeZoneSize.X, CurrentMenu.Y + Slider.Bar.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset - 4, Slider.Bar.Width, Slider.Bar.Height + 8)

			RenderSprite("commonmenu", "gradient_bgd", CurrentMenu.X, CurrentMenu.Y + Slider.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Slider.Background.Width + CurrentMenu.WidthOffset, Slider.Background.Height, 0.0, 255, 255, 255, 255)
			RenderText(MinValue, CurrentMenu.X + Slider.Text.Left.X, CurrentMenu.Y + Slider.Text.Left.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Slider.Text.Left.Scale, 255, 255, 255, 255)
			RenderText(UpperText, CurrentMenu.X + Slider.Text.Upper.X, CurrentMenu.Y + Slider.Text.Upper.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Slider.Text.Upper.Scale, 255, 255, 255, 255, "Center")
			RenderText(MaxValue, CurrentMenu.X + Slider.Text.Right.X + CurrentMenu.WidthOffset, CurrentMenu.Y + Slider.Text.Right.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Slider.Text.Right.Scale, 255, 255, 255, 255, "Right")

			RenderSprite(Slider.LeftArrow.Dictionary, Slider.LeftArrow.Texture, CurrentMenu.X + Slider.LeftArrow.X, CurrentMenu.Y + Slider.LeftArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Slider.LeftArrow.Width, Slider.LeftArrow.Height, 0.0,  255, 255, 255, 255)
			RenderSprite(Slider.RightArrow.Dictionary, Slider.RightArrow.Texture, CurrentMenu.X + Slider.RightArrow.X + CurrentMenu.WidthOffset , CurrentMenu.Y + Slider.RightArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Slider.RightArrow.Width, Slider.RightArrow.Height, 0.0, 255, 255, 255, 255)
			RenderRectangle(CurrentMenu.X + Slider.Bar.X, CurrentMenu.Y + Slider.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Slider.Bar.Width, Slider.Bar.Height, 87, 87, 87, 255)
			RenderRectangle(SliderX, CurrentMenu.Y + Slider.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SliderW, Slider.Bar.Height, 245, 245, 245, 255)

			LeftArrowHovered = RageUI.IsMouseInBounds(CurrentMenu.X + Slider.LeftArrow.X + CurrentMenu.SafeZoneSize.X, CurrentMenu.Y + Slider.LeftArrow.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Slider.LeftArrow.Width, Slider.LeftArrow.Height)
			RightArrowHovered = RageUI.IsMouseInBounds(CurrentMenu.X + Slider.RightArrow.X + CurrentMenu.SafeZoneSize.X + CurrentMenu.WidthOffset, CurrentMenu.Y + Slider.RightArrow.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Slider.RightArrow.Width, Slider.RightArrow.Height)

			if Hovered then
				if IsDisabledControlPressed(0, 24) then
					local GetControl_X = GetDisabledControlNormal
					Value = (math.round(GetControl_X(2, 239) * 1920) - CurrentMenu.SafeZoneSize.X - Slider.Bar.X )/ Slider.Bar.Width * MaxValue
					if Value < 0 then
						Value = 0
					elseif Value >= MaxValue then
						Value = MaxValue
					end
					Value = math.round(Value, 0)
					if (Actions.onSliderChange ~= nil) then
						Actions.onSliderChange(Value)
					end
				end
			elseif CurrentMenu.Controls.Click.Active and (LeftArrowHovered or RightArrowHovered) then
				local max = type(ItSAMS) == "table" and #ItSAMS or MaxValue
				Value = Value + (LeftArrowHovered and -1 or RightArrowHovered and 1)
				if Value < MinValue then
					Value = max
				elseif Value > max  then
					Value = MinValue
				end
				if (Actions.onSliderChange ~= nil) then
					Actions.onSliderChange(Value);
				end

				local Audio = RageUI.Settings.Audio
				RageUI.PlaySound(Audio[Audio.Use].LeftRight.audioName, Audio[Audio.Use].LeftRight.audioRef)
			end
		end
	end
end

function RageUI.RenderSprite(Dictionary, Texture)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            RenderSprite(Dictionary, Texture, CurrentMenu.X, CurrentMenu.Y + TextPanels.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + (RageUI.StatisticPanelCount * 42), TextPanels.Background.Width + CurrentMenu.WidthOffset, TextPanels.Background.Height + 200, 0, 255, 255, 255, 255);
            RageUI.StatisticPanelCount = RageUI.StatisticPanelCount + 1
        end
    end
end

local Statistics = {
    Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 4, Width = 471, Height = 42 },
    Text = {
        Left = { X = -40, Y = 15, Scale = 0.28 },
    },
    Bar = { Right = 8, Y = 27, Width = 200, Height = 10, OffsetRatio = 0.5 },
    Divider = {
        [1] = { X = 200, Y = 27, Width = 2, Height = 10 },
        [2] = { X = 200, Y = 27, Width = 2, Height = 10 },
        [3] = { X = 200, Y = 27, Width = 2, Height = 10 },
        [4] = { X = 200, Y = 27, Width = 2, Height = 10 },
        [5] = { X = 200, Y = 27, Width = 2, Height = 10 },
    }
}

function RageUI.StatisticPanel(Percent, Text, Index)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() and (Index == nil or (CurrentMenu.Index == Index)) then
            local BarWidth = Statistics.Bar.Width + CurrentMenu.WidthOffset * Statistics.Bar.OffsetRatio
            RenderRectangle(CurrentMenu.X + 25, CurrentMenu.Y + Statistics.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + (RageUI.StatisticPanelCount * 42) + 50, Statistics.Background.Width + CurrentMenu.WidthOffset - 39, Statistics.Background.Height, 0, 0, 0, 170)
            RenderText(Text or "", CurrentMenu.X + 25 + 8.0, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Text.Left.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 50, 0, Statistics.Text.Left.Scale, 245, 245, 245, 255, 0)
            RenderRectangle(CurrentMenu.X + 25 + RageUI.Settings.ItSAMS.Title.Background.Width - BarWidth - Statistics.Bar.Right + CurrentMenu.WidthOffset, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 50, BarWidth, Statistics.Bar.Height, 87, 87, 87, 255)
            RenderRectangle(CurrentMenu.X + 25 + RageUI.Settings.ItSAMS.Title.Background.Width - BarWidth - Statistics.Bar.Right + CurrentMenu.WidthOffset, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 50, Percent * BarWidth, Statistics.Bar.Height, 255, 255, 255, 255)
            for i = 1, #Statistics.Divider, 1 do
                RenderRectangle((CurrentMenu.X + 25 + RageUI.Settings.ItSAMS.Title.Background.Width - BarWidth - Statistics.Bar.Right) + i * ((BarWidth - (#Statistics.Divider / Statistics.Divider[i].Width)) / (#Statistics.Divider + 1)) + CurrentMenu.WidthOffset, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Divider[i].Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 50, Statistics.Divider[i].Width, Statistics.Divider[i].Height, 0, 0, 0, 255)
            end
            RageUI.StatisticPanelCount = RageUI.StatisticPanelCount + 1
        end
    end
end

function RageUI.StatisticPanelAdvanced(Text, Percent, RGBA1, Percent2, RGBA2, RGBA3, Index)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() and (Index == nil or (CurrentMenu.Index == Index)) then

            RGBA1 = RGBA1 or { 255, 255, 255, 255 }
            local BarWidth = Statistics.Bar.Width + CurrentMenu.WidthOffset * Statistics.Bar.OffsetRatio

            RenderRectangle(CurrentMenu.X, CurrentMenu.Y + Statistics.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + (RageUI.StatisticPanelCount * 42), Statistics.Background.Width + CurrentMenu.WidthOffset, Statistics.Background.Height, 0, 0, 0, 170)
            RenderText(Text or "", CurrentMenu.X + 8.0, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Text.Left.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Statistics.Text.Left.Scale, 245, 245, 245, 255, 0)
            RenderRectangle(CurrentMenu.X + RageUI.Settings.ItSAMS.Title.Background.Width - BarWidth - Statistics.Bar.Right + CurrentMenu.WidthOffset, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, BarWidth, Statistics.Bar.Height, 87, 87, 87, 255)
            RenderRectangle(CurrentMenu.X + RageUI.Settings.ItSAMS.Title.Background.Width - BarWidth - Statistics.Bar.Right + CurrentMenu.WidthOffset, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Percent * BarWidth, Statistics.Bar.Height, RGBA1[1], RGBA1[2], RGBA1[3], RGBA1[4])
            RGBA2 = RGBA2 or { 0, 153, 204, 255 }
            RGBA3 = RGBA3 or { 185, 0, 0, 255 }

            if Percent2 and Percent2 > 0 then
                local X = CurrentMenu.X + RageUI.Settings.ItSAMS.Title.Background.Width - BarWidth - Statistics.Bar.Right + CurrentMenu.WidthOffset + Percent * BarWidth
                RenderRectangle(X, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Percent2 * BarWidth, Statistics.Bar.Height, RGBA2[1], RGBA2[2], RGBA2[3], RGBA2[4])
            elseif Percent2 and Percent2 < 0 then
                local X = CurrentMenu.X + RageUI.Settings.ItSAMS.Title.Background.Width - BarWidth - Statistics.Bar.Right + CurrentMenu.WidthOffset + Percent * BarWidth
                RenderRectangle(X, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Percent2 * BarWidth, Statistics.Bar.Height, RGBA3[1], RGBA3[2], RGBA3[3], RGBA3[4])
            end

            for i = 1, #Statistics.Divider, 1 do
                RenderRectangle((CurrentMenu.X + RageUI.Settings.ItSAMS.Title.Background.Width - BarWidth - Statistics.Bar.Right) + i * ((BarWidth - (#Statistics.Divider / Statistics.Divider[i].Width)) / (#Statistics.Divider + 1)) + CurrentMenu.WidthOffset, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Divider[i].Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Statistics.Divider[i].Width, Statistics.Divider[i].Height, 0, 0, 0, 255)
            end

            RageUI.StatisticPanelCount = RageUI.StatisticPanelCount + 1
        end
    end
end

local Heritage = {
    Background = { Dictionary = "pause_menu_pages_char_mom_dad", Texture = "mumdadbg", Width = 431, Height = 228 },
    Mum = { Dictionary = "char_creator_portraits", X = 25, Width = 228, Height = 228 },
    Dad = { Dictionary = "char_creator_portraits", X = 195, Width = 228, Height = 228 },
}

function RageUI.Window.Heritage(Mum, Dad)
    local CurrentMenu = RageUI.CurrentMenu;
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            if Mum < 0 or Mum > 21 then
                Mum = 0
            end
            if Dad < 0 or Dad > 23 then
                Dad = 0
            end
            if Mum == 21 then
                Mum = "special_female_" .. (tonumber(string.sub(Mum, 2, 2)) - 1)
            else
                Mum = "female_" .. Mum
            end
            if Dad >= 21 then
                Dad = "special_male_" .. (tonumber(string.sub(Dad, 2, 2)) - 1)
            else
                Dad = "male_" .. Dad
            end
            RenderSprite(Heritage.Background.Dictionary, Heritage.Background.Texture, CurrentMenu.X + 25.5, CurrentMenu.Y + CurrentMenu.SubtitleHeight + 40 + RageUI.ItemOffset, Heritage.Background.Width + (CurrentMenu.WidthOffset / 1), Heritage.Background.Height)
            RenderSprite(Heritage.Dad.Dictionary, Dad, CurrentMenu.X + 25.5 + Heritage.Dad.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + CurrentMenu.SubtitleHeight + 40 + RageUI.ItemOffset, Heritage.Dad.Width, Heritage.Dad.Height)
            RenderSprite(Heritage.Mum.Dictionary, Mum, CurrentMenu.X + 25.5 + Heritage.Mum.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + CurrentMenu.SubtitleHeight + 40 + RageUI.ItemOffset, Heritage.Mum.Width, Heritage.Mum.Height)
            RageUI.ItemOffset = RageUI.ItemOffset + Heritage.Background.Height
        end
    end
end