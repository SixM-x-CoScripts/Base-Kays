
Config.Weapons = {
	-- Melee
	{ name = 'WEAPON_DAGGER',    label = _U("weapon_dagger"),    components = {} },
	{ name = 'WEAPON_BAT',       label = _U("weapon_bat"),       components = {} },
	{ name = 'WEAPON_BATTLEAXE', label = _U("weapon_battleaxe"), components = {} },
	{
		name = 'WEAPON_KNUCKLE',
		label = _U("weapon_knuckle"),
		components = {
			{ name = 'knuckle_base',    label = _U("component_knuckle_base"),    hash = `COMPONENT_KNUCKLE_VARMOD_BASE` },
			{ name = 'knuckle_pimp',    label = _U("component_knuckle_pimp"),    hash = `COMPONENT_KNUCKLE_VARMOD_PIMP` },
			{ name = 'knuckle_ballas',  label = _U("component_knuckle_ballas"),  hash = `COMPONENT_KNUCKLE_VARMOD_BALLAS` },
			{ name = 'knuckle_dollar',  label = _U("component_knuckle_dollar"),  hash = `COMPONENT_KNUCKLE_VARMOD_DOLLAR` },
			{ name = 'knuckle_diamond', label = _U("component_knuckle_diamond"), hash = `COMPONENT_KNUCKLE_VARMOD_DIAMOND` },
			{ name = 'knuckle_hate',    label = _U("component_knuckle_hate"),    hash = `COMPONENT_KNUCKLE_VARMOD_HATE` },
			{ name = 'knuckle_love',    label = _U("component_knuckle_love"),    hash = `COMPONENT_KNUCKLE_VARMOD_LOVE` },
			{ name = 'knuckle_player',  label = _U("component_knuckle_player"),  hash = `COMPONENT_KNUCKLE_VARMOD_PLAYER` },
			{ name = 'knuckle_king',    label = _U("component_knuckle_king"),    hash = `COMPONENT_KNUCKLE_VARMOD_KING` },
			{ name = 'knuckle_vagos',   label = _U("component_knuckle_vagos"),   hash = `COMPONENT_KNUCKLE_VARMOD_VAGOS` }
		}
	},
	{ name = 'WEAPON_BOTTLE',        label = _U("weapon_bottle"),        components = {} },
	{ name = 'WEAPON_CROWBAR',       label = _U("weapon_crowbar"),       components = {} },
	{ name = 'WEAPON_FLASHLIGHT',    label = _U("weapon_flashlight"),    components = {} },
	{ name = 'WEAPON_GOLFCLUB',      label = _U("weapon_golfclub"),      components = {} },
	{ name = 'WEAPON_HAMMER',        label = _U("weapon_hammer"),        components = {} },
	{ name = 'WEAPON_HATCHET',       label = _U("weapon_hatchet"),       components = {} },
	{ name = 'WEAPON_KNIFE',         label = _U("weapon_knife"),         components = {} },
	{ name = 'WEAPON_MACHETE',       label = _U("weapon_machete"),       components = {} },
	{ name = 'WEAPON_NIGHTSTICK',    label = _U("weapon_nightstick"),    components = {} },
	{ name = 'WEAPON_WRENCH',        label = _U("weapon_wrench"),        components = {} },
	{ name = 'WEAPON_POOLCUE',       label = _U("weapon_poolcue"),       components = {} },
	{ name = 'WEAPON_STONE_HATCHET', label = _U("weapon_stone_hatchet"), components = {} },
	{
		name = 'WEAPON_SWITCHBLADE',
		label = _U("weapon_switchblade"),
		components = {
			{ name = 'handle_default',   label = _U("component_handle_default"),   hash = `COMPONENT_SWITCHBLADE_VARMOD_BASE` },
			{ name = 'handle_vip',       label = _U("component_handle_vip"),       hash = `COMPONENT_SWITCHBLADE_VARMOD_VAR1` },
			{ name = 'handle_bodyguard', label = _U("component_handle_bodyguard"), hash = `COMPONENT_SWITCHBLADE_VARMOD_VAR2` }
		}
	},
	-- Handguns
	{
		name = 'WEAPON_APPISTOL',
		label = _U("weapon_appistol"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_PISTOL` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_APPISTOL_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_APPISTOL_CLIP_02` },
			{ name = 'flashlight',    label = _U("component_flashlight"),    hash = `COMPONENT_AT_PI_FLSH` },
			{ name = 'suppressor',    label = _U("component_suppressor"),    hash = `COMPONENT_AT_PI_SUPP` },
			{ name = 'luxary_finish', label = _U("component_luxary_finish"), hash = `COMPONENT_APPISTOL_VARMOD_LUXE` }
		}
	},
	{ name = 'WEAPON_CERAMICPISTOL', label = _U("weapon_ceramicpistol"), tints = Config.DefaultWeaponTints, components = {}, ammo = { label = _U("ammo_rounds"), hash = `AMMO_PISTOL` } },
	{
		name = 'WEAPON_COMBATPISTOL',
		label = _U("weapon_combatpistol"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_PISTOL` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_COMBATPISTOL_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_COMBATPISTOL_CLIP_02` },
			{ name = 'flashlight',    label = _U("component_flashlight"),    hash = `COMPONENT_AT_PI_FLSH` },
			{ name = 'suppressor',    label = _U("component_suppressor"),    hash = `COMPONENT_AT_PI_SUPP` },
			{ name = 'luxary_finish', label = _U("component_luxary_finish"), hash = `COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER` }
		}
	},
	{ name = 'WEAPON_DOUBLEACTION',  label = _U("weapon_doubleaction"),  tints = Config.DefaultWeaponTints, components = {}, ammo = { label = _U("ammo_rounds"), hash = `AMMO_PISTOL` } },
	{ name = 'WEAPON_NAVYREVOLVER',  label = _U("weapon_navyrevolver"),  tints = Config.DefaultWeaponTints, components = {}, ammo = { label = _U("ammo_rounds"), hash = `AMMO_PISTOL` } },
	{ name = 'WEAPON_FLAREGUN',      label = _U("weapon_flaregun"),      tints = Config.DefaultWeaponTints, components = {}, ammo = { label = _U("ammo_flaregun"), hash = `AMMO_FLAREGUN` } },
	{ name = 'WEAPON_GADGETPISTOL',  label = _U("weapon_gadgetpistol"),  tints = Config.DefaultWeaponTints, components = {}, ammo = { label = _U("ammo_rounds"), hash = `AMMO_PISTOL` } },
	{
		name = 'WEAPON_HEAVYPISTOL',
		label = _U("weapon_heavypistol"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_PISTOL` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_HEAVYPISTOL_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_HEAVYPISTOL_CLIP_02` },
			{ name = 'flashlight',    label = _U("component_flashlight"),    hash = `COMPONENT_AT_PI_FLSH` },
			{ name = 'suppressor',    label = _U("component_suppressor"),    hash = `COMPONENT_AT_PI_SUPP` },
			{ name = 'luxary_finish', label = _U("component_luxary_finish"), hash = `COMPONENT_HEAVYPISTOL_VARMOD_LUXE` }
		}
	},
	{
		name = 'WEAPON_REVOLVER',
		label = _U("weapon_revolver"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_PISTOL` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',     label = _U("component_clip_default"),     hash = `COMPONENT_REVOLVER_CLIP_01` },
			{ name = 'vip_finish',       label = _U("component_vip_finish"),       hash = `COMPONENT_REVOLVER_VARMOD_BOSS` },
			{ name = 'bodyguard_finish', label = _U("component_bodyguard_finish"), hash = `COMPONENT_REVOLVER_VARMOD_GOON` }
		}
	},
	{
		name = 'WEAPON_REVOLVER_MK2',
		label = _U("weapon_revolver_mk2"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_PISTOL` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',     label = _U("component_clip_default"),     hash = `COMPONENT_REVOLVER_MK2_CLIP_01` },
			{ name = 'ammo_tracer',      label = _U("component_ammo_tracer"),      hash = `COMPONENT_REVOLVER_MK2_CLIP_TRACER` },
			{ name = 'ammo_incendiary',  label = _U("component_ammo_incendiary"),  hash = `COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY` },
			{ name = 'ammo_hollowpoint', label = _U("component_ammo_hollowpoint"), hash = `COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT` },
			{ name = 'ammo_fmj',         label = _U("component_ammo_fmj"),         hash = `COMPONENT_REVOLVER_MK2_CLIP_FMJ` },
			{ name = 'scope_holo',       label = _U("component_scope_holo"),       hash = `COMPONENT_AT_SIGHTS` },
			{ name = 'scope_small',      label = _U("component_ammo_fmj"),         hash = `COMPONENT_AT_SCOPE_MACRO_MK2` },
			{ name = 'flashlight',       label = _U("component_flashlight"),       hash = `COMPONENT_AT_PI_FLSH` },
			{ name = 'compensator',      label = _U("component_compensator"),      hash = `COMPONENT_AT_PI_COMP_03` },
			{ name = 'camo_finish',      label = _U("component_camo_finish"),      hash = `COMPONENT_REVOLVER_MK2_CAMO` },
			{ name = 'camo_finish2',     label = _U("component_camo_finish2"),     hash = `COMPONENT_REVOLVER_MK2_CAMO_02` },
			{ name = 'camo_finish3',     label = _U("component_camo_finish3"),     hash = `COMPONENT_REVOLVER_MK2_CAMO_03` },
			{ name = 'camo_finish4',     label = _U("component_camo_finish4"),     hash = `COMPONENT_REVOLVER_MK2_CAMO_04` },
			{ name = 'camo_finish5',     label = _U("component_camo_finish5"),     hash = `COMPONENT_REVOLVER_MK2_CAMO_05` },
			{ name = 'camo_finish6',     label = _U("component_camo_finish6"),     hash = `COMPONENT_REVOLVER_MK2_CAMO_06` },
			{ name = 'camo_finish7',     label = _U("component_camo_finish7"),     hash = `COMPONENT_REVOLVER_MK2_CAMO_07` },
			{ name = 'camo_finish8',     label = _U("component_camo_finish8"),     hash = `COMPONENT_REVOLVER_MK2_CAMO_08` },
			{ name = 'camo_finish9',     label = _U("component_camo_finish9"),     hash = `COMPONENT_REVOLVER_MK2_CAMO_09` },
			{ name = 'camo_finish10',    label = _U("component_camo_finish10"),    hash = `COMPONENT_REVOLVER_MK2_CAMO_10` },
			{ name = 'camo_finish11',    label = _U("component_camo_finish11"),    hash = `COMPONENT_REVOLVER_MK2_CAMO_IND_01` }
		}
	},
	{ name = 'WEAPON_MARKSMANPISTOL', label = _U("weapon_marksmanpistol"), tints = Config.DefaultWeaponTints, components = {}, ammo = { label = _U("ammo_rounds"), hash = `AMMO_PISTOL` } },
	{
		name = 'WEAPON_PISTOL',
		label = _U("weapon_pistol"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_PISTOL` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_PISTOL_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_PISTOL_CLIP_02` },
			{ name = 'flashlight',    label = _U("component_flashlight"),    hash = `COMPONENT_AT_PI_FLSH` },
			{ name = 'suppressor',    label = _U("component_suppressor"),    hash = `COMPONENT_AT_PI_SUPP_02` },
			{ name = 'luxary_finish', label = _U("component_luxary_finish"), hash = `COMPONENT_PISTOL_VARMOD_LUXE` }
		}
	},
	{
		name = 'WEAPON_PISTOL_MK2',
		label = _U("weapon_pistol_mk2"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_PISTOL` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',        label = _U("component_clip_default"),        hash = `COMPONENT_PISTOL_MK2_CLIP_01` },
			{ name = 'clip_extended',       label = _U("component_clip_extended"),       hash = `COMPONENT_PISTOL_MK2_CLIP_02` },
			{ name = 'ammo_tracer',         label = _U("component_ammo_tracer"),         hash = `COMPONENT_PISTOL_MK2_CLIP_TRACER` },
			{ name = 'ammo_incendiary',     label = _U("component_ammo_incendiary"),     hash = `COMPONENT_PISTOL_MK2_CLIP_INCENDIARY` },
			{ name = 'ammo_hollowpoint',    label = _U("component_ammo_hollowpoint"),    hash = `COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT` },
			{ name = 'ammo_fmj',            label = _U("component_ammo_fmj"),            hash = `COMPONENT_PISTOL_MK2_CLIP_FMJ` },
			{ name = 'scope',               label = _U("component_scope"),               hash = `COMPONENT_AT_PI_RAIL` },
			{ name = 'flashlight',          label = _U("component_flashlight"),          hash = `COMPONENT_AT_PI_FLSH_02` },
			{ name = 'suppressor',          label = _U("component_suppressor"),          hash = `COMPONENT_AT_PI_SUPP_02` },
			{ name = 'compensator',         label = _U("component_suppressor"),          hash = `COMPONENT_AT_PI_COMP` },
			{ name = 'camo_finish',         label = _U("component_camo_finish"),         hash = `COMPONENT_PISTOL_MK2_CAMO` },
			{ name = 'camo_finish2',        label = _U("component_camo_finish2"),        hash = `COMPONENT_PISTOL_MK2_CAMO_02` },
			{ name = 'camo_finish3',        label = _U("component_camo_finish3"),        hash = `COMPONENT_PISTOL_MK2_CAMO_03` },
			{ name = 'camo_finish4',        label = _U("component_camo_finish4"),        hash = `COMPONENT_PISTOL_MK2_CAMO_04` },
			{ name = 'camo_finish5',        label = _U("component_camo_finish5"),        hash = `COMPONENT_PISTOL_MK2_CAMO_05` },
			{ name = 'camo_finish6',        label = _U("component_camo_finish6"),        hash = `COMPONENT_PISTOL_MK2_CAMO_06` },
			{ name = 'camo_finish7',        label = _U("component_camo_finish7"),        hash = `COMPONENT_PISTOL_MK2_CAMO_07` },
			{ name = 'camo_finish8',        label = _U("component_camo_finish8"),        hash = `COMPONENT_PISTOL_MK2_CAMO_08` },
			{ name = 'camo_finish9',        label = _U("component_camo_finish9"),        hash = `COMPONENT_PISTOL_MK2_CAMO_09` },
			{ name = 'camo_finish10',       label = _U("component_camo_finish10"),       hash = `COMPONENT_PISTOL_MK2_CAMO_10` },
			{ name = 'camo_finish11',       label = _U("component_camo_finish11"),       hash = `COMPONENT_PISTOL_MK2_CAMO_IND_01` },
			{ name = 'camo_sunny_finish',   label = _U("component_camo_sunny_finish"),   hash = `COMPONENT_PISTOL_MK2_CAMO_SLIDE` },
			{ name = 'camo_sunny_finish2',  label = _U("component_camo_sunny_finish2"),  hash = `COMPONENT_PISTOL_MK2_CAMO_02_SLIDE` },
			{ name = 'camo_sunny_finish3',  label = _U("component_camo_sunny_finish3"),  hash = `COMPONENT_PISTOL_MK2_CAMO_03_SLIDE` },
			{ name = 'camo_sunny_finish4',  label = _U("component_camo_sunny_finish4"),  hash = `COMPONENT_PISTOL_MK2_CAMO_04_SLIDE` },
			{ name = 'camo_sunny_finish5',  label = _U("component_camo_sunny_finish5"),  hash = `COMPONENT_PISTOL_MK2_CAMO_05_SLIDE` },
			{ name = 'camo_sunny_finish6',  label = _U("component_camo_sunny_finish6"),  hash = `COMPONENT_PISTOL_MK2_CAMO_06_SLIDE` },
			{ name = 'camo_sunny_finish7',  label = _U("component_camo_sunny_finish7"),  hash = `COMPONENT_PISTOL_MK2_CAMO_07_SLIDE` },
			{ name = 'camo_sunny_finish8',  label = _U("component_camo_sunny_finish8"),  hash = `COMPONENT_PISTOL_MK2_CAMO_08_SLIDE` },
			{ name = 'camo_sunny_finish9',  label = _U("component_camo_sunny_finish9"),  hash = `COMPONENT_PISTOL_MK2_CAMO_09_SLIDE` },
			{ name = 'camo_sunny_finish10', label = _U("component_camo_sunny_finish10"), hash = `COMPONENT_PISTOL_MK2_CAMO_10_SLIDE` },
			{ name = 'camo_sunny_finish11', label = _U("component_camo_sunny_finish11"), hash = `COMPONENT_PISTOL_MK2_CAMO_IND_01_SLIDE` }
		}
	},
	{
		name = 'WEAPON_PISTOL50',
		label = _U("weapon_pistol50"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_PISTOL` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_PISTOL50_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_PISTOL50_CLIP_02` },
			{ name = 'flashlight',    label = _U("component_flashlight"),    hash = `COMPONENT_AT_PI_FLSH` },
			{ name = 'suppressor',    label = _U("component_suppressor"),    hash = `COMPONENT_AT_AR_SUPP_02` },
			{ name = 'luxary_finish', label = _U("component_luxary_finish"), hash = `COMPONENT_PISTOL50_VARMOD_LUXE` }
		}
	},
	{
		name = 'WEAPON_SNSPISTOL',
		label = _U("weapon_snspistol"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_PISTOL` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_SNSPISTOL_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_SNSPISTOL_CLIP_02` },
			{ name = 'luxary_finish', label = _U("component_luxary_finish"), hash = `COMPONENT_SNSPISTOL_VARMOD_LOWRIDER` }
		}
	},
	{
		name = 'WEAPON_SNSPISTOL_MK2',
		label = _U("weapon_snspistol_mk2"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_PISTOL` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',        label = _U("component_clip_default"),        hash = `COMPONENT_SNSPISTOL_MK2_CLIP_01` },
			{ name = 'clip_extended',       label = _U("component_clip_extended"),       hash = `COMPONENT_SNSPISTOL_MK2_CLIP_02` },
			{ name = 'ammo_tracer',         label = _U("component_ammo_tracer"),         hash = `COMPONENT_SNSPISTOL_MK2_CLIP_TRACER` },
			{ name = 'ammo_incendiary',     label = _U("component_ammo_incendiary"),     hash = `COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY` },
			{ name = 'ammo_hollowpoint',    label = _U("component_ammo_hollowpoint"),    hash = `COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT` },
			{ name = 'ammo_fmj',            label = _U("component_ammo_fmj"),            hash = `COMPONENT_SNSPISTOL_MK2_CLIP_FMJ` },
			{ name = 'scope',               label = _U("component_scope"),               hash = `COMPONENT_AT_PI_RAIL_02` },
			{ name = 'flashlight',          label = _U("component_flashlight"),          hash = `COMPONENT_AT_PI_FLSH_03` },
			{ name = 'suppressor',          label = _U("component_suppressor"),          hash = `COMPONENT_AT_PI_SUPP_02` },
			{ name = 'compensator',         label = _U("component_suppressor"),          hash = `COMPONENT_AT_PI_COMP_02` },
			{ name = 'camo_finish',         label = _U("component_camo_finish"),         hash = `COMPONENT_SNSPISTOL_MK2_CAMO` },
			{ name = 'camo_finish2',        label = _U("component_camo_finish2"),        hash = `COMPONENT_SNSPISTOL_MK2_CAMO_02` },
			{ name = 'camo_finish3',        label = _U("component_camo_finish3"),        hash = `COMPONENT_SNSPISTOL_MK2_CAMO_03` },
			{ name = 'camo_finish4',        label = _U("component_camo_finish4"),        hash = `COMPONENT_SNSPISTOL_MK2_CAMO_04` },
			{ name = 'camo_finish5',        label = _U("component_camo_finish5"),        hash = `COMPONENT_SNSPISTOL_MK2_CAMO_05` },
			{ name = 'camo_finish6',        label = _U("component_camo_finish6"),        hash = `COMPONENT_SNSPISTOL_MK2_CAMO_06` },
			{ name = 'camo_finish7',        label = _U("component_camo_finish7"),        hash = `COMPONENT_SNSPISTOL_MK2_CAMO_07` },
			{ name = 'camo_finish8',        label = _U("component_camo_finish8"),        hash = `COMPONENT_SNSPISTOL_MK2_CAMO_08` },
			{ name = 'camo_finish9',        label = _U("component_camo_finish9"),        hash = `COMPONENT_SNSPISTOL_MK2_CAMO_09` },
			{ name = 'camo_finish10',       label = _U("component_camo_finish10"),       hash = `COMPONENT_SNSPISTOL_MK2_CAMO_10` },
			{ name = 'camo_finish11',       label = _U("component_camo_finish11"),       hash = `COMPONENT_SNSPISTOL_MK2_CAMO_IND_01` },
			{ name = 'camo_sunny_finish',   label = _U("component_camo_sunny_finish"),   hash = `COMPONENT_SNSPISTOL_MK2_CAMO_SLIDE` },
			{ name = 'camo_sunny_finish2',  label = _U("component_camo_sunny_finish2"),  hash = `COMPONENT_SNSPISTOL_MK2_CAMO_02_SLIDE` },
			{ name = 'camo_sunny_finish3',  label = _U("component_camo_sunny_finish3"),  hash = `COMPONENT_SNSPISTOL_MK2_CAMO_03_SLIDE` },
			{ name = 'camo_sunny_finish4',  label = _U("component_camo_sunny_finish4"),  hash = `COMPONENT_SNSPISTOL_MK2_CAMO_04_SLIDE` },
			{ name = 'camo_sunny_finish5',  label = _U("component_camo_sunny_finish5"),  hash = `COMPONENT_SNSPISTOL_MK2_CAMO_05_SLIDE` },
			{ name = 'camo_sunny_finish6',  label = _U("component_camo_sunny_finish6"),  hash = `COMPONENT_SNSPISTOL_MK2_CAMO_06_SLIDE` },
			{ name = 'camo_sunny_finish7',  label = _U("component_camo_sunny_finish7"),  hash = `COMPONENT_SNSPISTOL_MK2_CAMO_07_SLIDE` },
			{ name = 'camo_sunny_finish8',  label = _U("component_camo_sunny_finish8"),  hash = `COMPONENT_SNSPISTOL_MK2_CAMO_08_SLIDE` },
			{ name = 'camo_sunny_finish9',  label = _U("component_camo_sunny_finish9"),  hash = `COMPONENT_SNSPISTOL_MK2_CAMO_09_SLIDE` },
			{ name = 'camo_sunny_finish10', label = _U("component_camo_sunny_finish10"), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_10_SLIDE` },
			{ name = 'camo_sunny_finish11', label = _U("component_camo_sunny_finish11"), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_IND_01_SLIDE` }
		}
	},
	{ name = 'WEAPON_STUNGUN',        label = _U("weapon_stungun"),        tints = Config.DefaultWeaponTints, components = {} },
	{ name = 'WEAPON_RAYPISTOL',      label = _U("weapon_raypistol"),      tints = Config.DefaultWeaponTints, components = {} },
	{
		name = 'WEAPON_VINTAGEPISTOL',
		label = _U("weapon_vintagepistol"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_PISTOL` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_VINTAGEPISTOL_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_VINTAGEPISTOL_CLIP_02` },
			{ name = 'suppressor',    label = _U("component_suppressor"),    hash = `COMPONENT_AT_PI_SUPP` }
		}
	},
	-- Shotguns
	{
		name = 'WEAPON_ASSAULTSHOTGUN',
		label = _U("weapon_assaultshotgun"),
		ammo = { label = _U("ammo_shells"), hash = `AMMO_SHOTGUN` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_ASSAULTSHOTGUN_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_ASSAULTSHOTGUN_CLIP_02` },
			{ name = 'flashlight',    label = _U("component_flashlight"),    hash = `COMPONENT_AT_AR_FLSH` },
			{ name = 'suppressor',    label = _U("component_suppressor"),    hash = `COMPONENT_AT_AR_SUPP` },
			{ name = 'grip',          label = _U("component_grip"),          hash = `COMPONENT_AT_AR_AFGRIP` }
		}
	},
	{ name = 'WEAPON_AUTOSHOTGUN', label = _U("weapon_autoshotgun"), tints = Config.DefaultWeaponTints, components = {}, ammo = { label = _U("ammo_shells"), hash = `AMMO_SHOTGUN` } },
	{
		name = 'WEAPON_BULLPUPSHOTGUN',
		label = _U("weapon_bullpupshotgun"),
		ammo = { label = _U("ammo_shells"), hash = `AMMO_SHOTGUN` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'flashlight', label = _U("component_flashlight"), hash = `COMPONENT_AT_AR_FLSH` },
			{ name = 'suppressor', label = _U("component_suppressor"), hash = `COMPONENT_AT_AR_SUPP_02` },
			{ name = 'grip',       label = _U("component_grip"),       hash = `COMPONENT_AT_AR_AFGRIP` }
		}
	},
	{
		name = 'WEAPON_COMBATSHOTGUN',
		label = _U("weapon_combatshotgun"),
		ammo = { label = _U("ammo_shells"), hash = `AMMO_SHOTGUN` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'flashlight', label = _U("component_flashlight"), hash = `COMPONENT_AT_AR_FLSH` },
			{ name = 'suppressor', label = _U("component_suppressor"), hash = `COMPONENT_AT_AR_SUPP` }
		}
	},
	{ name = 'WEAPON_DBSHOTGUN',   label = _U("weapon_dbshotgun"),   tints = Config.DefaultWeaponTints, components = {}, ammo = { label = _U("ammo_shells"), hash = `AMMO_SHOTGUN` } },
	{
		name = 'WEAPON_HEAVYSHOTGUN',
		label = _U("weapon_heavyshotgun"),
		ammo = { label = _U("ammo_shells"), hash = `AMMO_SHOTGUN` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_HEAVYSHOTGUN_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_HEAVYSHOTGUN_CLIP_02` },
			{ name = 'clip_drum',     label = _U("component_clip_drum"),     hash = `COMPONENT_HEAVYSHOTGUN_CLIP_03` },
			{ name = 'flashlight',    label = _U("component_flashlight"),    hash = `COMPONENT_AT_AR_FLSH` },
			{ name = 'suppressor',    label = _U("component_suppressor"),    hash = `COMPONENT_AT_AR_SUPP_02` },
			{ name = 'grip',          label = _U("component_grip"),          hash = `COMPONENT_AT_AR_AFGRIP` }
		}
	},
	{ name = 'WEAPON_MUSKET',     label = _U("weapon_musket"),     tints = Config.DefaultWeaponTints,                                 components = {},                   ammo = { label = _U("ammo_rounds"), hash = `AMMO_SHOTGUN` } },
	{
		name = 'WEAPON_PUMPSHOTGUN',
		label = _U("weapon_pumpshotgun"),
		ammo = { label = _U("ammo_shells"), hash = `AMMO_SHOTGUN` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'flashlight',    label = _U("component_flashlight"),    hash = `COMPONENT_AT_AR_FLSH` },
			{ name = 'suppressor',    label = _U("component_suppressor"),    hash = `COMPONENT_AT_SR_SUPP` },
			{ name = 'luxary_finish', label = _U("component_luxary_finish"), hash = `COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER` }
		}
	},
	{
		name = 'WEAPON_PUMPSHOTGUN_MK2',
		label = _U("weapon_pumpshotgun_mk2"),
		ammo = { label = _U("ammo_shells"), hash = `AMMO_SHOTGUN` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'shells_default',     label = _U("component_shells_default"),     hash = `COMPONENT_PUMPSHOTGUN_MK2_CLIP_01` },
			{ name = 'shells_incendiary',  label = _U("component_shells_incendiary"),  hash = `COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY` },
			{ name = 'shells_armor',       label = _U("component_shells_armor"),       hash = `COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING` },
			{ name = 'shells_hollowpoint', label = _U("component_shells_hollowpoint"), hash = `COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT` },
			{ name = 'shells_explosive',   label = _U("component_shells_explosive"),   hash = `COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE` },
			{ name = 'scope_holo',         label = _U("component_scope_holo"),         hash = `COMPONENT_AT_SIGHTS` },
			{ name = 'scope_small',        label = _U("component_scope_small"),        hash = `COMPONENT_AT_SCOPE_MACRO_MK2` },
			{ name = 'scope_medium',       label = _U("component_scope_medium"),       hash = `COMPONENT_AT_SCOPE_SMALL_MK2` },
			{ name = 'flashlight',         label = _U("component_flashlight"),         hash = `COMPONENT_AT_AR_FLSH` },
			{ name = 'suppressor',         label = _U("component_suppressor"),         hash = `COMPONENT_AT_SR_SUPP_03` },
			{ name = 'muzzle_squared',     label = _U("component_muzzle_squared"),     hash = `COMPONENT_AT_MUZZLE_08` },
			{ name = 'camo_finish',        label = _U("component_camo_finish"),        hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO` },
			{ name = 'camo_finish2',       label = _U("component_camo_finish2"),       hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_02` },
			{ name = 'camo_finish3',       label = _U("component_camo_finish3"),       hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_03` },
			{ name = 'camo_finish4',       label = _U("component_camo_finish4"),       hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_04` },
			{ name = 'camo_finish5',       label = _U("component_camo_finish5"),       hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_05` },
			{ name = 'camo_finish6',       label = _U("component_camo_finish6"),       hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_06` },
			{ name = 'camo_finish7',       label = _U("component_camo_finish7"),       hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_07` },
			{ name = 'camo_finish8',       label = _U("component_camo_finish8"),       hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_08` },
			{ name = 'camo_finish9',       label = _U("component_camo_finish9"),       hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_09` },
			{ name = 'camo_finish10',      label = _U("component_camo_finish10"),      hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_10` },
			{ name = 'camo_finish11',      label = _U("component_camo_finish11"),      hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_IND_01` }
		}
	},
	{
		name = 'WEAPON_SAWNOFFSHOTGUN',
		label = _U("weapon_sawnoffshotgun"),
		ammo = { label = _U("ammo_shells"), hash = `AMMO_SHOTGUN` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'luxary_finish', label = _U("component_luxary_finish"), hash = `COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE` }
		}
	},
	-- SMG & LMG
	{
		name = 'WEAPON_ASSAULTSMG',
		label = _U("weapon_assaultsmg"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_SMG` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_ASSAULTSMG_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_ASSAULTSMG_CLIP_02` },
			{ name = 'flashlight',    label = _U("component_flashlight"),    hash = `COMPONENT_AT_AR_FLSH` },
			{ name = 'scope',         label = _U("component_scope"),         hash = `COMPONENT_AT_SCOPE_MACRO` },
			{ name = 'suppressor',    label = _U("component_suppressor"),    hash = `COMPONENT_AT_AR_SUPP_02` },
			{ name = 'luxary_finish', label = _U("component_luxary_finish"), hash = `COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER` }
		}
	},
	{
		name = 'WEAPON_COMBATMG',
		label = _U("weapon_combatmg"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_MG` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_COMBATMG_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_COMBATMG_CLIP_02` },
			{ name = 'scope',         label = _U("component_scope"),         hash = `COMPONENT_AT_SCOPE_MEDIUM` },
			{ name = 'grip',          label = _U("component_grip"),          hash = `COMPONENT_AT_AR_AFGRIP` },
			{ name = 'luxary_finish', label = _U("component_luxary_finish"), hash = `COMPONENT_COMBATMG_VARMOD_LOWRIDER` }
		}
	},
	{
		name = 'WEAPON_COMBATMG_MK2',
		label = _U("weapon_combatmg_mk2"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_MG` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',     label = _U("component_clip_default"),     hash = `COMPONENT_COMBATMG_MK2_CLIP_01` },
			{ name = 'clip_extended',    label = _U("component_clip_extended"),    hash = `COMPONENT_COMBATMG_MK2_CLIP_02` },
			{ name = 'ammo_tracer',      label = _U("component_ammo_tracer"),      hash = `COMPONENT_COMBATMG_MK2_CLIP_TRACER` },
			{ name = 'ammo_incendiary',  label = _U("component_ammo_incendiary"),  hash = `COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY` },
			{ name = 'ammo_hollowpoint', label = _U("component_ammo_hollowpoint"), hash = `COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING` },
			{ name = 'ammo_fmj',         label = _U("component_ammo_fmj"),         hash = `COMPONENT_COMBATMG_MK2_CLIP_FMJ` },
			{ name = 'grip',             label = _U("component_grip"),             hash = `COMPONENT_AT_AR_AFGRIP_02` },
			{ name = 'scope_holo',       label = _U("component_scope_holo"),       hash = `COMPONENT_AT_SIGHTS` },
			{ name = 'scope_medium',     label = _U("component_scope_medium"),     hash = `COMPONENT_AT_SCOPE_SMALL_MK2` },
			{ name = 'scope_large',      label = _U("component_scope_large"),      hash = `COMPONENT_AT_SCOPE_MEDIUM_MK2` },
			{ name = 'muzzle_flat',      label = _U("component_muzzle_flat"),      hash = `COMPONENT_AT_MUZZLE_01` },
			{ name = 'muzzle_tactical',  label = _U("component_muzzle_tactical"),  hash = `COMPONENT_AT_MUZZLE_02` },
			{ name = 'muzzle_fat',       label = _U("component_muzzle_fat"),       hash = `COMPONENT_AT_MUZZLE_03` },
			{ name = 'muzzle_precision', label = _U("component_muzzle_precision"), hash = `COMPONENT_AT_MUZZLE_04` },
			{ name = 'muzzle_heavy',     label = _U("component_muzzle_heavy"),     hash = `COMPONENT_AT_MUZZLE_05` },
			{ name = 'muzzle_slanted',   label = _U("component_muzzle_slanted"),   hash = `COMPONENT_AT_MUZZLE_06` },
			{ name = 'muzzle_split',     label = _U("component_muzzle_split"),     hash = `COMPONENT_AT_MUZZLE_07` },
			{ name = 'barrel_default',   label = _U("component_barrel_default"),   hash = `COMPONENT_AT_MG_BARREL_01` },
			{ name = 'barrel_heavy',     label = _U("component_barrel_heavy"),     hash = `COMPONENT_AT_MG_BARREL_02` },
			{ name = 'camo_finish',      label = _U("component_camo_finish"),      hash = `COMPONENT_COMBATMG_MK2_CAMO` },
			{ name = 'camo_finish2',     label = _U("component_camo_finish2"),     hash = `COMPONENT_COMBATMG_MK2_CAMO_02` },
			{ name = 'camo_finish3',     label = _U("component_camo_finish3"),     hash = `COMPONENT_COMBATMG_MK2_CAMO_03` },
			{ name = 'camo_finish4',     label = _U("component_camo_finish4"),     hash = `COMPONENT_COMBATMG_MK2_CAMO_04` },
			{ name = 'camo_finish5',     label = _U("component_camo_finish5"),     hash = `COMPONENT_COMBATMG_MK2_CAMO_05` },
			{ name = 'camo_finish6',     label = _U("component_camo_finish6"),     hash = `COMPONENT_COMBATMG_MK2_CAMO_06` },
			{ name = 'camo_finish7',     label = _U("component_camo_finish7"),     hash = `COMPONENT_COMBATMG_MK2_CAMO_07` },
			{ name = 'camo_finish8',     label = _U("component_camo_finish8"),     hash = `COMPONENT_COMBATMG_MK2_CAMO_08` },
			{ name = 'camo_finish9',     label = _U("component_camo_finish9"),     hash = `COMPONENT_COMBATMG_MK2_CAMO_09` },
			{ name = 'camo_finish10',    label = _U("component_camo_finish10"),    hash = `COMPONENT_COMBATMG_MK2_CAMO_10` },
			{ name = 'camo_finish11',    label = _U("component_camo_finish11"),    hash = `COMPONENT_COMBATMG_MK2_CAMO_IND_01` }
		}
	},
	{
		name = 'WEAPON_COMBATPDW',
		label = _U("weapon_combatpdw"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_SMG` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_COMBATPDW_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_COMBATPDW_CLIP_02` },
			{ name = 'clip_drum',     label = _U("component_clip_drum"),     hash = `COMPONENT_COMBATPDW_CLIP_03` },
			{ name = 'flashlight',    label = _U("component_flashlight"),    hash = `COMPONENT_AT_AR_FLSH` },
			{ name = 'grip',          label = _U("component_grip"),          hash = `COMPONENT_AT_AR_AFGRIP` },
			{ name = 'scope',         label = _U("component_scope"),         hash = `COMPONENT_AT_SCOPE_SMALL` }
		}
	},
	{
		name = 'WEAPON_GUSENBERG',
		label = _U("weapon_gusenberg"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_MG` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_GUSENBERG_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_GUSENBERG_CLIP_02` }
		}
	},
	{
		name = 'WEAPON_MACHINEPISTOL',
		label = _U("weapon_machinepistol"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_PISTOL` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_MACHINEPISTOL_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_MACHINEPISTOL_CLIP_02` },
			{ name = 'clip_drum',     label = _U("component_clip_drum"),     hash = `COMPONENT_MACHINEPISTOL_CLIP_03` },
			{ name = 'suppressor',    label = _U("component_suppressor"),    hash = `COMPONENT_AT_PI_SUPP` }
		}
	},
	{
		name = 'WEAPON_MG',
		label = _U("weapon_mg"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_MG` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_MG_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_MG_CLIP_02` },
			{ name = 'scope',         label = _U("component_scope"),         hash = `COMPONENT_AT_SCOPE_SMALL_02` },
			{ name = 'luxary_finish', label = _U("component_luxary_finish"), hash = `COMPONENT_MG_VARMOD_LOWRIDER` }
		}
	},
	{
		name = 'WEAPON_MICROSMG',
		label = _U("weapon_microsmg"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_SMG` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_MICROSMG_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_MICROSMG_CLIP_02` },
			{ name = 'flashlight',    label = _U("component_flashlight"),    hash = `COMPONENT_AT_PI_FLSH` },
			{ name = 'scope',         label = _U("component_scope"),         hash = `COMPONENT_AT_SCOPE_MACRO` },
			{ name = 'suppressor',    label = _U("component_suppressor"),    hash = `COMPONENT_AT_AR_SUPP_02` },
			{ name = 'luxary_finish', label = _U("component_luxary_finish"), hash = `COMPONENT_MICROSMG_VARMOD_LUXE` }
		}
	},
	{
		name = 'WEAPON_MINISMG',
		label = _U("weapon_minismg"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_SMG` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_MINISMG_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_MINISMG_CLIP_02` }
		}
	},
	{
		name = 'WEAPON_SMG',
		label = _U("weapon_smg"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_SMG` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_SMG_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_SMG_CLIP_02` },
			{ name = 'clip_drum',     label = _U("component_clip_drum"),     hash = `COMPONENT_SMG_CLIP_03` },
			{ name = 'flashlight',    label = _U("component_flashlight"),    hash = `COMPONENT_AT_AR_FLSH` },
			{ name = 'scope',         label = _U("component_scope"),         hash = `COMPONENT_AT_SCOPE_MACRO_02` },
			{ name = 'suppressor',    label = _U("component_suppressor"),    hash = `COMPONENT_AT_PI_SUPP` },
			{ name = 'luxary_finish', label = _U("component_luxary_finish"), hash = `COMPONENT_SMG_VARMOD_LUXE` }
		}
	},
	{
		name = 'WEAPON_SMG_MK2',
		label = _U("weapon_smg_mk2"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_SMG` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',     label = _U("component_clip_default"),     hash = `COMPONENT_SMG_MK2_CLIP_01` },
			{ name = 'clip_extended',    label = _U("component_clip_extended"),    hash = `COMPONENT_SMG_MK2_CLIP_02` },
			{ name = 'ammo_tracer',      label = _U("component_ammo_tracer"),      hash = `COMPONENT_SMG_MK2_CLIP_TRACER` },
			{ name = 'ammo_incendiary',  label = _U("component_ammo_incendiary"),  hash = `COMPONENT_SMG_MK2_CLIP_INCENDIARY` },
			{ name = 'ammo_hollowpoint', label = _U("component_ammo_hollowpoint"), hash = `COMPONENT_SMG_MK2_CLIP_HOLLOWPOINT` },
			{ name = 'ammo_fmj',         label = _U("component_ammo_fmj"),         hash = `COMPONENT_SMG_MK2_CLIP_FMJ` },
			{ name = 'flashlight',       label = _U("component_flashlight"),       hash = `COMPONENT_AT_AR_FLSH` },
			{ name = 'scope_holo',       label = _U("component_scope_holo"),       hash = `COMPONENT_AT_SIGHTS_SMG` },
			{ name = 'scope_small',      label = _U("component_scope_small"),      hash = `COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2` },
			{ name = 'scope_medium',     label = _U("component_scope_medium"),     hash = `COMPONENT_AT_SCOPE_SMALL_SMG_MK2` },
			{ name = 'suppressor',       label = _U("component_suppressor"),       hash = `COMPONENT_AT_PI_SUPP` },
			{ name = 'muzzle_flat',      label = _U("component_muzzle_flat"),      hash = `COMPONENT_AT_MUZZLE_01` },
			{ name = 'muzzle_tactical',  label = _U("component_muzzle_tactical"),  hash = `COMPONENT_AT_MUZZLE_02` },
			{ name = 'muzzle_fat',       label = _U("component_muzzle_fat"),       hash = `COMPONENT_AT_MUZZLE_03` },
			{ name = 'muzzle_precision', label = _U("component_muzzle_precision"), hash = `COMPONENT_AT_MUZZLE_04` },
			{ name = 'muzzle_heavy',     label = _U("component_muzzle_heavy"),     hash = `COMPONENT_AT_MUZZLE_05` },
			{ name = 'muzzle_slanted',   label = _U("component_muzzle_slanted"),   hash = `COMPONENT_AT_MUZZLE_06` },
			{ name = 'muzzle_split',     label = _U("component_muzzle_split"),     hash = `COMPONENT_AT_MUZZLE_07` },
			{ name = 'barrel_default',   label = _U("component_barrel_default"),   hash = `COMPONENT_AT_SB_BARREL_01` },
			{ name = 'barrel_heavy',     label = _U("component_barrel_heavy"),     hash = `COMPONENT_AT_SB_BARREL_02` },
			{ name = 'camo_finish',      label = _U("component_camo_finish"),      hash = `COMPONENT_SMG_MK2_CAMO` },
			{ name = 'camo_finish2',     label = _U("component_camo_finish2"),     hash = `COMPONENT_SMG_MK2_CAMO_02` },
			{ name = 'camo_finish3',     label = _U("component_camo_finish3"),     hash = `COMPONENT_SMG_MK2_CAMO_03` },
			{ name = 'camo_finish4',     label = _U("component_camo_finish4"),     hash = `COMPONENT_SMG_MK2_CAMO_04` },
			{ name = 'camo_finish5',     label = _U("component_camo_finish5"),     hash = `COMPONENT_SMG_MK2_CAMO_05` },
			{ name = 'camo_finish6',     label = _U("component_camo_finish6"),     hash = `COMPONENT_SMG_MK2_CAMO_06` },
			{ name = 'camo_finish7',     label = _U("component_camo_finish7"),     hash = `COMPONENT_SMG_MK2_CAMO_07` },
			{ name = 'camo_finish8',     label = _U("component_camo_finish8"),     hash = `COMPONENT_SMG_MK2_CAMO_08` },
			{ name = 'camo_finish9',     label = _U("component_camo_finish9"),     hash = `COMPONENT_SMG_MK2_CAMO_09` },
			{ name = 'camo_finish10',    label = _U("component_camo_finish10"),    hash = `COMPONENT_SMG_MK2_CAMO_10` },
			{ name = 'camo_finish11',    label = _U("component_camo_finish11"),    hash = `COMPONENT_SMG_MK2_CAMO_IND_01` }
		}
	},
	{ name = 'WEAPON_RAYCARBINE', label = _U("weapon_raycarbine"), ammo = { label = _U("ammo_rounds"), hash = `AMMO_SMG` }, tints = Config.DefaultWeaponTints, components = {} },
	-- Rifles
	{
		name = 'WEAPON_ADVANCEDRIFLE',
		label = _U("weapon_advancedrifle"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_RIFLE` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_ADVANCEDRIFLE_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_ADVANCEDRIFLE_CLIP_02` },
			{ name = 'flashlight',    label = _U("component_flashlight"),    hash = `COMPONENT_AT_AR_FLSH` },
			{ name = 'scope',         label = _U("component_scope"),         hash = `COMPONENT_AT_SCOPE_SMALL` },
			{ name = 'suppressor',    label = _U("component_suppressor"),    hash = `COMPONENT_AT_AR_SUPP` },
			{ name = 'luxary_finish', label = _U("component_luxary_finish"), hash = `COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE` }
		}
	},
	{
		name = 'WEAPON_ASSAULTRIFLE',
		label = _U("weapon_assaultrifle"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_RIFLE` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_ASSAULTRIFLE_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_ASSAULTRIFLE_CLIP_02` },
			{ name = 'clip_drum',     label = _U("component_clip_drum"),     hash = `COMPONENT_ASSAULTRIFLE_CLIP_03` },
			{ name = 'flashlight',    label = _U("component_flashlight"),    hash = `COMPONENT_AT_AR_FLSH` },
			{ name = 'scope',         label = _U("component_scope"),         hash = `COMPONENT_AT_SCOPE_MACRO` },
			{ name = 'suppressor',    label = _U("component_suppressor"),    hash = `COMPONENT_AT_AR_SUPP_02` },
			{ name = 'grip',          label = _U("component_grip"),          hash = `COMPONENT_AT_AR_AFGRIP` },
			{ name = 'luxary_finish', label = _U("component_luxary_finish"), hash = `COMPONENT_ASSAULTRIFLE_VARMOD_LUXE` }
		}
	},
	{
		name = 'WEAPON_ASSAULTRIFLE_MK2',
		label = _U("weapon_assaultrifle_mk2"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_RIFLE` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',     label = _U("component_clip_default"),     hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_01` },
			{ name = 'clip_extended',    label = _U("component_clip_extended"),    hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_02` },
			{ name = 'ammo_tracer',      label = _U("component_ammo_tracer"),      hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER` },
			{ name = 'ammo_incendiary',  label = _U("component_ammo_incendiary"),  hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY` },
			{ name = 'ammo_armor',       label = _U("component_ammo_armor"),       hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING` },
			{ name = 'ammo_fmj',         label = _U("component_ammo_fmj"),         hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ` },
			{ name = 'grip',             label = _U("component_grip"),             hash = `COMPONENT_AT_AR_AFGRIP_02` },
			{ name = 'flashlight',       label = _U("component_flashlight"),       hash = `COMPONENT_AT_AR_FLSH` },
			{ name = 'scope_holo',       label = _U("component_scope_holo"),       hash = `COMPONENT_AT_SIGHTS` },
			{ name = 'scope_small',      label = _U("component_scope_small"),      hash = `COMPONENT_AT_SCOPE_MACRO_MK2` },
			{ name = 'scope_large',      label = _U("component_scope_large"),      hash = `COMPONENT_AT_SCOPE_MEDIUM_MK2` },
			{ name = 'suppressor',       label = _U("component_suppressor"),       hash = `COMPONENT_AT_AR_SUPP_02` },
			{ name = 'muzzle_flat',      label = _U("component_muzzle_flat"),      hash = `COMPONENT_AT_MUZZLE_01` },
			{ name = 'muzzle_tactical',  label = _U("component_muzzle_tactical"),  hash = `COMPONENT_AT_MUZZLE_02` },
			{ name = 'muzzle_fat',       label = _U("component_muzzle_fat"),       hash = `COMPONENT_AT_MUZZLE_03` },
			{ name = 'muzzle_precision', label = _U("component_muzzle_precision"), hash = `COMPONENT_AT_MUZZLE_04` },
			{ name = 'muzzle_heavy',     label = _U("component_muzzle_heavy"),     hash = `COMPONENT_AT_MUZZLE_05` },
			{ name = 'muzzle_slanted',   label = _U("component_muzzle_slanted"),   hash = `COMPONENT_AT_MUZZLE_06` },
			{ name = 'muzzle_split',     label = _U("component_muzzle_split"),     hash = `COMPONENT_AT_MUZZLE_07` },
			{ name = 'barrel_default',   label = _U("component_barrel_default"),   hash = `COMPONENT_AT_AR_BARREL_01` },
			{ name = 'barrel_heavy',     label = _U("component_barrel_heavy"),     hash = `COMPONENT_AT_AR_BARREL_02` },
			{ name = 'camo_finish',      label = _U("component_camo_finish"),      hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO` },
			{ name = 'camo_finish2',     label = _U("component_camo_finish2"),     hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_02` },
			{ name = 'camo_finish3',     label = _U("component_camo_finish3"),     hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_03` },
			{ name = 'camo_finish4',     label = _U("component_camo_finish4"),     hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_04` },
			{ name = 'camo_finish5',     label = _U("component_camo_finish5"),     hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_05` },
			{ name = 'camo_finish6',     label = _U("component_camo_finish6"),     hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_06` },
			{ name = 'camo_finish7',     label = _U("component_camo_finish7"),     hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_07` },
			{ name = 'camo_finish8',     label = _U("component_camo_finish8"),     hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_08` },
			{ name = 'camo_finish9',     label = _U("component_camo_finish9"),     hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_09` },
			{ name = 'camo_finish10',    label = _U("component_camo_finish10"),    hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_10` },
			{ name = 'camo_finish11',    label = _U("component_camo_finish11"),    hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_IND_01` }
		}
	},
	{
		name = 'WEAPON_BULLPUPRIFLE',
		label = _U("weapon_bullpuprifle"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_RIFLE` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_BULLPUPRIFLE_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_BULLPUPRIFLE_CLIP_02` },
			{ name = 'flashlight',    label = _U("component_flashlight"),    hash = `COMPONENT_AT_AR_FLSH` },
			{ name = 'scope',         label = _U("component_scope"),         hash = `COMPONENT_AT_SCOPE_SMALL` },
			{ name = 'suppressor',    label = _U("component_suppressor"),    hash = `COMPONENT_AT_AR_SUPP` },
			{ name = 'grip',          label = _U("component_grip"),          hash = `COMPONENT_AT_AR_AFGRIP` },
			{ name = 'luxary_finish', label = _U("component_luxary_finish"), hash = `COMPONENT_BULLPUPRIFLE_VARMOD_LOW` }
		}
	},
	{
		name = 'WEAPON_BULLPUPRIFLE_MK2',
		label = _U("weapon_bullpuprifle_mk2"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_RIFLE` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',     label = _U("component_clip_default"),     hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_01` },
			{ name = 'clip_extended',    label = _U("component_clip_extended"),    hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_02` },
			{ name = 'ammo_tracer',      label = _U("component_ammo_tracer"),      hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER` },
			{ name = 'ammo_incendiary',  label = _U("component_ammo_incendiary"),  hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY` },
			{ name = 'ammo_armor',       label = _U("component_ammo_armor"),       hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING` },
			{ name = 'ammo_fmj',         label = _U("component_ammo_fmj"),         hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ` },
			{ name = 'flashlight',       label = _U("component_flashlight"),       hash = `COMPONENT_AT_AR_FLSH` },
			{ name = 'scope_holo',       label = _U("component_scope_holo"),       hash = `COMPONENT_AT_SIGHTS` },
			{ name = 'scope_small',      label = _U("component_scope_small"),      hash = `COMPONENT_AT_SCOPE_MACRO_02_MK2` },
			{ name = 'scope_medium',     label = _U("component_scope_medium"),     hash = `COMPONENT_AT_SCOPE_SMALL_MK2` },
			{ name = 'barrel_default',   label = _U("component_barrel_default"),   hash = `COMPONENT_AT_BP_BARREL_01` },
			{ name = 'barrel_heavy',     label = _U("component_barrel_heavy"),     hash = `COMPONENT_AT_BP_BARREL_02` },
			{ name = 'suppressor',       label = _U("component_suppressor"),       hash = `COMPONENT_AT_AR_SUPP` },
			{ name = 'muzzle_flat',      label = _U("component_muzzle_flat"),      hash = `COMPONENT_AT_MUZZLE_01` },
			{ name = 'muzzle_tactical',  label = _U("component_muzzle_tactical"),  hash = `COMPONENT_AT_MUZZLE_02` },
			{ name = 'muzzle_fat',       label = _U("component_muzzle_fat"),       hash = `COMPONENT_AT_MUZZLE_03` },
			{ name = 'muzzle_precision', label = _U("component_muzzle_precision"), hash = `COMPONENT_AT_MUZZLE_04` },
			{ name = 'muzzle_heavy',     label = _U("component_muzzle_heavy"),     hash = `COMPONENT_AT_MUZZLE_05` },
			{ name = 'muzzle_slanted',   label = _U("component_muzzle_slanted"),   hash = `COMPONENT_AT_MUZZLE_06` },
			{ name = 'muzzle_split',     label = _U("component_muzzle_split"),     hash = `COMPONENT_AT_MUZZLE_07` },
			{ name = 'grip',             label = _U("component_grip"),             hash = `COMPONENT_AT_AR_AFGRIP_02` },
			{ name = 'camo_finish',      label = _U("component_camo_finish"),      hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO` },
			{ name = 'camo_finish2',     label = _U("component_camo_finish2"),     hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_02` },
			{ name = 'camo_finish3',     label = _U("component_camo_finish3"),     hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_03` },
			{ name = 'camo_finish4',     label = _U("component_camo_finish4"),     hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_04` },
			{ name = 'camo_finish5',     label = _U("component_camo_finish5"),     hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_05` },
			{ name = 'camo_finish6',     label = _U("component_camo_finish6"),     hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_06` },
			{ name = 'camo_finish7',     label = _U("component_camo_finish7"),     hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_07` },
			{ name = 'camo_finish8',     label = _U("component_camo_finish8"),     hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_08` },
			{ name = 'camo_finish9',     label = _U("component_camo_finish9"),     hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_09` },
			{ name = 'camo_finish10',    label = _U("component_camo_finish10"),    hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_10` },
			{ name = 'camo_finish11',    label = _U("component_camo_finish11"),    hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_IND_01` }
		}
	},
	{
		name = 'WEAPON_CARBINERIFLE',
		label = _U("weapon_carbinerifle"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_RIFLE` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_CARBINERIFLE_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_CARBINERIFLE_CLIP_02` },
			{ name = 'clip_box',      label = _U("component_clip_box"),      hash = `COMPONENT_CARBINERIFLE_CLIP_03` },
			{ name = 'flashlight',    label = _U("component_flashlight"),    hash = `COMPONENT_AT_AR_FLSH` },
			{ name = 'scope',         label = _U("component_scope"),         hash = `COMPONENT_AT_SCOPE_MEDIUM` },
			{ name = 'suppressor',    label = _U("component_suppressor"),    hash = `COMPONENT_AT_AR_SUPP` },
			{ name = 'grip',          label = _U("component_grip"),          hash = `COMPONENT_AT_AR_AFGRIP` },
			{ name = 'luxary_finish', label = _U("component_luxary_finish"), hash = `COMPONENT_CARBINERIFLE_VARMOD_LUXE` }
		}
	},
	{
		name = 'WEAPON_CARBINERIFLE_MK2',
		label = _U("weapon_carbinerifle_mk2"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_RIFLE` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',     label = _U("component_clip_default"),     hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_01` },
			{ name = 'clip_extended',    label = _U("component_clip_extended"),    hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_02` },
			{ name = 'ammo_tracer',      label = _U("component_ammo_tracer"),      hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER` },
			{ name = 'ammo_incendiary',  label = _U("component_ammo_incendiary"),  hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY` },
			{ name = 'ammo_armor',       label = _U("component_ammo_armor"),       hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING` },
			{ name = 'ammo_fmj',         label = _U("component_ammo_fmj"),         hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ` },
			{ name = 'grip',             label = _U("component_grip"),             hash = `COMPONENT_AT_AR_AFGRIP_02` },
			{ name = 'flashlight',       label = _U("component_flashlight"),       hash = `COMPONENT_AT_AR_FLSH` },
			{ name = 'scope_holo',       label = _U("component_scope_holo"),       hash = `COMPONENT_AT_SIGHTS` },
			{ name = 'scope_medium',     label = _U("component_scope_medium"),     hash = `COMPONENT_AT_SCOPE_MACRO_MK2` },
			{ name = 'scope_large',      label = _U("component_scope_large"),      hash = `COMPONENT_AT_SCOPE_MEDIUM_MK2` },
			{ name = 'suppressor',       label = _U("component_suppressor"),       hash = `COMPONENT_AT_AR_SUPP` },
			{ name = 'muzzle_flat',      label = _U("component_muzzle_flat"),      hash = `COMPONENT_AT_MUZZLE_01` },
			{ name = 'muzzle_tactical',  label = _U("component_muzzle_tactical"),  hash = `COMPONENT_AT_MUZZLE_02` },
			{ name = 'muzzle_fat',       label = _U("component_muzzle_fat"),       hash = `COMPONENT_AT_MUZZLE_03` },
			{ name = 'muzzle_precision', label = _U("component_muzzle_precision"), hash = `COMPONENT_AT_MUZZLE_04` },
			{ name = 'muzzle_heavy',     label = _U("component_muzzle_heavy"),     hash = `COMPONENT_AT_MUZZLE_05` },
			{ name = 'muzzle_slanted',   label = _U("component_muzzle_slanted"),   hash = `COMPONENT_AT_MUZZLE_06` },
			{ name = 'muzzle_split',     label = _U("component_muzzle_split"),     hash = `COMPONENT_AT_MUZZLE_07` },
			{ name = 'barrel_default',   label = _U("component_barrel_default"),   hash = `COMPONENT_AT_CR_BARREL_01` },
			{ name = 'barrel_heavy',     label = _U("component_barrel_heavy"),     hash = `COMPONENT_AT_CR_BARREL_02` },
			{ name = 'camo_finish',      label = _U("component_camo_finish"),      hash = `COMPONENT_CARBINERIFLE_MK2_CAMO` },
			{ name = 'camo_finish2',     label = _U("component_camo_finish2"),     hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_02` },
			{ name = 'camo_finish3',     label = _U("component_camo_finish3"),     hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_03` },
			{ name = 'camo_finish4',     label = _U("component_camo_finish4"),     hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_04` },
			{ name = 'camo_finish5',     label = _U("component_camo_finish5"),     hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_05` },
			{ name = 'camo_finish6',     label = _U("component_camo_finish6"),     hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_06` },
			{ name = 'camo_finish7',     label = _U("component_camo_finish7"),     hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_07` },
			{ name = 'camo_finish8',     label = _U("component_camo_finish8"),     hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_08` },
			{ name = 'camo_finish9',     label = _U("component_camo_finish9"),     hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_09` },
			{ name = 'camo_finish10',    label = _U("component_camo_finish10"),    hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_10` },
			{ name = 'camo_finish11',    label = _U("component_camo_finish11"),    hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_IND_01` }
		}
	},
	{
		name = 'WEAPON_COMPACTRIFLE',
		label = _U("weapon_compactrifle"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_RIFLE` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_COMPACTRIFLE_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_COMPACTRIFLE_CLIP_02` },
			{ name = 'clip_drum',     label = _U("component_clip_drum"),     hash = `COMPONENT_COMPACTRIFLE_CLIP_03` }
		}
	},
	{
		name = 'WEAPON_MILITARYRIFLE',
		label = _U("weapon_militaryrifle"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_RIFLE` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_MILITARYRIFLE_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_MILITARYRIFLE_CLIP_02` },
			{ name = 'ironsights',    label = _U("component_ironsights"),    hash = `COMPONENT_MILITARYRIFLE_SIGHT_01` },
			{ name = 'scope',         label = _U("component_scope"),         hash = `COMPONENT_AT_SCOPE_SMALL` },
			{ name = 'flashlight',    label = _U("component_flashlight"),    hash = `COMPONENT_AT_AR_FLSH` },
			{ name = 'suppressor',    label = _U("component_suppressor"),    hash = `COMPONENT_AT_AR_SUPP` }
		}
	},
	{
		name = 'WEAPON_SPECIALCARBINE',
		label = _U("weapon_specialcarbine"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_RIFLE` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_SPECIALCARBINE_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_SPECIALCARBINE_CLIP_02` },
			{ name = 'clip_drum',     label = _U("component_clip_drum"),     hash = `COMPONENT_SPECIALCARBINE_CLIP_03` },
			{ name = 'flashlight',    label = _U("component_flashlight"),    hash = `COMPONENT_AT_AR_FLSH` },
			{ name = 'scope',         label = _U("component_scope"),         hash = `COMPONENT_AT_SCOPE_MEDIUM` },
			{ name = 'suppressor',    label = _U("component_suppressor"),    hash = `COMPONENT_AT_AR_SUPP_02` },
			{ name = 'grip',          label = _U("component_grip"),          hash = `COMPONENT_AT_AR_AFGRIP` },
			{ name = 'luxary_finish', label = _U("component_luxary_finish"), hash = `COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER` }
		}
	},
	{
		name = 'WEAPON_SPECIALCARBINE_MK2',
		label = _U("weapon_specialcarbine_mk2"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_RIFLE` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',     label = _U("component_clip_default"),     hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_01` },
			{ name = 'clip_extended',    label = _U("component_clip_extended"),    hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_02` },
			{ name = 'ammo_tracer',      label = _U("component_ammo_tracer"),      hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER` },
			{ name = 'ammo_incendiary',  label = _U("component_ammo_incendiary"),  hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY` },
			{ name = 'ammo_armor',       label = _U("component_ammo_armor"),       hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING` },
			{ name = 'ammo_fmj',         label = _U("component_ammo_fmj"),         hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ` },
			{ name = 'flashlight',       label = _U("component_flashlight"),       hash = `COMPONENT_AT_AR_FLSH` },
			{ name = 'scope_holo',       label = _U("component_scope_holo"),       hash = `COMPONENT_AT_SIGHTS` },
			{ name = 'scope_small',      label = _U("component_scope_small"),      hash = `COMPONENT_AT_SCOPE_MACRO_MK2` },
			{ name = 'scope_large',      label = _U("component_scope_large"),      hash = `COMPONENT_AT_SCOPE_MEDIUM_MK2` },
			{ name = 'suppressor',       label = _U("component_suppressor"),       hash = `COMPONENT_AT_AR_SUPP_02` },
			{ name = 'muzzle_flat',      label = _U("component_muzzle_flat"),      hash = `COMPONENT_AT_MUZZLE_01` },
			{ name = 'muzzle_tactical',  label = _U("component_muzzle_tactical"),  hash = `COMPONENT_AT_MUZZLE_02` },
			{ name = 'muzzle_fat',       label = _U("component_muzzle_fat"),       hash = `COMPONENT_AT_MUZZLE_03` },
			{ name = 'muzzle_precision', label = _U("component_muzzle_precision"), hash = `COMPONENT_AT_MUZZLE_04` },
			{ name = 'muzzle_heavy',     label = _U("component_muzzle_heavy"),     hash = `COMPONENT_AT_MUZZLE_05` },
			{ name = 'muzzle_slanted',   label = _U("component_muzzle_slanted"),   hash = `COMPONENT_AT_MUZZLE_06` },
			{ name = 'muzzle_split',     label = _U("component_muzzle_split"),     hash = `COMPONENT_AT_MUZZLE_07` },
			{ name = 'grip',             label = _U("component_grip"),             hash = `COMPONENT_AT_AR_AFGRIP_02` },
			{ name = 'barrel_default',   label = _U("component_barrel_default"),   hash = `COMPONENT_AT_SC_BARREL_01` },
			{ name = 'barrel_heavy',     label = _U("component_barrel_heavy"),     hash = `COMPONENT_AT_SC_BARREL_02` },
			{ name = 'camo_finish',      label = _U("component_camo_finish"),      hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO` },
			{ name = 'camo_finish2',     label = _U("component_camo_finish2"),     hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_02` },
			{ name = 'camo_finish3',     label = _U("component_camo_finish3"),     hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_03` },
			{ name = 'camo_finish4',     label = _U("component_camo_finish4"),     hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_04` },
			{ name = 'camo_finish5',     label = _U("component_camo_finish5"),     hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_05` },
			{ name = 'camo_finish6',     label = _U("component_camo_finish6"),     hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_06` },
			{ name = 'camo_finish7',     label = _U("component_camo_finish7"),     hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_07` },
			{ name = 'camo_finish8',     label = _U("component_camo_finish8"),     hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_08` },
			{ name = 'camo_finish9',     label = _U("component_camo_finish9"),     hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_09` },
			{ name = 'camo_finish10',    label = _U("component_camo_finish10"),    hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_10` },
			{ name = 'camo_finish11',    label = _U("component_camo_finish11"),    hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_IND_01` }
		}
	},
	{
		name = 'WEAPON_HEAVYRIFLE',
		label = _U("weapon_heavyrifle"),
		ammo = {label = _U("ammo_rounds"), hash = `AMMO_RIFLE`},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U("component_clip_default"), hash = `COMPONENT_HEAVYRIFLE_CLIP_01`},
			{name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_HEAVYRIFLE_CLIP_02`},
			{name = 'scope_holo', label = _U("component_scope_holo"), hash = `COMPONENT_HEAVYRIFLE_SIGHT_01` },
			{name = 'scope', label = _U("component_scope"), hash = `COMPONENT_AT_SCOPE_MEDIUM` },
			{name = 'flashlight', label = _U("component_flashlight"), hash = `COMPONENT_AT_AR_FLSH`},
			{name = 'suppressor', label = _U("component_suppressor"), hash = `COMPONENT_AT_AR_SUPP`},
			{name = 'grip', label = _U("component_grip"), hash = `COMPONENT_AT_AR_AFGRIP`}
		}
	},
	-- Sniper
	{
		name = 'WEAPON_HEAVYSNIPER',
		label = _U("weapon_heavysniper"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_SNIPER` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'scope',          label = _U("component_scope"),          hash = `COMPONENT_AT_SCOPE_LARGE` },
			{ name = 'scope_advanced', label = _U("component_scope_advanced"), hash = `COMPONENT_AT_SCOPE_MAX` }
		}
	},
	{
		name = 'WEAPON_HEAVYSNIPER_MK2',
		label = _U("weapon_heavysniper_mk2"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_SNIPER` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',      label = _U("component_clip_default"),      hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_01` },
			{ name = 'clip_extended',     label = _U("component_clip_extended"),     hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_02` },
			{ name = 'ammo_incendiary',   label = _U("component_ammo_incendiary"),   hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY` },
			{ name = 'ammo_armor',        label = _U("component_ammo_armor"),        hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING` },
			{ name = 'ammo_fmj',          label = _U("component_ammo_fmj"),          hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ` },
			{ name = 'ammo_explosive',    label = _U("component_ammo_explosive"),    hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE` },
			{ name = 'scope_zoom',        label = _U("component_scope_zoom"),        hash = `COMPONENT_AT_SCOPE_LARGE_MK2` },
			{ name = 'scope_advanced',    label = _U("component_scope_advanced"),    hash = `COMPONENT_AT_SCOPE_MAX` },
			{ name = 'scope_nightvision', label = _U("component_scope_nightvision"), hash = `COMPONENT_AT_SCOPE_NV` },
			{ name = 'scope_thermal',     label = _U("component_scope_thermal"),     hash = `COMPONENT_AT_SCOPE_THERMAL` },
			{ name = 'suppressor',        label = _U("component_suppressor"),        hash = `COMPONENT_AT_SR_SUPP_03` },
			{ name = 'muzzle_squared',    label = _U("component_muzzle_squared"),    hash = `COMPONENT_AT_MUZZLE_08` },
			{ name = 'muzzle_bell',       label = _U("component_muzzle_bell"),       hash = `COMPONENT_AT_MUZZLE_09` },
			{ name = 'barrel_default',    label = _U("component_barrel_default"),    hash = `COMPONENT_AT_SR_BARREL_01` },
			{ name = 'barrel_heavy',      label = _U("component_barrel_heavy"),      hash = `COMPONENT_AT_SR_BARREL_02` },
			{ name = 'camo_finish',       label = _U("component_camo_finish"),       hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO` },
			{ name = 'camo_finish2',      label = _U("component_camo_finish2"),      hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_02` },
			{ name = 'camo_finish3',      label = _U("component_camo_finish3"),      hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_03` },
			{ name = 'camo_finish4',      label = _U("component_camo_finish4"),      hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_04` },
			{ name = 'camo_finish5',      label = _U("component_camo_finish5"),      hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_05` },
			{ name = 'camo_finish6',      label = _U("component_camo_finish6"),      hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_06` },
			{ name = 'camo_finish7',      label = _U("component_camo_finish7"),      hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_07` },
			{ name = 'camo_finish8',      label = _U("component_camo_finish8"),      hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_08` },
			{ name = 'camo_finish9',      label = _U("component_camo_finish9"),      hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_09` },
			{ name = 'camo_finish10',     label = _U("component_camo_finish10"),     hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_10` },
			{ name = 'camo_finish11',     label = _U("component_camo_finish11"),     hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_IND_01` }
		}
	},
	{
		name = 'WEAPON_MARKSMANRIFLE',
		label = _U("weapon_marksmanrifle"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_SNIPER` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_MARKSMANRIFLE_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_MARKSMANRIFLE_CLIP_02` },
			{ name = 'flashlight',    label = _U("component_flashlight"),    hash = `COMPONENT_AT_AR_FLSH` },
			{ name = 'scope',         label = _U("component_scope"),         hash = `COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM` },
			{ name = 'suppressor',    label = _U("component_suppressor"),    hash = `COMPONENT_AT_AR_SUPP` },
			{ name = 'grip',          label = _U("component_grip"),          hash = `COMPONENT_AT_AR_AFGRIP` },
			{ name = 'luxary_finish', label = _U("component_luxary_finish"), hash = `COMPONENT_MARKSMANRIFLE_VARMOD_LUXE` }
		}
	},
	{
		name = 'WEAPON_MARKSMANRIFLE_MK2',
		label = _U("weapon_marksmanrifle_mk2"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_SNIPER` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',     label = _U("component_clip_default"),     hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_01` },
			{ name = 'clip_extended',    label = _U("component_clip_extended"),    hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_02` },
			{ name = 'ammo_tracer',      label = _U("component_ammo_tracer"),      hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER` },
			{ name = 'ammo_incendiary',  label = _U("component_ammo_incendiary"),  hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY` },
			{ name = 'ammo_armor',       label = _U("component_ammo_armor"),       hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING` },
			{ name = 'ammo_fmj',         label = _U("component_ammo_fmj"),         hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ` },
			{ name = 'scope_holo',       label = _U("component_scope_holo"),       hash = `COMPONENT_AT_SIGHTS` },
			{ name = 'scope_large',      label = _U("component_scope_large"),      hash = `COMPONENT_AT_SCOPE_MEDIUM_MK2` },
			{ name = 'scope_zoom',       label = _U("component_scope_zoom"),       hash = `COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2` },
			{ name = 'flashlight',       label = _U("component_flashlight"),       hash = `COMPONENT_AT_AR_FLSH` },
			{ name = 'suppressor',       label = _U("component_suppressor"),       hash = `COMPONENT_AT_AR_SUPP` },
			{ name = 'muzzle_flat',      label = _U("component_muzzle_flat"),      hash = `COMPONENT_AT_MUZZLE_01` },
			{ name = 'muzzle_tactical',  label = _U("component_muzzle_tactical"),  hash = `COMPONENT_AT_MUZZLE_02` },
			{ name = 'muzzle_fat',       label = _U("component_muzzle_fat"),       hash = `COMPONENT_AT_MUZZLE_03` },
			{ name = 'muzzle_precision', label = _U("component_muzzle_precision"), hash = `COMPONENT_AT_MUZZLE_04` },
			{ name = 'muzzle_heavy',     label = _U("component_muzzle_heavy"),     hash = `COMPONENT_AT_MUZZLE_05` },
			{ name = 'muzzle_slanted',   label = _U("component_muzzle_slanted"),   hash = `COMPONENT_AT_MUZZLE_06` },
			{ name = 'muzzle_split',     label = _U("component_muzzle_split"),     hash = `COMPONENT_AT_MUZZLE_07` },
			{ name = 'barrel_default',   label = _U("component_barrel_default"),   hash = `COMPONENT_AT_MRFL_BARREL_01` },
			{ name = 'barrel_heavy',     label = _U("component_barrel_heavy"),     hash = `COMPONENT_AT_MRFL_BARREL_02` },
			{ name = 'grip',             label = _U("component_grip"),             hash = `COMPONENT_AT_AR_AFGRIP_02` },
			{ name = 'camo_finish',      label = _U("component_camo_finish"),      hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO` },
			{ name = 'camo_finish2',     label = _U("component_camo_finish2"),     hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_02` },
			{ name = 'camo_finish3',     label = _U("component_camo_finish3"),     hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_03` },
			{ name = 'camo_finish4',     label = _U("component_camo_finish4"),     hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_04` },
			{ name = 'camo_finish5',     label = _U("component_camo_finish5"),     hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_05` },
			{ name = 'camo_finish6',     label = _U("component_camo_finish6"),     hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_06` },
			{ name = 'camo_finish7',     label = _U("component_camo_finish7"),     hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_07` },
			{ name = 'camo_finish8',     label = _U("component_camo_finish8"),     hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_08` },
			{ name = 'camo_finish9',     label = _U("component_camo_finish9"),     hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_09` },
			{ name = 'camo_finish10',    label = _U("component_camo_finish10"),    hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_10` },
			{ name = 'camo_finish11',    label = _U("component_camo_finish11"),    hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_IND_01` }
		}
	},
	{
		name = 'WEAPON_SNIPERRIFLE',
		label = _U("weapon_sniperrifle"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_SNIPER` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'scope',          label = _U("component_scope"),          hash = `COMPONENT_AT_SCOPE_LARGE` },
			{ name = 'scope_advanced', label = _U("component_scope_advanced"), hash = `COMPONENT_AT_SCOPE_MAX` },
			{ name = 'suppressor',     label = _U("component_suppressor"),     hash = `COMPONENT_AT_AR_SUPP_02` },
			{ name = 'luxary_finish',  label = _U("component_luxary_finish"),  hash = `COMPONENT_SNIPERRIFLE_VARMOD_LUXE` }
		}
	},
	-- Heavy / Launchers
	{ name = 'WEAPON_COMPACTLAUNCHER',  label = _U("weapon_compactlauncher"),  tints = Config.DefaultWeaponTints, components = {},                                                               ammo = { label = _U("ammo_grenadelauncher"), hash = `AMMO_GRENADELAUNCHER` } },
	{ name = 'WEAPON_FIREWORK',         label = _U("weapon_firework"),         components = {},                   ammo = { label = _U("ammo_firework"), hash = `AMMO_FIREWORK` } },
	{ name = 'WEAPON_GRENADELAUNCHER',  label = _U("weapon_grenadelauncher"),  tints = Config.DefaultWeaponTints, components = {},                                                               ammo = { label = _U("ammo_grenadelauncher"), hash = `AMMO_GRENADELAUNCHER` } },
	{ name = 'WEAPON_HOMINGLAUNCHER',   label = _U("weapon_hominglauncher"),   tints = Config.DefaultWeaponTints, components = {},                                                               ammo = { label = _U("ammo_rockets"), hash = `AMMO_HOMINGLAUNCHER` } },
	{ name = 'WEAPON_MINIGUN',          label = _U("weapon_minigun"),          tints = Config.DefaultWeaponTints, components = {},                                                               ammo = { label = _U("ammo_rounds"), hash = `AMMO_MINIGUN` } },
	{ name = 'WEAPON_RAILGUN',          label = _U("weapon_railgun"),          tints = Config.DefaultWeaponTints, components = {},                                                               ammo = { label = _U("ammo_rounds"), hash = `AMMO_RAILGUN` } },
	{ name = 'WEAPON_RPG',              label = _U("weapon_rpg"),              tints = Config.DefaultWeaponTints, components = {},                                                               ammo = { label = _U("ammo_rockets"), hash = `AMMO_RPG` } },
	{ name = 'WEAPON_RAYMINIGUN',       label = _U("weapon_rayminigun"),       tints = Config.DefaultWeaponTints, components = {},                                                               ammo = { label = _U("ammo_rounds"), hash = `AMMO_MINIGUN` } },
	-- Thrown
	{ name = 'WEAPON_BALL',             label = _U("weapon_ball"),             components = {},                   ammo = { label = _U("ammo_ball"), hash = `AMMO_BALL` } },
	{ name = 'WEAPON_BZGAS',            label = _U("weapon_bzgas"),            components = {},                   ammo = { label = _U("ammo_bzgas"), hash = `AMMO_BZGAS` } },
	{ name = 'WEAPON_FLARE',            label = _U("weapon_flare"),            components = {},                   ammo = { label = _U("ammo_flare"), hash = `AMMO_FLARE` } },
	{ name = 'WEAPON_GRENADE',          label = _U("weapon_grenade"),          components = {},                   ammo = { label = _U("ammo_grenade"), hash = `AMMO_GRENADE` } },
	{ name = 'WEAPON_PETROLCAN',        label = _U("weapon_petrolcan"),        components = {},                   ammo = { label = _U("ammo_petrol"), hash = `AMMO_PETROLCAN` } },
	{ name = 'WEAPON_HAZARDCAN',        label = _U("weapon_hazardcan"),        components = {},                   ammo = { label = _U("ammo_petrol"), hash = `AMMO_PETROLCAN` } },
	{ name = 'WEAPON_MOLOTOV',          label = _U("weapon_molotov"),          components = {},                   ammo = { label = _U("ammo_molotov"), hash = `AMMO_MOLOTOV` } },
	{ name = 'WEAPON_PROXMINE',         label = _U("weapon_proxmine"),         components = {},                   ammo = { label = _U("ammo_proxmine"), hash = `AMMO_PROXMINE` } },
	{ name = 'WEAPON_PIPEBOMB',         label = _U("weapon_pipebomb"),         components = {},                   ammo = { label = _U("ammo_pipebomb"), hash = `AMMO_PIPEBOMB` } },
	{ name = 'WEAPON_SNOWBALL',         label = _U("weapon_snowball"),         components = {},                   ammo = { label = _U("ammo_snowball"), hash = `AMMO_SNOWBALL` } },
	{ name = 'WEAPON_STICKYBOMB',       label = _U("weapon_stickybomb"),       components = {},                   ammo = { label = _U("ammo_stickybomb"), hash = `AMMO_STICKYBOMB` } },
	{ name = 'WEAPON_SMOKEGRENADE',     label = _U("weapon_smokegrenade"),     components = {},                   ammo = { label = _U("ammo_smokebomb"), hash = `AMMO_SMOKEGRENADE` } },
	-- Tools
	{ name = 'WEAPON_FIREEXTINGUISHER', label = _U("weapon_fireextinguisher"), components = {},                   ammo = { label = _U("ammo_charge"), hash = `AMMO_FIREEXTINGUISHER` } },
	{ name = 'WEAPON_DIGISCANNER',      label = _U("weapon_digiscanner"),      components = {} },
	{ name = 'GADGET_PARACHUTE',        label = _U("gadget_parachute"),        components = {} },
	{
		name = 'WEAPON_TACTICALRIFLE',
		label = _U("weapon_tactilerifle"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_RIFLE` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default',  label = _U("component_clip_default"),  hash = `COMPONENT_TACTICALRIFLE_CLIP_01` },
			{ name = 'clip_extended', label = _U("component_clip_extended"), hash = `COMPONENT_TACTICALRIFLE_CLIP_02` },
			{ name = 'flashlight',    label = _U("component_flashlight"),    hash = `COMPONENT_AT_AR_FLSH_REH` },
			{ name = 'grip',          label = _U("component_grip"),          hash = `COMPONENT_AT_AR_AFGRIP` },
			{ name = 'suppressor',    label = _U("component_suppressor"),    hash = `COMPONENT_AT_AR_SUPP_02` }
		}
	},
	{
		name = 'WEAPON_PRECISIONRIFLE',
		label = _U("weapon_precisionrifle"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_SNIPER` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default', label = _U("component_clip_default"), hash = `COMPONENT_PRECISIONRIFLE_CLIP_01` },
		}
	},
	{ name = 'WEAPON_METALDETECTOR', label = _U("weapon_metaldetector"), components = {} },
	{
		name = 'WEAPON_PISTOLXM3',
		label = _U("weapon_pistolxm3"),
		ammo = { label = _U("ammo_rounds"), hash = `AMMO_PISTOL` },
		tints = Config.DefaultWeaponTints,
		components = {
			{ name = 'clip_default', label = _U("component_clip_default"), hash = `COMPONENT_PISTOLXM3_CLIP_01` },
			{ name = 'suppressor',   label = _U("component_suppressor"),   hash = `COMPONENT_PISTOLXM3_SUPP` }
		}
	},
	{
		name = 'WEAPON_AWPREDLINE',
		label = 'AWP REDLINE',
		components = {}
	},

	{
		name = 'WEAPON_AK47NEONRIDE',
		label = 'AK47 Neon-Ride',
		components = {}
	},

	{
		name = 'WEAPON_VICTUSXMR',
		label = 'Victus XMR',
		components = {}
	},

	{
		name = 'WEAPON_M6IC',
		label = 'LWRC M6IC',
		components = {}
	},

	{
		name = 'WEAPON_AR15',
		label = 'AR-15',
		components = {		
			-- Chargeur
			{name = 'chargeur1', label = 'Chargeur', hash = `COMPONENT_AR15_CLIP_01`},
			{name = 'chargeur2', label = 'Chargeur', hash = `COMPONENT_AR15_CLIP_02`},
		}
	},

	{
		name = 'WEAPON_FN509',
		label = 'FN-509',
		components = {
			-- Chargeur
			{name = 'chargeur1', label = 'Chargeur', hash = `COMPONENT_FN509_CLIP_01`},
			{name = 'chargeur2', label = 'Chargeur', hash = `COMPONENT_FN509_CLIP_02`},
		}
	},

	{
		name = 'WEAPON_MP5SDFM',
		label = 'MP5SD-FM',
		components = {
			-- Chargeur
			{name = 'chargeur1', label = 'Chargeur', hash = `COMPONENT_MP5SD_CLIP_01`},
			{name = 'chargeur2', label = 'Chargeur', hash = `COMPONENT_MP5SD_CLIP_02`},
		}
	},

	{
		name = 'WEAPON_HONEYBADGERCOD',
		label = 'Honey Badger COD',
		components = {
			-- Chargeur
			{name = 'chargeur1', label = 'Chargeur', hash = `COMPONENT_HONEYBADGER_CLIP_01`},
			{name = 'chargeur2', label = 'Chargeur', hash = `COMPONENT_HONEYBADGER_CLIP_02`},
		}
	},

	{
		name = 'WEAPON_MCXSPEAR',
		label = 'MCX Spear',
		components = {
			-- Skin
			{name = 'skin1', label = 'Skin', hash = `COMPONENT_MCXSPEAR_BODY_01`},
			{name = 'skin2', label = 'Skin', hash = `COMPONENT_MCXSPEAR_BODY_02`},
			-- Poignée
			{name = 'grip1', label = 'Poignée', hash = `COMPONENT_MCXSPEAR_GRIP_01`},
			{name = 'grip2', label = 'Poignée', hash = `COMPONENT_MCXSPEAR_GRIP_02`},
			{name = 'grip3', label = 'Poignée', hash = `COMPONENT_MCXSPEAR_GRIP_03`},
			{name = 'grip4', label = 'Poignée', hash = `COMPONENT_MCXSPEAR_GRIP_04`},
			{name = 'grip5', label = 'Poignée', hash = `COMPONENT_MCXSPEAR_GRIP_05`},
			{name = 'grip6', label = 'Poignée', hash = `COMPONENT_MCXSPEAR_GRIP_06`},
			{name = 'grip7', label = 'Poignée', hash = `COMPONENT_MCXSPEAR_GRIP_07`},
			{name = 'grip8', label = 'Poignée', hash = `COMPONENT_MCXSPEAR_GRIP_08`},
			{name = 'grip9', label = 'Poignée', hash = `COMPONENT_MCXSPEAR_GRIP_09`},
			{name = 'grip10', label = 'Poignée', hash = `COMPONENT_MCXSPEAR_GRIP_10`},
			{name = 'grip11', label = 'Poignée', hash = `COMPONENT_MCXSPEAR_GRIP_11`},
			-- Viseur
			{name = 'scop1', label = 'Viseur', hash = `COMPONENT_MCXSPEAR_SCOPE_01`},
			{name = 'scop2', label = 'Viseur', hash = `COMPONENT_MCXSPEAR_SCOPE_02`},
			{name = 'scop3', label = 'Viseur', hash = `COMPONENT_MCXSPEAR_SCOPE_03`},
			{name = 'scop4', label = 'Viseur', hash = `COMPONENT_MCXSPEAR_SCOPE_04`},
			{name = 'scop5', label = 'Viseur', hash = `COMPONENT_MCXSPEAR_SCOPE_05`},
			{name = 'scop6', label = 'Viseur', hash = `COMPONENT_MCXSPEAR_SCOPE_06`},
			{name = 'scop7', label = 'Viseur', hash = `COMPONENT_MCXSPEAR_SCOPE_07`},
			{name = 'scop8', label = 'Viseur', hash = `COMPONENT_MCXSPEAR_SCOPE_08`},
			{name = 'scop9', label = 'Viseur', hash = `COMPONENT_MCXSPEAR_SCOPE_09`},
			{name = 'scop10', label = 'Viseur', hash = `COMPONENT_MCXSPEAR_SCOPE_10`},
			{name = 'scop11', label = 'Viseur', hash = `COMPONENT_MCXSPEAR_SCOPE_11`},
			{name = 'scop12', label = 'Viseur', hash = `COMPONENT_MCXSPEAR_SCOPE_12`},
			{name = 'scop13', label = 'Viseur', hash = `COMPONENT_MCXSPEAR_SCOPE_13`},
			{name = 'scop14', label = 'Viseur', hash = `COMPONENT_MCXSPEAR_SCOPE_14`},
			{name = 'scop15', label = 'Viseur', hash = `COMPONENT_MCXSPEAR_SCOPE_15`},
			{name = 'scop16', label = 'Viseur', hash = `COMPONENT_MCXSPEAR_SCOPE_16`},
			{name = 'scop17', label = 'Viseur', hash = `COMPONENT_MCXSPEAR_SCOPE_17`},
			{name = 'scop18', label = 'Viseur', hash = `COMPONENT_MCXSPEAR_SCOPE_18`},
			{name = 'scop19', label = 'Viseur', hash = `COMPONENT_MCXSPEAR_SCOPE_19`},
			{name = 'scop20', label = 'Viseur', hash = `COMPONENT_MCXSPEAR_SCOPE_20`},
			-- Chargeur
			{name = 'chargeur1', label = 'Chargeur', hash = `COMPONENT_MCXSPEAR_CLIP_01`},
			{name = 'chargeur2', label = 'Chargeur', hash = `COMPONENT_MCXSPEAR_CLIP_02`},
			-- Crosse 
			{name = 'crosse1', label = 'Crosse', hash = `COMPONENT_MCXSPEAR_STOCK_01`},
			{name = 'crosse2', label = 'Crosse', hash = `COMPONENT_MCXSPEAR_STOCK_02`},
			{name = 'crosse3', label = 'Crosse', hash = `COMPONENT_MCXSPEAR_STOCK_03`},
			{name = 'crosse4', label = 'Crosse', hash = `COMPONENT_MCXSPEAR_STOCK_04`},
			{name = 'crosse5', label = 'Crosse', hash = `COMPONENT_MCXSPEAR_STOCK_05`},
			{name = 'crosse6', label = 'Crosse', hash = `COMPONENT_MCXSPEAR_STOCK_06`},
			{name = 'crosse7', label = 'Crosse', hash = `COMPONENT_MCXSPEAR_STOCK_07`},
			{name = 'crosse8', label = 'Crosse', hash = `COMPONENT_MCXSPEAR_STOCK_08`},
			{name = 'crosse9', label = 'Crosse', hash = `COMPONENT_MCXSPEAR_STOCK_09`},
			{name = 'crosse10', label = 'Crosse', hash = `COMPONENT_MCXSPEAR_STOCK_010`},
			-- Flashlights & Lasers
			{name = 'lumiere1', label = 'Lumière ou Lazer', hash = `COMPONENT_MCXSPEAR_FLSH_01`},
			{name = 'lumiere2', label = 'Lumière ou Lazer', hash = `COMPONENT_MCXSPEAR_FLSH_02`},
			{name = 'lumiere3', label = 'Lumière ou Lazer', hash = `COMPONENT_MCXSPEAR_FLSH_03`},
			{name = 'lumiere4', label = 'Lumière ou Lazer', hash = `COMPONENT_MCXSPEAR_FLSH_04`},
			{name = 'lumiere5', label = 'Lumière ou Lazer', hash = `COMPONENT_MCXSPEAR_FLSH_05`},
			{name = 'lumiere6', label = 'Lumière ou Lazer', hash = `COMPONENT_MCXSPEAR_FLSH_06`},
			{name = 'lumiere7', label = 'Lumière ou Lazer', hash = `COMPONENT_MCXSPEAR_FLSH_07`},
			{name = 'lumiere8', label = 'Lumière ou Lazer', hash = `COMPONENT_MCXSPEAR_FLSH_08`},
			{name = 'lumiere9', label = 'Lumière ou Lazer', hash = `COMPONENT_MCXSPEAR_FLSH_09`},
			{name = 'lumiere10', label = 'Lumière ou Lazer', hash = `COMPONENT_MCXSPEAR_FLSH_10`},
			{name = 'lumiere11', label = 'Lumière ou Lazer', hash = `COMPONENT_MCXSPEAR_FLSH_11`},
		}
	},

	{
		name = 'WEAPON_GLITCHPOPVANDAL',
		label = 'Glitchpop Vandal',
		components = {}
	},

	{
		name = 'WEAPON_SCAR17FM',
		label = 'SCAR-17',
		components = {
			-- Skin
			{name = 'skin1', label = 'Skin', hash = `COMPONENT_SCAR_BODY_01`},
			{name = 'skin2', label = 'Skin', hash = `COMPONENT_SCAR_BODY_02`},
			-- Viseur
			{name = 'scop1', label = 'Viseur', hash = `COMPONENT_SCAR_SCOPE_01`},
			{name = 'scop2', label = 'Viseur', hash = `COMPONENT_SCAR_SCOPE_02`},
			{name = 'scop3', label = 'Viseur', hash = `COMPONENT_SCAR_SCOPE_03`},
			{name = 'scop4', label = 'Viseur', hash = `COMPONENT_SCAR_SCOPE_04`},
			{name = 'scop5', label = 'Viseur', hash = `COMPONENT_SCAR_SCOPE_05`},
			{name = 'scop6', label = 'Viseur', hash = `COMPONENT_SCAR_SCOPE_06`},
			{name = 'scop7', label = 'Viseur', hash = `COMPONENT_SCAR_SCOPE_07`},
			{name = 'scop8', label = 'Viseur', hash = `COMPONENT_SCAR_SCOPE_08`},
			{name = 'scop9', label = 'Viseur', hash = `COMPONENT_SCAR_SCOPE_09`},
			{name = 'scop10', label = 'Viseur', hash = `COMPONENT_SCAR_SCOPE_10`},
			{name = 'scop11', label = 'Viseur', hash = `COMPONENT_SCAR_SCOPE_11`},
			{name = 'scop12', label = 'Viseur', hash = `COMPONENT_SCAR_SCOPE_12`},
			{name = 'scop13', label = 'Viseur', hash = `COMPONENT_SCAR_SCOPE_13`},
			{name = 'scop14', label = 'Viseur', hash = `COMPONENT_SCAR_SCOPE_14`},
			{name = 'scop15', label = 'Viseur', hash = `COMPONENT_SCAR_SCOPE_15`},
			{name = 'scop16', label = 'Viseur', hash = `COMPONENT_SCAR_SCOPE_16`},
			{name = 'scop17', label = 'Viseur', hash = `COMPONENT_SCAR_SCOPE_17`},
			{name = 'scop18', label = 'Viseur', hash = `COMPONENT_SCAR_SCOPE_18`},
			{name = 'scop19', label = 'Viseur', hash = `COMPONENT_SCAR_SCOPE_19`},
			{name = 'scop20', label = 'Viseur', hash = `COMPONENT_SCAR_SCOPE_20`},
			-- Cannon
			{name = 'cannon1', label = 'Cannon', hash = `COMPONENT_SCAR_BARREL_01`},
			{name = 'cannon2', label = 'Cannon', hash = `COMPONENT_SCAR_BARREL_02`},
			{name = 'cannon3', label = 'Cannon', hash = `COMPONENT_SCAR_BARREL_03`},
			{name = 'cannon4', label = 'Cannon', hash = `COMPONENT_SCAR_BARREL_04`},
			{name = 'cannon5', label = 'Cannon', hash = `COMPONENT_SCAR_BARREL_05`},
			{name = 'cannon6', label = 'Cannon', hash = `COMPONENT_SCAR_BARREL_06`},
			{name = 'cannon7', label = 'Cannon', hash = `COMPONENT_SCAR_BARREL_07`},
			{name = 'cannon8', label = 'Cannon', hash = `COMPONENT_SCAR_BARREL_08`},
			{name = 'cannon9', label = 'Cannon', hash = `COMPONENT_SCAR_BARREL_09`},
			-- Chargeur
			{name = 'chargeur1', label = 'Chargeur', hash = `COMPONENT_SCAR_CLIP_01`},
			{name = 'chargeur2', label = 'Chargeur', hash = `COMPONENT_SCAR_CLIP_02`},
			{name = 'chargeur3', label = 'Chargeur', hash = `COMPONENT_SCAR_CLIP_03`},
			{name = 'chargeur4', label = 'Chargeur', hash = `COMPONENT_SCAR_CLIP_04`},
			{name = 'chargeur5', label = 'Chargeur', hash = `COMPONENT_SCAR_CLIP_05`},
			{name = 'chargeur6', label = 'Chargeur', hash = `COMPONENT_SCAR_CLIP_06`},
			-- Flashlights & Lasers
			{name = 'lumiere1', label = 'Lumière ou Lazer', hash = `COMPONENT_SCAR_FLSH_01`},
			{name = 'lumiere2', label = 'Lumière ou Lazer', hash = `COMPONENT_SCAR_FLSH_02`},
			{name = 'lumiere3', label = 'Lumière ou Lazer', hash = `COMPONENT_SCAR_FLSH_03`},
			{name = 'lumiere4', label = 'Lumière ou Lazer', hash = `COMPONENT_SCAR_FLSH_04`},
			{name = 'lumiere5', label = 'Lumière ou Lazer', hash = `COMPONENT_SCAR_FLSH_05`},
			{name = 'lumiere6', label = 'Lumière ou Lazer', hash = `COMPONENT_SCAR_FLSH_06`},
			{name = 'lumiere7', label = 'Lumière ou Lazer', hash = `COMPONENT_SCAR_FLSH_07`},
			{name = 'lumiere8', label = 'Lumière ou Lazer', hash = `COMPONENT_SCAR_FLSH_08`},
			{name = 'lumiere9', label = 'Lumière ou Lazer', hash = `COMPONENT_SCAR_FLSH_09`},
			{name = 'lumiere10', label = 'Lumière ou Lazer', hash = `COMPONENT_SCAR_FLSH_10`},
		}
	},

	{
		name = 'WEAPON_HKUMP',
		label = 'HK-UMP 45',
		components = {
			-- Poignée
			{name = 'grip1', label = 'Poignée', hash = `COMPONENT_UMP_GRIP_01`},
			{name = 'grip2', label = 'Poignée', hash = `COMPONENT_UMP_GRIP_02`},
			{name = 'grip3', label = 'Poignée', hash = `COMPONENT_UMP_GRIP_03`},
			{name = 'grip4', label = 'Poignée', hash = `COMPONENT_UMP_GRIP_04`},
			{name = 'grip5', label = 'Poignée', hash = `COMPONENT_UMP_GRIP_05`},
			{name = 'grip6', label = 'Poignée', hash = `COMPONENT_UMP_GRIP_06`},
			{name = 'grip7', label = 'Poignée', hash = `COMPONENT_UMP_GRIP_07`},
			{name = 'grip8', label = 'Poignée', hash = `COMPONENT_UMP_GRIP_08`},
			{name = 'grip9', label = 'Poignée', hash = `COMPONENT_UMP_GRIP_09`},
			{name = 'grip10', label = 'Poignée', hash = `COMPONENT_UMP_GRIP_10`},
			-- Bouche / SILENCIEUX
			{name = 'muz1', label = 'Bouche ou Silencieux', hash = `COMPONENT_UMP_SUPP_01`},
			{name = 'muz2', label = 'Bouche ou Silencieux', hash = `COMPONENT_UMP_SUPP_02`},
			{name = 'muz3', label = 'Bouche ou Silencieux', hash = `COMPONENT_UMP_SUPP_03`},
			{name = 'muz4', label = 'Bouche ou Silencieux', hash = `COMPONENT_UMP_SUPP_04`},
			{name = 'muz5', label = 'Bouche ou Silencieux', hash = `COMPONENT_UMP_SUPP_05`},
			{name = 'muz6', label = 'Bouche ou Silencieux', hash = `COMPONENT_UMP_SUPP_06`},
			{name = 'muz7', label = 'Bouche ou Silencieux', hash = `COMPONENT_AKS74U_MUZ_07`},
			{name = 'muz8', label = 'Bouche ou Silencieux', hash = `COMPONENT_AKS74U_MUZ_08`},
			{name = 'muz9', label = 'Bouche ou Silencieux', hash = `COMPONENT_AKS74U_MUZ_09`},
			-- Viseur
			{name = 'scop1', label = 'Viseur', hash = `COMPONENT_UMP_SCOPE_01`},
			{name = 'scop2', label = 'Viseur', hash = `COMPONENT_UMP_SCOPE_02`},
			{name = 'scop3', label = 'Viseur', hash = `COMPONENT_UMP_SCOPE_03`},
			{name = 'scop4', label = 'Viseur', hash = `COMPONENT_UMP_SCOPE_04`},
			{name = 'scop5', label = 'Viseur', hash = `COMPONENT_UMP_SCOPE_05`},
			{name = 'scop6', label = 'Viseur', hash = `COMPONENT_UMP_SCOPE_06`},
			{name = 'scop7', label = 'Viseur', hash = `COMPONENT_UMP_SCOPE_07`},
			{name = 'scop8', label = 'Viseur', hash = `COMPONENT_UMP_SCOPE_08`},
			{name = 'scop9', label = 'Viseur', hash = `COMPONENT_UMP_SCOPE_09`},
			{name = 'scop10', label = 'Viseur', hash = `COMPONENT_UMP_SCOPE_10`},
			-- Chargeur
			{name = 'chargeur1', label = 'Chargeur', hash = `COMPONENT_UMP_CLIP_01`},
			{name = 'chargeur2', label = 'Chargeur', hash = `COMPONENT_UMP_CLIP_02`},
			-- Crosse 
			{name = 'crosse1', label = 'Crosse', hash = `COMPONENT_UMP_STOCK_01`},
			{name = 'crosse2', label = 'Crosse', hash = `COMPONENT_UMP_STOCK_02`},
			-- Flashlights & Lasers
			{name = 'lumiere1', label = 'Lumière ou Lazer', hash = `COMPONENT_UMP_FLSH_01`},
			{name = 'lumiere2', label = 'Lumière ou Lazer', hash = `COMPONENT_UMP_FLSH_02`},
			{name = 'lumiere3', label = 'Lumière ou Lazer', hash = `COMPONENT_UMP_FLSH_03`},
			{name = 'lumiere4', label = 'Lumière ou Lazer', hash = `COMPONENT_UMP_FLSH_04`},
			{name = 'lumiere5', label = 'Lumière ou Lazer', hash = `COMPONENT_UMP_FLSH_05`},
			{name = 'lumiere6', label = 'Lumière ou Lazer', hash = `COMPONENT_UMP_FLSH_06`},
			{name = 'lumiere7', label = 'Lumière ou Lazer', hash = `COMPONENT_UMP_FLSH_07`},
		}
	},

	{
		name = 'WEAPON_FIREAXE',
		label = 'Fire Axe',
		components = {}
	},

	{
		name = 'WEAPON_BREN',
		label = 'Bren',
		components = {
			-- Skin
			{name = 'chargeur1', label = 'Chargeur', hash = `COMPONENT_BREN_CLIP_01`},
			{name = 'chargeur2', label = 'Chargeur', hash = `COMPONENT_BREN_CLIP_02`},
		}
	},

	{
		name = 'WEAPON_VP9',
		label = 'VP9',
		components = {}
	},

	{
		name = 'WEAPON_SLEDGEHAMMER',
		label = 'Sledge Hammer',
		components = {}
	},

	{
		name = 'WEAPON_M9A3',
		label = 'M9A3',
		components = {}
	},

	{
		name = 'WEAPON_KATANA',
		label = 'Katana',
		components = {}
	},

	{
		name = 'WEAPON_KARAMBITKNIFE',
		label = 'Karambit Knife',
		components = {}
	},

	{
		name = 'WEAPON_DOUBLEBARREL',
		label = 'Double Barrel',
		components = {}
	},

	{
		name = 'WEAPON_HK416',
		label = 'HK-416',
		components = {
			-- Skin
			{name = 'chargeur1', label = 'Chargeur', hash = `COMPONENT_HK416_CLIP_01`},
			{name = 'chargeur2', label = 'Chargeur', hash = `COMPONENT_HK416_CLIP_02`},
		}
	},

	{
		name = 'WEAPON_AKS74U',
		label = 'AKS74U',
		components = {
			-- Poignée
			{name = 'grip1', label = 'Poignée', hash = `COMPONENT_AKS74U_HANDGUARD_01`},
			{name = 'grip2', label = 'Poignée', hash = `COMPONENT_AKS74U_HANDGUARD_02`},
			{name = 'grip3', label = 'Poignée', hash = `COMPONENT_AKS74U_HANDGUARD_03`},
			{name = 'grip4', label = 'Poignée', hash = `COMPONENT_AKS74U_HANDGUARD_04`},
			{name = 'grip5', label = 'Poignée', hash = `COMPONENT_AKS74U_HANDGUARD_05`},
			{name = 'grip6', label = 'Poignée', hash = `COMPONENT_AKS74U_HANDGUARD_06`},
			{name = 'grip7', label = 'Poignée', hash = `COMPONENT_AKS74U_HANDGUARD_07`},
			{name = 'grip8', label = 'Poignée', hash = `COMPONENT_AKS74U_HANDGUARD_08`},
			-- Bouche / SILENCIEUX
			{name = 'muz1', label = 'Bouche ou Silencieux', hash = `COMPONENT_AKS74U_MUZ_01`},
			{name = 'muz2', label = 'Bouche ou Silencieux', hash = `COMPONENT_AKS74U_MUZ_02`},
			{name = 'muz3', label = 'Bouche ou Silencieux', hash = `COMPONENT_AKS74U_MUZ_03`},
			{name = 'muz4', label = 'Bouche ou Silencieux', hash = `COMPONENT_AKS74U_MUZ_04`},
			{name = 'muz5', label = 'Bouche ou Silencieux', hash = `COMPONENT_AKS74U_MUZ_05`},
			{name = 'muz6', label = 'Bouche ou Silencieux', hash = `COMPONENT_AKS74U_MUZ_06`},
			{name = 'muz7', label = 'Bouche ou Silencieux', hash = `COMPONENT_AKS74U_MUZ_07`},
			{name = 'muz8', label = 'Bouche ou Silencieux', hash = `COMPONENT_AKS74U_MUZ_08`},
			{name = 'muz9', label = 'Bouche ou Silencieux', hash = `COMPONENT_AKS74U_MUZ_09`},
			-- Viseur
			{name = 'scop1', label = 'Viseur', hash = `COMPONENT_AKS74U_SCOPE_01`},
			{name = 'scop2', label = 'Viseur', hash = `COMPONENT_AKS74U_SCOPE_02`},
			{name = 'scop3', label = 'Viseur', hash = `COMPONENT_AKS74U_SCOPE_03`},
			{name = 'scop4', label = 'Viseur', hash = `COMPONENT_AKS74U_SCOPE_04`},
			{name = 'scop5', label = 'Viseur', hash = `COMPONENT_AKS74U_SCOPE_05`},
			{name = 'scop6', label = 'Viseur', hash = `COMPONENT_AKS74U_SCOPE_06`},
			{name = 'scop7', label = 'Viseur', hash = `COMPONENT_AKS74U_SCOPE_07`},
			{name = 'scop8', label = 'Viseur', hash = `COMPONENT_AKS74U_SCOPE_08`},
			{name = 'scop9', label = 'Viseur', hash = `COMPONENT_AKS74U_SCOPE_09`},
			{name = 'scop10', label = 'Viseur', hash = `COMPONENT_AKS74U_SCOPE_10`},
			{name = 'scop11', label = 'Viseur', hash = `COMPONENT_AKS74U_SCOPE_11`},
			{name = 'scop12', label = 'Viseur', hash = `COMPONENT_AKS74U_SCOPE_12`},
			{name = 'scop13', label = 'Viseur', hash = `COMPONENT_AKS74U_SCOPE_13`},
			{name = 'scop14', label = 'Viseur', hash = `COMPONENT_AKS74U_SCOPE_14`},
			{name = 'scop15', label = 'Viseur', hash = `COMPONENT_AKS74U_SCOPE_15`},
			{name = 'scop16', label = 'Viseur', hash = `COMPONENT_AKS74U_SCOPE_16`},
			{name = 'scop17', label = 'Viseur', hash = `COMPONENT_AKS74U_SCOPE_17`},
			-- Crosse 
			{name = 'crosse1', label = 'Crosse', hash = `COMPONENT_AKS74U_STOCK_01`},
			{name = 'crosse2', label = 'Crosse', hash = `COMPONENT_AKS74U_STOCK_02`},
			{name = 'crosse3', label = 'Crosse', hash = `COMPONENT_AKS74U_STOCK_03`},
			{name = 'crosse4', label = 'Crosse', hash = `COMPONENT_AKS74U_STOCK_04`},
			{name = 'crosse5', label = 'Crosse', hash = `COMPONENT_AKS74U_STOCK_05`},
			-- Chargeur 
			-- {name = 'chargeur1', label = 'Chargeur', hash = `COMPONENT_AKS74U_STOCK_01`},
			-- {name = 'chargeur2', label = 'Chargeur', hash = `COMPONENT_AKS74U_STOCK_02`},
			-- {name = 'chargeur3', label = 'Chargeur', hash = `COMPONENT_AKS74U_STOCK_03`},
			-- {name = 'chargeur4', label = 'Chargeur', hash = `COMPONENT_AKS74U_STOCK_04`},
			-- {name = 'chargeur5', label = 'Chargeur', hash = `COMPONENT_AKS74U_STOCK_05`},
			-- Flashlights & Lasers
			{name = 'lumiere1', label = 'Lumière ou Lazer', hash = `COMPONENT_AKS74U_FLSH_01`},
			{name = 'lumiere2', label = 'Lumière ou Lazer', hash = `COMPONENT_AKS74U_FLSH_02`},
			{name = 'lumiere3', label = 'Lumière ou Lazer', hash = `COMPONENT_AKS74U_FLSH_03`},
			{name = 'lumiere4', label = 'Lumière ou Lazer', hash = `COMPONENT_AKS74U_FLSH_04`},
			{name = 'lumiere5', label = 'Lumière ou Lazer', hash = `COMPONENT_AKS74U_FLSH_05`},
			{name = 'lumiere6', label = 'Lumière ou Lazer', hash = `COMPONENT_AKS74U_FLSH_06`},
			{name = 'lumiere7', label = 'Lumière ou Lazer', hash = `COMPONENT_AKS74U_FLSH_07`},
			{name = 'lumiere8', label = 'Lumière ou Lazer', hash = `COMPONENT_AKS74U_FLSH_08`},
			{name = 'lumiere9', label = 'Lumière ou Lazer', hash = `COMPONENT_AKS74U_FLSH_09`},
			{name = 'lumiere10', label = 'Lumière ou Lazer', hash = `COMPONENT_AKS74U_FLSH_10`},
		}
	},

	{
		name = 'WEAPON_G17NEONOIR',
		label = 'Glock-17 Néo Noir',
		components = {}
	},

	{
		name = 'WEAPON_G17GEN5',
		label = 'Glock-17 Gen 5',
		components = {}
	},

	{
		name = 'WEAPON_M9BAYONNETLORE',
		label = 'M9 Bayonnet Lore',
		components = {}
	},

	{
		name = "WEAPON_TAZ",
		label = "Tazer LSPD",
		components = {}
	},
	{
		name = "WEAPON_GLOCK20",
		label = "Glock 20",
		components = {}
	},
	{
		name = "WEAPON_PELLE",
		label = "Pelle",
		components = {}
	},
	{
		name = "WEAPON_CANETTE",
		label = "Canette Jetable",
		components = {}
	},
	{
		name = "WEAPON_BRICK",
		label = "Brique Jetable",
		components = {}
	},
	{
		name = "WEAPON_BOUTEILLE",
		label = "Bouteille Cassé Jetable",
		components = {}
	},
	{
		name = "WEAPON_SLEDGEHAMMER",
		label = "Masse",
		components = {}
	},
	{
		name = "WEAPON_PICKAXE",
		label = "Pioche",
		components = {}
	},
	{
		name = "WEAPON_KATANA2",
		label = "Sabre Laser Rouge",
		components = {}
	},
	{
		name = "WEAPON_KATANA3",
		label = "Sabre Laser Vert",
		components = {}
	},
	{
		name = "WEAPON_KATANA4",
		label = "Katana Basique",
		components = {}
	},
	{
		name = "WEAPON_KATANA5",
		label = "Katana Ancien",
		components = {}
	},
	{
		name = "WEAPON_KATANA6",
		label = "Katana Ensanglanté",
		components = {}
	},
	{
		name = "WEAPON_TOZ",
		label = "TOZ",
		components = {}
	},
	{
		name = "WEAPON_PAINTBALL",
		label = "Paintball",
		components = {}
	},
	{
		name = "WEAPON_FLAMETHROWER",
		label = "Lance Flamme",
		components = {}
	},
	{
		name = "WEAPON_MOLETTE",
		label = "Clé à Molette",
		components = {}
	},
	{
		name = "WEAPON_GUITAR",
		label = "Guitare",
		components = {}
	},
	{
		name = "WEAPON_PLASMAP",
		label = "Pistolet Plasma",
		components = {}
	},
	{
		name = "WEAPON_WATERPISTOL",
		label = "Pistolet à eau",
		components = {}
	},
	{
		name = "WEAPON_RADARPISTOL",
		label = "Pistolet Radar",
		components = {}
	},
	{
		name = "WEAPON_UVLIGHT",
		label = "Lampe UV",
		components = {}
	},
	{
		name = "WEAPON_WATERING",
		label = "Arrosoir",
		components = {}
	},
	{
		name = "WEAPON_JREVOLVER",
		label = "Judge Revolver",
		components = {}
	},
	{
		name = "WEAPON_GLOCK",
		label = "Glock",
		components = {}
	},
	{
		name = "WEAPON_HK417",
		label = "HK417",
		components = {}
	},
	{
		name = "WEAPON_M9",
		label = "Pistolet M9",
		components = {}
	},
	{
		name = "WEAPON_OLD_SHOTGUN",
		label = "Fusil à pompe (usé)",
		components = {}
	},
	{
		name = "WEAPON_UZI",
		label = "Uzi",
		components = {}
	},
	{
		name = "WEAPON_AK",
		label = "AK",
		components = {}
	},
	{
		name = "WEAPON_SNUB",
		label = ".357 Revolver Snub",
		components = {}
	},
	{
		name = "WEAPON_HUNT",
		label = "Sauer 101 Fusil de chasse",
		components = {}
	},
	{
		name = "WEAPON_STUNGUN_02",
		label = "Tazer Vert",
		components = {}
	},
	{
		name = "WEAPON_MICHAELMYERS",
		label = "Couteau Ensanglanté",
		components = {}
	},
	{
		name = "WEAPON_LEATHERFACE_HATCHET",
		label = "Tronçonneuse Ensanglantée",
		components = {}
	},
	{
		name = "WEAPON_LEATHERFACE_HAMMER",
		label = "Marteau Ensanglanté",
		components = {}
	},
	{
		name = "WEAPON_JASONVOORHEES",
		label = "Machette Ensanglantée",
		components = {}
	},
	{
		name = "WEAPON_CHUCKY",
		label = "Tournevis Ensanglanté",
		components = {}
	},
	{
		name = "WEAPON_DARTHVADER",
		label = "Sabre Laser Darthvader",
		components = {}
	},
	{
		name = "WEAPON_SCYTHE",
		label = "Faux",
		components = {}
	},
	{
		name = "WEAPON_SECURITYCASE",
		label = "Mallette Sécurisée",
		components = {}
	},
	{
		name = "WEAPON_TOOLBOX",
		label = "Caisse à outils",
		components = {}
	},
	{
		name = "WEAPON_BUMBLEBEE",
		label = "Bourdon Lumineux",
		components = {}
	},
}

Config.AmmoPacks = {
    -- Upload this item into your database!
    ['9mm_magazine'] = {item = '9mm', amount = 12},
    ['12gauge_magazine'] = {item = '12gauge', amount = 25},
    ['556mm_magazine'] = {item = '556mm', amount = 30},
    ['762mm_magazine'] = {item = '762mm', amount = 30},
    ['68kal_magazine'] = {item = '68kal', amount = 30},
}

Config.Ammunition = {
    ['9mm'] = { -- Upload this item into your database!
        'WEAPON_PISTOL',
        'WEAPON_PISTOL_MK2',
        'WEAPON_COMBATPISTOL',
        'WEAPON_APPISTOL',
        'WEAPON_PISTOL50',
        'WEAPON_SNSPISTOL',
        'WEAPON_SNSPISTOL_MK2',
        'WEAPON_HEAVYPISTOL',
        'WEAPON_VINTAGEPISTOL',
        'WEAPON_MARKSMANPISTOL',
        'WEAPON_REVOLVER',
        'WEAPON_REVOLVER_MK2',
        'WEAPON_DOUBLEACTION',
        'WEAPON_CERAMICPISTOL',
        'WEAPON_NAVYREVOLVER',
        'WEAPON_GADGETPISTOL',
    },
    ['12gauge'] = { -- Upload this item into your database!
        'WEAPON_PUMPSHOTGUN',
        'WEAPON_PUMPSHOTGUN_MK2',
        'WEAPON_SAWNOFFSHOTGUN',
        'WEAPON_ASSAULTSHOTGUN',
        'WEAPON_BULLPUPSHOTGUN',
        'WEAPON_HEAVYSHOTGUN',
        'WEAPON_DBSHOTGUN',
        'WEAPON_AUTOSHOTGUN',
        'WEAPON_COMBATSHOTGUN',
    },
    ['556mm'] = { -- Upload this item into your database!
        'WEAPON_MICROSMG',
        'WEAPON_SMG',
        'WEAPON_SMG_MK2',
        'WEAPON_ASSAULTSMG',
        'WEAPON_COMBATPDW',
        'WEAPON_MACHINEPISTOL',
        'WEAPON_MINISMG',
    },
    ['762mm'] = { -- Upload this item into your database!
        'WEAPON_ASSAULTRIFLE',
        'WEAPON_ASSAULTRIFLE_MK2',
        'WEAPON_CARBINERIFLE',
        'WEAPON_CARBINERIFLE_MK2',
        'WEAPON_ADVANCEDRIFLE',
        'WEAPON_SPECIALCARBINE',
        'WEAPON_SPECIALCARBINE_MK2',
        'WEAPON_BULLPUPRIFLE',
        'WEAPON_BULLPUPRIFLE_MK2',
        'WEAPON_COMPACTRIFLE',
        'WEAPON_MILITARYRIFLE',
        'WEAPON_HEAVYRIFLE',
        'WEAPON_TACTICALRIFLE',
        'WEAPON_SNIPERRIFLE',
        'WEAPON_HEAVYSNIPER',
        'WEAPON_HEAVYSNIPER_MK2',
        'WEAPON_MARKSMANRIFLE',
        'WEAPON_MARKSMANRIFLE_MK2',
        'WEAPON_PRECISIONRIFLE',
		'WEAPON_AWPREDLINE',
		'WEAPON_AK47NEONRIDE',
		'WEAPON_VICTUSXMR',
    },
    ['68kal'] = { -- Upload this item into your database!
        'WEAPON_MUSKET',
        'WEAPON_MG',
        'WEAPON_COMBATMG',
        'WEAPON_COMBATMG_MK2',
        'WEAPON_GUSENBERG',
    },
}