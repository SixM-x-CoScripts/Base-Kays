function kayscoreDrugs:updateDrugs(drugsName, data)
    if not drugsName then return end
    if not data then return end
    if type(data) ~= "table" then return end

    secured_TriggerServerEvent('kayscore:admin:drugs:update', drugsName, data)
end

secured_RegisterNetEvent('kayscore:admin:drugs:update', function(drugsName, data)
    if not drugsName then return end
    if not data then return end
    if type(data) ~= "table" then return end

    for k,v in pairs(data) do
        if v.name == drugsName then
            kayscoreDrugs.Drugs[v.name] = {
                ["recolte"] = v.position.recolte,
                ["traitement"] = v.position.traitement
            }
            kayscoreDrugs.Items[v.name] = {
                ["recolte"] = {
                    name = v.data.recolte.name,
                    label = v.data.recolte.label,
                    animtype = v.data.recolte.animtype,
                    animdict = v.data.recolte.animdict,
                    anim = v.data.recolte.anim,
                    animtime = v.data.recolte.animtime,
                    marker = v.data.recolte.marker,
                    props = v.data.recolte.props
                },
                ["traitement"] = {
                    name = v.data.traitement.name,
                    label = v.data.traitement.label,
                    animtype = v.data.traitement.animtype,
                    animdict = v.data.traitement.animdict,
                    anim = v.data.traitement.anim,
                    animtime = v.data.traitement.animtime,
                    marker = v.data.traitement.marker,
                    props = v.data.traitement.props
                }
            }
        end
    end
end)

secured_RegisterNetEvent('kayscore:admin:drugs:sendSell', function(table)
    kayscoreDrugs.sell.Position = table
end)