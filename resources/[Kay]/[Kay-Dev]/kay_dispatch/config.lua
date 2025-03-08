Config = {

	Sprite = { -- Vehicle blip sprite by class
		[0] = 225,
		[1] = 225,
		[2] = 225,
		[3] = 225,
		[4] = 225,
		[5] = 225,
		[6] = 225,
		[7] = 225,
		[8] = 226,
		[9] = 225,
		[10] = 67,
		[11] = 67,
		[12] = 67,
		[13] = 226,
		[14] = 410,
		[15] = 422,
		[16] = 423,
		[17] = 225,
		[18] = 225,
		[19] = 225,
		[20] = 67,
		[22] = 1
	},

	Icons = { -- Vehicle icon by class
		[0] = 'fa-car',
		[1] = 'fa-car',
		[2] = 'fa-car',
		[3] = 'fa-car',
		[4] = 'fa-car',
		[5] = 'fa-car',
		[6] = 'fa-car',
		[7] = 'fa-car',
		[8] = 'fa-motorcycle',
		[9] = 'fa-car',
		[10] = 'fa-truck',
		[11] = 'fa-truck',
		[12] = 'fa-truck',
		[13] = 'fa-bicycle',
		[14] = 'fa-ship',
		[15] = 'fa-helicopter',
		[16] = 'fa-plane',
		[17] = 'fa-car',
		[18] = 'fa-car',
		[19] = 'fa-car',
		[20] = 'fa-truck',
		[22] = 'fa-running'
	},

	OpenMenuKey = 'F9', -- Key to open the dispatch menu (Leave blank if you dont need a key)

	EnableUnitArrivalNotice = true, -- Give player notice that the unit is arriving to them! (Triggered when any unit accepts the call)

	callCommandSprite = 280, -- Blip sprite when player calls using command
	callCommandColor = 57, -- Blip color when player calls using command

	EnableMapBlipsForUnits = true, -- Shows units in their vehicles on the map
	AddCallBlips = true, -- Adds blips for calls that disappear over time
	CallBlipDisappearInterval = 500, -- The higher value longer they will stay on the map

	EnableShootingAlerts = true, -- Alerts when citizens shoot in shooting zones
	ShootingZones = { -- Zones where citizens shooting gives police an alert
		{coords = vector3(-20.188398361206,6629.5073242188,30.817811965942), radius = 400.0}
	}, 

	-- You can have 3 jobs that can interact with the dispatch and 
	-- canRequestLocalBackup - This is for requesting backup/help from same job as yours
	-- canRequestOtherJobBackup - This is for requesting backup/help from other jobs too
	-- forwardCall - This will allow you to forward your jobs call to other jobs
	-- callCommand - Command to make a call in dispatch (You can also use triggers and make phone funcionallity or smth)
	-- color - This is the color of units! this is a css class if you dont know what are you doing dont change
	-- label - Label of the job
	JobOne = {job = 'police', canRequestLocalBackup = true, canRequestOtherJobBackup = true, forwardCall = true, canRemoveCall = true, callCommand = "911", color = "blueunit", label = "SASP SUD -", blipColor = 26 },
	JobTwo = {job = 'ambulance', canRequestLocalBackup = true, canRequestOtherJobBackup = true, forwardCall = true, canRemoveCall = true, callCommand = "103", color = "redunit", label = "SAMS",  blipColor = 1 },
	JobThree = {job = 'sheriff', canRequestLocalBackup = true, canRequestOtherJobBackup = true, forwardCall = true, canRemoveCall = true, callCommand = "911", color = "grayunit", label = "SASP Nord",  blipColor = 39 },

	Text = {

	['call_removed'] = 'L\'appel a été supprimé',
	['backup_requested'] = 'Backup demandée',
	['call_forwarded'] = 'Appel transféré',
	['someone_is_reacting'] = 'L\'unité arrive à votre emplacement !',
	['offduty'] = 'Le repos n\'est pas configuré !',
	['alerts_turned_off'] = 'Alertes désactivées !',
	['alerts_turned_on'] = 'Alertes activées !',
	['phone_number_copied'] = 'Numéro de téléphone copié',
	['unit_blips_turned_on'] = 'Les unités sont maintenant affichées',
	['unit_blips_turned_off'] = 'Les unités sont désormais masquées',
	['call_blips_turned_on'] = 'Blips d\'appel affichés',
	['call_blips_turned_off'] = 'Blips d\'appel masqués',
	['callsign_changed'] = 'Nom de patrouille changé',
	['no_permission'] = 'Vous n\'avez pas les autorisations!',
	['callsign_char_long'] = 'Trop de personnages ! 3 maximum',
	['accepted'] = 'Appel accepté',
	['active_units_error'] = 'Impossible de supprimer un appel avec des unités actives',
	['cant_accept_call'] = 'Je ne peux pas accepter l\'appel car il a été supprimé'

}
}

-- Function called when you press power off button
function ToggleDuty() 
	SendTextMessage(Config.Text['offduty'])
end

function SendTextMessage(msg)
    ESX.ShowAdvancedNotification(
        "",   -- Titre vide
        "",   -- Sujet vide
        msg,  -- Le message à afficher
        "",   -- Icône vide
        timeout,  -- Temps (en millisecondes)
        ""    -- Icône vide
    )
end