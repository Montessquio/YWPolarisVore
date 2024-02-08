/**
 * Data definitions for Hyperion-1, the main planet of the system that houses P8.
 */

/datum/planet/hyperion1
	expected_z_levels = list(
		Z_LEVEL_P8_GROUND_3F,
		Z_LEVEL_P8_GROUND_2F,
		Z_LEVEL_P8_GROUND_1F,
		Z_LEVEL_P8_GROUND_1B,
		Z_LEVEL_P8_UNDERGROUND,
		Z_LEVEL_P8_MINES,
		Z_LEVEL_P8_MAGMASEA,
		Z_LEVEL_P8_MISC,
		Z_LEVEL_P8_GROUND_NORTH,
		Z_LEVEL_P8_GROUND_EAST,
		Z_LEVEL_P8_GROUND_SOUTH,
		Z_LEVEL_P8_GROUND_WEST,
		Z_LEVEL_P8_GROUND_RESIDENTIAL_2F,
		Z_LEVEL_P8_GROUND_RESIDENTIAL_1F
	)

// Overmap represetation of P8
/obj/effect/overmap/visitable/sector/hyperion1
	name = "Hyperion-1"
	desc = "A dry, dusty desert of a planet."
	scanner_desc = @{"[i]Registration[/i]: NSB Phoenix-8
[i]Class[/i]: Installation
[i]Transponder[/i]: Transmitting (CIV), NanoTrasen IFF
[b]Notice[/b]: NanoTrasen Colony, authorized personnel only"}
	base = TRUE
	icon_state = "globe"
	color = "#00AAFF"
	initial_generic_waypoints = list(
		"p8_excursion_hangar",
		"p8_security_hangar",
	)
	//Despite not being in the multi-z complex, these levels are part of the overmap sector
	extra_z_levels = list(
		Z_LEVEL_P8_GROUND_NORTH,
		Z_LEVEL_P8_GROUND_EAST,
		Z_LEVEL_P8_GROUND_SOUTH,
		Z_LEVEL_P8_GROUND_WEST,
		Z_LEVEL_P8_GROUND_RESIDENTIAL_2F,
		Z_LEVEL_P8_GROUND_RESIDENTIAL_1F
	)

	levels_for_distress = list(Z_LEVEL_OFFMAP1, Z_LEVEL_BEACH, Z_LEVEL_AEROSTAT, Z_LEVEL_DEBRISFIELD, Z_LEVEL_FUELDEPOT)
	var/mob_announce_cooldown = 0

/obj/effect/overmap/visitable/sector/hyperion1/Crossed(var/atom/movable/AM)
	. = ..()
	announce_atc(AM,going = FALSE)

/obj/effect/overmap/visitable/sector/hyperion1/Uncrossed(var/atom/movable/AM)
	. = ..()
	announce_atc(AM,going = TRUE)


/obj/effect/overmap/visitable/sector/hyperion1/proc/announce_atc(var/atom/movable/AM, var/going = FALSE)
	if(istype(AM, /obj/effect/overmap/visitable/ship/simplemob))
		if(world.time < mob_announce_cooldown)
			return
		else
			mob_announce_cooldown = world.time + 5 MINUTES
	var/message = "Sensor contact for vessel '[AM.name]' has [going ? "left" : "entered"] ATC control area."
	//For landables, we need to see if their shuttle is cloaked
	if(istype(AM, /obj/effect/overmap/visitable/ship/landable))
		var/obj/effect/overmap/visitable/ship/landable/SL = AM //Phew
		var/datum/shuttle/autodock/multi/shuttle = SSshuttles.shuttles[SL.shuttle]
		if(!istype(shuttle) || !shuttle.cloaked) //Not a multishuttle (the only kind that can cloak) or not cloaked
			atc.msg(message)

	//For ships, it's safe to assume they're big enough to not be sneaky
	else if(istype(AM, /obj/effect/overmap/visitable/ship))
		atc.msg(message)

/obj/effect/overmap/visitable/sector/hyperion1/get_space_zlevels()
	return list() //None!


/**
 * Helper Macros for defining planetary stuff
 */

//Atmosphere properties
#define P8_HYPERION1_ONE_ATMOSPHERE	101.13 //kPa
#define P8_HYPERION1_AVG_TEMP	233.15 //kelvin

#define P8_HYPERION1_PER_N2		0.79 //percent
#define P8_HYPERION1_PER_O2		0.23
#define P8_HYPERION1_PER_N2O	0.00 //Currently no capacity to 'start' a turf with this. See turf.dm
#define P8_HYPERION1_PER_CO2	0.02
#define P8_HYPERION1_PER_PHORON	0.00

//Math only beyond this point
#define P8_HYPERION1_MOL_PER_TURF	(P8_HYPERION1_ONE_ATMOSPHERE*CELL_VOLUME/(P8_HYPERION1_AVG_TEMP*R_IDEAL_GAS_EQUATION))
#define P8_HYPERION1_MOL_N2			(P8_HYPERION1_MOL_PER_TURF * P8_HYPERION1_PER_N2)
#define P8_HYPERION1_MOL_O2			(P8_HYPERION1_MOL_PER_TURF * P8_HYPERION1_PER_O2)
#define P8_HYPERION1_MOL_N2O		(P8_HYPERION1_MOL_PER_TURF * P8_HYPERION1_PER_N2O)
#define P8_HYPERION1_MOL_CO2		(P8_HYPERION1_MOL_PER_TURF * P8_HYPERION1_PER_CO2)
#define P8_HYPERION1_MOL_PHORON		(P8_HYPERION1_MOL_PER_TURF * P8_HYPERION1_PER_PHORON)

//Turfmakers
#define P8_HYPERION1_SET_ATMOS			nitrogen=P8_HYPERION1_MOL_N2;oxygen=P8_HYPERION1_MOL_O2;carbon_dioxide=P8_HYPERION1_MOL_CO2;phoron=P8_HYPERION1_MOL_PHORON;temperature=P8_HYPERION1_AVG_TEMP
#define P8_HYPERION1_TURF_CREATE(x)		x/P8_HYPERION1/nitrogen=P8_HYPERION1_MOL_N2;x/P8_HYPERION1/oxygen=P8_HYPERION1_MOL_O2;x/P8_HYPERION1/carbon_dioxide=P8_HYPERION1_MOL_CO2;x/P8_HYPERION1/phoron=P8_HYPERION1_MOL_PHORON;x/P8_HYPERION1/temperature=P8_HYPERION1_AVG_TEMP;x/P8_HYPERION1/outdoors=TRUE;x/P8_HYPERION1/update_graphic(list/graphic_add = null, list/graphic_remove = null) return 0
#define P8_HYPERION1_TURF_CREATE_UN(x)	x/P8_HYPERION1/nitrogen=P8_HYPERION1_MOL_N2;x/P8_HYPERION1/oxygen=P8_HYPERION1_MOL_O2;x/P8_HYPERION1/carbon_dioxide=P8_HYPERION1_MOL_CO2;x/P8_HYPERION1/phoron=P8_HYPERION1_MOL_PHORON;x/P8_HYPERION1/temperature=P8_HYPERION1_AVG_TEMP

// This is a wall you surround the area of your "planet" with, that makes the atmosphere inside stay within bounds, even if canisters
// are opened or other strange things occur.
/turf/unsimulated/wall/planetary/hyperion1
	name = "Sandy Rock"
	desc = "Hard Rock that seems to be stronger then most manmade structures."
	icon = 'icons/turf/walls.dmi'
	icon_state = "rock-light"
	alpha = 0xFF
	P8_HYPERION1_SET_ATMOS

//Code below is to get rid of build errors in regard to virgo code and is not used by P8
/turf/unsimulated/wall/planetary/virgo3b
	name = "facility wall"
	desc = "An eight-meter tall carbyne wall. For when the wildlife on your planet is mostly militant megacorps."
	alpha = 0xFF
	VIRGO3B_SET_ATMOS
