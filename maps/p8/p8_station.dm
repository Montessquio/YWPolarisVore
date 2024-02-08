/**
 * Data definitions for Phoenix-8, the NT Station on Hyperion-1.
 */


/datum/map/p8
	name = "Phoenix-8"
	full_name = "NSB Phoenix-8"
	path = "p8"

	zlevel_datum_type = /datum/map_z_level/p8
	planet_datums_to_make = list(/datum/planet/hyperion1)

	use_overmap = TRUE
	overmap_z = Z_LEVEL_P8_MISC
	overmap_size = 25
	overmap_event_areas = 18

	usable_email_tlds = list("p8.nt")
	lobby_icon = 'icons/misc/title_p8.dmi'
	lobby_screens = list("p8")
	id_hud_icons = 'icons/mob/hud_jobs_vr.dmi'

	holomap_smoosh = list(list(
		Z_LEVEL_P8_MINES,
		Z_LEVEL_P8_GROUND_1B,
		Z_LEVEL_P8_GROUND_1F,
		Z_LEVEL_P8_GROUND_2F,
		Z_LEVEL_P8_GROUND_3F,
		Z_LEVEL_CRYOGAIA_MAIN
	))

	facility_type = "Outpost"
	station_name  = "Phoenix-8"
	station_short = "P8"
	dock_name     = "NCS Theianos"
	boss_name     = "Central Command"
	boss_short    = "CentCom"
	company_name  = "NanoTrasen"
	company_short = "NT"
	starsys_name  = "Hyperion"

	shuttle_docked_message = "The scheduled Shuttle to %dock_name% has arrived. It will depart in approximately %ETD%."
	shuttle_leaving_dock = "The Shuttle has left the Outpost. Estimate %ETA% until the shuttle arrives at %dock_name%."
	shuttle_called_message = "A scheduled crew transfer to %dock_name% is occuring. The shuttle will be arriving shortly. Those departing should proceed to the shuttle docking station within %ETA%."
	shuttle_recall_message = "The scheduled crew transfer has been cancelled."
	shuttle_name = "NAS |Amphora|"
	emergency_shuttle_docked_message = "The evacuation shuttle has arrived at the shuttle docking station. You have approximately %ETD% to board the shuttle."
	emergency_shuttle_leaving_dock = "The emergency shuttle has left the station. Estimate %ETA% until the shuttle arrives at %dock_name%."
	emergency_shuttle_called_message = "An emergency evacuation has begun, and an off-schedule shuttle has been called. It will arrive at the shuttle docking station in approximately %ETA%."
	emergency_shuttle_recall_message = "The evacuation shuttle has been recalled."

	station_networks = list(
							NETWORK_CARGO,
							NETWORK_CIRCUITS,
							NETWORK_CIVILIAN,
							NETWORK_COMMAND,
							NETWORK_CRYOGAIA,
							NETWORK_ENGINE,
							NETWORK_ENGINEERING,
							NETWORK_SUBSTATIONS,
							NETWORK_EXPLORATION,
							NETWORK_DEFAULT,
							NETWORK_MEDICAL,
							NETWORK_MINE,
							NETWORK_OUTSIDE,
							NETWORK_RESEARCH,
							NETWORK_RESEARCH_OUTPOST,
							NETWORK_ROBOTS,
							NETWORK_PRISON,
							NETWORK_SECURITY,
							NETWORK_INTERROGATION,
							NETWORK_TCOMMS
							)

	secondary_networks = list(
							NETWORK_ERT,
							NETWORK_MERCENARY,
							NETWORK_THUNDER,
							NETWORK_COMMUNICATORS,
							NETWORK_ALARM_ATMOS,
							NETWORK_ALARM_POWER,
							NETWORK_ALARM_FIRE,
							NETWORK_TALON_HELMETS,
							NETWORK_TALON_SHIP
							)

	allowed_spawns = list("Arrivals Shuttle", "Tram Station", "Cryogenic Storage", "Cyborg Storage", "NCS Theianos Residential", "NSB Phoenix-8 Residential", "ITV Talon Cryo")
	spawnpoint_died = /datum/spawnpoint/tram
	spawnpoint_left = /datum/spawnpoint/tram
	spawnpoint_stayed = /datum/spawnpoint/cryo

	meteor_strike_areas = list(
		/area/p8/outdoors/grounds
		/area/p8/outdoors/exterior
	)

	ai_shell_restricted = TRUE
	ai_shell_allowed_levels = list(
		Z_LEVEL_P8_ORBITAL_WORKSPACE,
		Z_LEVEL_P8_GROUND_3F,
		Z_LEVEL_P8_GROUND_2F,
		Z_LEVEL_P8_GROUND_1F,
		Z_LEVEL_P8_GROUND_1B,
		Z_LEVEL_P8_UNDERGROUND,
		Z_LEVEL_P8_MINES
	)

	lateload_z_levels = list(
		list("VR World")
	)


	lateload_redgate = list(
		list("Redgate - Teppi Ranch"),
		list("Redgate - Innland"),
//		list("Redgate - Abandoned Island"),	//This will come back later
		list("Redgate - Dark Adventure"),
		list("Redgate - Eggnog Town Underground","Redgate - Eggnog Town"),
		list("Redgate - Star Dog"),
		list("Redgate - Hotsprings"),
		list("Redgate - Rain City"),
		list("Redgate - Islands Underwater","Redgate - Islands"),
		list("Redgate - Moving Train", "Redgate - Moving Train Upper Level"),
		list("Redgate - Fantasy Dungeon", "Redgate - Fantasy Town"),
		list("Redgate - Laserdome"),
		list("Redgate - Cascading Falls")
	)

/datum/map_z_level/p8/main
	z = Z_LEVEL_P8_GROUND_1F
	name = "Surface Level"
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_SEALED|MAP_LEVEL_PERSIST
	base_turf = /turf/simulated/open
