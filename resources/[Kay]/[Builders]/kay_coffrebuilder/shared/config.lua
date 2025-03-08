Config = {}

Config.option = {
    trad = "fr", -- Langue de Traduction
    esxGetter = "esx:getSharedObject", -- Trigger ESX
    identifierType = 1, -- 1 - Steam / 2 - Fivem
    getAllowed = { -- Si identifierType = 1 alors il faut mettre votre steam hex / Si identifierType = 2 alors il faut mettre votre license rockstar
        ["license:8f181d9ed17e4d3c6bdbf74a77fd6b5ff2cc0ee2"] = true, -- kay
    },
    marker = { -- Option sur le marker
        markerType = 25, -- Type du marker
        markerColor = {255, 255, 255, 0}, -- Couleur du marker
    },
}

Config.traduction = { -- Tous les Texts du script
    ["FR"] = { -- Langue
        -- MENU --
        ["menu_name"] = "",
        ["menu_desc"] = "Coffre builder",
        ["menu_coffre_name"] = "",
        ["menu_coffre_desc"] = "Gestion coffre !",
        ["separator_coffre_name"] = "",
        ["rightlabel_total"] = "[%s]",
        ["separator_capacity_coffre"] = "Capacité : %s/%s",
        ["button_deposit_item_name"] = "  Déposer un item",
        ["button_deposit_item_name_desc"] = "Information : Déposer un item sur vous dans le coffre !",
        ["button_recup_item_name"] = "  Récupérer un item",
        ["button_recup_item_name_desc"] = "Information : Récupérer un item du coffre pour vous !",
        ["button_deposit_weapon_name"] = "  Déposer une arme",
        ["button_deposit_weapon_name_desc"] = "Information : Déposer une arme sur vous dans le coffre !",
        ["button_recup_weapon_name"] = "  Récupérer une arme",
        ["button_recup_weapon_name_desc"] = "Information : Récupérer une arme du coffre pour vous !",
        ["button_deposit_item_selected_name"] = "  %s",
        ["separator_desc_menu"] = " Créer un coffre ",
        ["button_coffre_name"] = "  Nom du coffre",
        ["button_pos_name"] = "  Position du coffre",
        ["button_pos_name_desc"] = "Information : Choisir la position du coffre !\nENTRER pour valider !",
        ["button_coffre_name_desc"] = "Information : Nom du coffre visible !",
        ["separator_option"] = " Option coffre ",
        ["checkbox_iventory_name"] = "  Coffre item",
        ["checkbox_iventory_name_desc"] = "Information : Mettre le coffre pour les itSAMS !",
        ["separator_option_item"] = " Option item ",
        ["button_iventory_name"] = "  Addon Inventory",
        ["button_iventory_name_desc"] = "Information : Nom du coffre pour esx_addon_inventory ! \nExample : society_police !",
        ["checkbox_weight_name"] = "  Systeme de poid",
        ["checkbox_weight_name_desc"] = "Information : Ajouter un systeme poid au coffre !",
        ["button_weightvalue_name"] = "  Quanité du coffre",
        ["button_weightvalue_name_desc"] = "Information : Choisir la valeur maxi que le coffre peut contenir en item !",
        ["checkbox_weapons_name"] = "  Coffre arme",
        ["checkbox_weapons_name_desc"] = "Information : Mettre le coffre pour les armes !",
        ["separator_option_weapon"] = " Option arme ",
        ["button_datastore_name"] = "  Datastore",
        ["button_datastore_name_desc"] = "Information : Nom du coffre pour esx_datastore ! \nExample : society_police !",
        ["separator_permission"] = " Permission coffre ",
        ["checkbox_job1_name"] = "Permission sur le JOB 1",
        ["checkbox_job1_name_desc"] = "Information : Ajouter une permission d'accès au coffre en job 1 !",
        ["button_job1_name"] = "Nom du job",
        ["button_job1_name_desc"] = "Information : Nom du job qui aurras accès au coffre !",
        ["checkbox_job2_name"] = "Permission sur le JOB 2",
        ["checkbox_job2_name_desc"] = "Information : Ajouter une permission d'accès au coffre en job 2 !",
        ["button_job2_name"] = "Nom du job 2",
        ["button_job2_name_desc"] = "Information : Nom du job 2 qui aurras accès au coffre !",
        ["button_valid_information"] = "Valider le coffre",
        ["button_not_job"] = "Vous devez selectionner au moin un type de job !",
        ["button_not_job_name"] = "Merci de choisir un nom de job !",
        ["button_not_datastore_name"] = "Nom de datastore non sélectionné !",
        ["button_not_weight"] = "Aucun poid séléctionné !",
        ["button_invalid_weight"] = "Poid du coffre inférieur ou égal à 0 !",
        ["button_not_addoninventory_name"] = "Nom de Addon Inventory non sélectionné !",
        ["button_not_type_selected"] = "Sélectionné un type de rangement !",
        ["button_not_coffre_name"] = "Sélectionné un nom de coffre !",
        ["button_delete_information"] = "Anuller",
        -- MESSAGE -- 
        ["ckeckbox_montant"] = "Motant ?",
        ["define_text"] = "Définir ",
        ["text"] = "Défini",
        ["creation_succes"] = "Création du coffre avec succès !",
        ["message_open_menu"] = "Appuyer sur [E] pour ouvrir le coffre : %s !",
        ["deposit_good"] = "Dépot effectué !",
        ["recup_good"] = "Retrait effectué !",
        -- ERROR --
        ["not_value"] = "Merci de rentrer une valeur !",
        ["item_selected_sup"] = "Quantité invalide !",
        ["not_permission"] = "Vous n'avez pas la permission pour faire cela !",
        ["deposit_not_good"] = "Vous n'avez pas autant d'item !",
        ["recup_not_good"] = "Il n'y a pas autant d'item !",
        ["recup_not_good_player_weapon"] = "Vous possèder déjà l'arme !",
        ["addoniventory_exist"] = "Le Addon Iventory choisi exist déjà !\nCréation effectué quand même !",
        ["datastore_exist"] = "Le Datastore choisi exist déjà !\nCréation effectué quand même !",
    },
}

function traduction(text)
    return (Config.traduction[Config.option.trad:upper()][text:lower()] or "[invalid_traduction]")
end
