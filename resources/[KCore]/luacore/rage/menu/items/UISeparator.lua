---@type table
local SettingsButton = {
    Rectangle = { Y = 0, Width = 431, Height = 38 },
    Text = { X = 110, Y = 3, Scale = 0.50 },
}

function RageUI.Separator(Label)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            local Option = RageUI.Options + 1
            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then
                if (Label ~= nil) then
                    if MoroConfigServ then
                        RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + (CurrentMenu.WidthOffset * 2.5 ~= 0 and CurrentMenu.WidthOffset * 2.5 or 200), CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 1, SettingsButton.Text.Scale, MoroConfigServ.R, MoroConfigServ.G, MoroConfigServ.B, MoroConfigServ.A, 1)
                    end
                end
                RageUI.ItemOffset = RageUI.ItemOffset + SettingsButton.Rectangle.Height
                if (CurrentMenu.Index == Option) then
                    if (RageUI.LastControl) then
                        CurrentMenu.Index = Option - 1
                        if (CurrentMenu.Index < 1) then
                            CurrentMenu.Index = 1
                        end
                    end
                end
            end
            RageUI.Options = RageUI.Options + 1
        end
    end
end