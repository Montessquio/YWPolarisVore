//Moved from southern_cross_jobs.vr to fix a runtime
var/const/access_explorer = 43
/datum/access/explorer
	id = access_explorer
	desc = "Explorer"
	region = ACCESS_REGION_GENERAL

var/const/access_pilot = 67
/datum/access/pilot
	id = access_pilot
	desc = "Pilot"
	region = ACCESS_REGION_SUPPLY

/var/const/access_talon = 301
/datum/access/talon
	id = access_talon
	desc = "Talon"
	access_type = ACCESS_TYPE_PRIVATE

/var/const/access_xenobotany = 77
/datum/access/xenobotany
	id = access_xenobotany
	desc = "Xenobotany Garden"
	region = ACCESS_REGION_RESEARCH

/var/const/access_entertainment = 72
/datum/access/entertainment
	id = access_entertainment
	desc = "Entertainment Backstage"
	region = ACCESS_REGION_GENERAL