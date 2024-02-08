/**
 * Turfs used across all p8 maps.
 */

/**
 * GROUND
 */
/turf/simulated/floor/p8/sand
	name = "Sand"
	desc = "Yellow and gritty."
	icon = 'icons/turf/desert.dmi'
	icon_state = "desert"
	initial_flooring = /decl/flooring/sand/desert
	outdoors = 1

/turf/simulated/floor/p8/sand/hyperion1
	P8_HYPERION1_SET_ATMOS

/turf/simulated/floor/p8/ironsand
	name = "iron sand"
	desc = "Red and gritty."
	icon = 'icons/turf/flooring/ironsand_vr.dmi'
	icon_state = "ironsand1"
	edge_blending_priority = 1
	initial_flooring = /decl/flooring/outdoors/ironsand
	outdoors = 1

/turf/simulated/floor/p8/ironsand/hyperion1
	P8_HYPERION1_SET_ATMOS

/turf/simulated/floor/p8/dirt
	name = "dirt"
	desc = "Brown and gritty."
	icon = 'icons/turf/flooring/asteroid.dmi'
	icon_state = "asteroid"
	edge_blending_priority = 1
	outdoors = 1

/turf/simulated/floor/p8/dirt/hyperion1
	P8_HYPERION1_SET_ATMOS

/**
 * WALLS
 */

/turf/simulated/wall/p8/sandstone
	name = "Sandy Rock"
	desc = "Hard, rocky sandstone."
	icon = 'icons/turf/walls.dmi'
	icon_state = "rock-light"
	alpha = 0xFF


/turf/simulated/wall/p8/sandstone/hyperion1
	P8_HYPERION1_SET_ATMOS
