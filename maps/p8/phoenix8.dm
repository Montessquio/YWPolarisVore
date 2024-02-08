#if !defined(USING_MAP_DATUM)
	/* CORE */
	#include "p8_defines.dm"	// Core #DEFINE directives, contains no code
	#include "p8_station.dm"	// The station itself

	#include "p8_hyperion1.dm" 	// The planet P8 Station is on.

	#include "p8_turfs.dm"
	#include "p8_jobs.dm"
	#include "job/outfits.dm"
	#include "job/outfits_yw.dm"
	#include "p8_things.dm"
	#include "tether_phoronlock.dm"
	#include "p8_areas.dm"
	#include "p8_shuttle_defs.dm"
	#include "p8_shuttles.dm"
	#include "p8_telecomms.dm"
	#include "elevator_areas.dm"
	#include "service_elevator_things.dm"
	#include "residential/_residential.dm"
	#include "residential/residential_keys.dm"
	#include "../offmap_vr/common_offmaps.dm"
	#include "yw_vrstuff/_vrmaps.dm"

	#if !AWAY_MISSION_TEST
		// #include "p8-1-orbital_workspace.dmm"
		// #include "p8-2-orbital_residential.dmm"
		// #include "p8-3-ground_3f.dmm"
		// #include "p8-4-ground_2f.dmm"
		#include "p8-5-ground_1f.dmm"
		// #include "p8-6-ground_1b.dmm"
		// #include "p8-7-underground.dmm"
		// #include "p8-8-mines.dmm"
		// #include "p8-9-magmasea.dmm"
		// #include "p8-7-misc.dmm"
		// #include "p8-18-ground_north.dmm"
		// #include "p8-19-ground_east.dmm"
		// #include "p8-20-ground_south.dmm"
		// #include "p8-21-ground_west.dmm"
		// #include "p8-22-ground_residential_2f.dmm"
		// #include "p8-23-ground_residential_1f.dmm"
	#endif

	#include "submaps/_p8_submaps.dm"

	#define USING_MAP_DATUM /datum/map/p8

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Phoenix-8

#endif
