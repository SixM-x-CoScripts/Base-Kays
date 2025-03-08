function RageUI.Info(Title, RightText, LeftText)
    local LineCount = #RightText >= #LeftText and #RightText or #LeftText
    local textSize = 0.12 -- Réduire la taille de la police
    if Title ~= nil then
        RenderText("~h~" .. Title .. "~h~", 420 + 20 + 100, 5, 0, textSize, 255, 255, 255, 255, 0)
    end
    if RightText ~= nil then
        RenderText(table.concat(RightText == nil and 'Invalide' or RightText, "\n"), 432 + 20 + 100, Title ~= nil and 37 or 5, 0, 0.5, 255, 255, 255, 255, 0)
    end
    if LeftText ~= nil then
        RenderText(table.concat(LeftText == nil and 'Invalide' or LeftText, "\n"), 432 + 432 + 100, Title ~= nil and 37 or 5, 0, textSize, 255, 255, 255, 255, 2)
    end
    RenderRectangle(432 + 10 + 100, 0, 432, Title ~= nil and 50 + (LineCount * 20) or ((LineCount + 1) * 20), 0, 0, 0, 160)
end


function RageUI.INFOVEHICLE(Title, RightText, LeftText)
    local LineCount = #RightText >= #LeftText and #RightText or #LeftText
    if Title ~= nil then
        RenderText("~h~" .. Title .. "~h~", 432 + 20 + 100, 118, 0, 0.15, 255, 255, 255, 255, 0)
    end
    if RightText ~= nil then
        RenderText(table.concat(RightText == nil and 'Invalide' or RightText, "\n"), 432 + 20 + 100, Title ~= nil and 143 or 7, 0, 0.15, 255, 255, 255, 255, 0)
    end
    if LeftText ~= nil then
        RenderText(table.concat(LeftText == nil and 'Invalide' or LeftText, "\n"), 432 + 432 + 100, Title ~= nil and 143 or 7, 0, 0.15, 255, 255, 255, 255, 2)
    end
    RenderRectangle(432 + 10 + 100, 120, 432, Title ~= nil and 50 + (LineCount * 20) or ((LineCount + 1) * 20), 0, 0, 0, 160)
end

function RageUI.Test(value)
    if value == 'NON' then
        RenderRectangle(432 + 10 + 100, 115, 432, 5, 255, 0, 0, 160)
    else
        RenderRectangle(432 + 10 + 100, 115, 432, 5, 0, 255, 0, 160)
    end
end

function RageUI.InfoReport(Title, RightText, LeftText)
    local LineCount = #RightText >= #LeftText and #RightText or #LeftText
    if Title ~= nil then
        RenderText("~h~" .. Title .. "~h~", 420 + 20 + 100, 5, 0, 0.15, 255, 255, 255, 255, 0)
    end
    if RightText ~= nil then
        RenderText(table.concat(RightText == nil and 'Invalide' or RightText, "\n"), 432 + 20 + 100, Title ~= nil and 37 or 5, 0, 0.15, 255, 255, 255, 255, 0)
    end
    if LeftText ~= nil then
        RenderText(table.concat(LeftText == nil and 'Invalide' or LeftText, "\n"), 432 + 432 + 100, Title ~= nil and 37 or 5, 0, 0.15, 255, 255, 255, 255, 2)
    end
    RenderRectangle(432 + 10 + 100, 0, 432, Title ~= nil and 50 + (LineCount * 20) or ((LineCount + 1) * 20), 0, 0, 0, 160)
end