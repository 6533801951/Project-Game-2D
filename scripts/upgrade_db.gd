extends Node

const ICON_PATH = "res://assert/sprite/skill/"
const UPGRADES = {
	"ammo_skill1":{
		"icon": ICON_PATH + "ammo_skill.png",
		"displayname": "more ammunition",
		"details": "Increase the number of bullets fired",
		"level": "Level: 1",
		"prerequisite":[],
		"type": "weapon"
	},
	"ammo_skill2":{
		"icon": ICON_PATH + "ammo_skill.png",
		"displayname": "more ammunition 2",
		"details": "Increase the number of bullets fired",
		"level": "Level: 2",
		"prerequisite":["ammo_skill1"],
		"type": "weapon"
	},
	"ammo_skill3":{
		"icon": ICON_PATH + "ammo_skill.png",
		"displayname": "more ammunition 3",
		"details": "Increase the number of bullets fired",
		"level": "Level: 3",
		"prerequisite":["ammo_skill2"],
		"type": "weapon"
	},
	"ammo_skill4":{
		"icon": ICON_PATH + "ammo_skill.png",
		"displayname": "more ammunition 4?",
		"details": "Increase the number of bullets fired again?",
		"level": "Level: 4",
		"prerequisite":["ammo_skill3"],
		"type": "weapon"
	},
	"attackspeed_skill1":{
		"icon": ICON_PATH + "attackspeed_skill.png",
		"displayname": "Additional ammo box",
		"details": "Increased firing speed",
		"level": "Level: 1",
		"prerequisite":[],
		"type": "weapon"
	},
	"attackspeed_skill2":{
		"icon": ICON_PATH + "attackspeed_skill.png",
		"displayname": "Additional ammo box 2",
		"details": "Increased firing speed",
		"level": "Level: 2",
		"prerequisite":["attackspeed_skill1"],
		"type": "weapon"
	},
	"attackspeed_skill3":{
		"icon": ICON_PATH + "attackspeed_skill.png",
		"displayname": "Additional ammo box 3",
		"details": "Increased firing speed",
		"level": "Level: 3",
		"prerequisite":["attackspeed_skill2"],
		"type": "weapon"
	},
	"attackspeed_skill4":{
		"icon": ICON_PATH + "attackspeed_skill.png",
		"displayname": "Extra Additional ammo box!!",
		"details": "Fastest ammo!!",
		"level": "Level: 4",
		"prerequisite":["attackspeed_skill3"],
		"type": "weapon"
	},
	"camera_skill1":{
		"icon": ICON_PATH + "camera_skill.png",
		"displayname": "Hawk Eye",
		"details": "Increased player visibility",
		"level": "Level: 1",
		"prerequisite":[],
		"type": "weapon"
	},
	"camera_skill2":{
		"icon": ICON_PATH + "camera_skill.png",
		"displayname": "Hawk Eye 2",
		"details": "Increased player visibility",
		"level": "Level: 2",
		"prerequisite":["camera_skill1"],
		"type": "weapon"
	},
	"damage_skill1":{
		"icon": ICON_PATH + "damage_skill.png",
		"displayname": "whey protein",
		"details": "Increases damage dealt",
		"level": "Level: 1",
		"prerequisite":[],
		"type": "weapon"
	},
	"damage_skill2":{
		"icon": ICON_PATH + "damage_skill.png",
		"displayname": "whey protein 2",
		"details": "Increases damage dealt",
		"level": "Level: 2",
		"prerequisite":["damage_skill1"],
		"type": "weapon"
	},
	"damage_skill3":{
		"icon": ICON_PATH + "damage_skill.png",
		"displayname": "whey protein 3",
		"details": "Increases damage dealt",
		"level": "Level: 3",
		"prerequisite":["damage_skill2"],
		"type": "weapon"
	},
	"damage_skill4":{
		"icon": ICON_PATH + "damage_skill.png",
		"displayname": "whey protein 4",
		"details": "POWERRRRRRR!!",
		"level": "Level: 4",
		"prerequisite":["damage_skill3"],
		"type": "weapon"
	},
	"expup_skill1":{
		"icon": ICON_PATH + "expup_skill.png",
		"displayname": "Memory Bread",
		"details": "Increase the amount of experience gained",
		"level": "Level: 1",
		"prerequisite":[],
		"type": "weapon"
	},
	"expup_skill2":{
		"icon": ICON_PATH + "expup_skill.png",
		"displayname": "Memory Bread from Farmhouse",
		"details": "Increase the amount of experience gained",
		"level": "Level: 2",
		"prerequisite":["expup_skill1"],
		"type": "weapon"
	},
	"heal_skill":{
		"icon": ICON_PATH + "heal_skill.png",
		"displayname": "First aid kit from Shopee",
		"details": "Heal item",
		"level": "Item",
		"prerequisite":[],
		"type": "item"
	},"maxhp_skill1":{
		"icon": ICON_PATH + "maxhp_skill.png",
		"displayname": "Custom-made armor",
		"details": "Increase maximum life force",
		"level": "Level: 1",
		"prerequisite":[],
		"type": "weapon"
	},"maxhp_skill2":{
		"icon": ICON_PATH + "maxhp_skill.png",
		"displayname": "Custom-made armor 2",
		"details": "Increase maximum life force",
		"level": "Level: 2",
		"prerequisite":["maxhp_skill1"],
		"type": "weapon"
	},"maxhp_skill3":{
		"icon": ICON_PATH + "maxhp_skill.png",
		"displayname": "Custom-made armor for you",
		"details": "Increase maximum life force",
		"level": "Level: 3",
		"prerequisite":["maxhp_skill2"],
		"type": "weapon"
	},
	"maxhp_skill4":{
		"icon": ICON_PATH + "maxhp_skill.png",
		"displayname": "Custom-made crispy pork armor",
		"details": "I am Invincible!!!",
		"level": "Level: 4",
		"prerequisite":["maxhp_skill3"],
		"type": "weapon"
	},
	"speedup_skill1":{
		"icon": ICON_PATH + "speedup_skill.png",
		"displayname": "Lighting Shoes",
		"details": "Increase movement speed",
		"level": "Level: 1",
		"prerequisite":[],
		"type": "weapon"		
	},
	"speedup_skill2":{
		"icon": ICON_PATH + "speedup_skill.png",
		"displayname": "Lighting Shoes 2",
		"details": "Increase movement speed",
		"level": "Level: 2",
		"prerequisite":["speedup_skill1"],
		"type": "weapon"		
	},
	"speedup_skill3":{
		"icon": ICON_PATH + "speedup_skill.png",
		"displayname": "Lighting Shoes 3",
		"details": "Increase movement speed",
		"level": "Level: 3",
		"prerequisite":["speedup_skill2"],
		"type": "weapon"		
	},
	"speedup_skill4":{
		"icon": ICON_PATH + "speedup_skill.png",
		"displayname": "Blue Lighting Shoes",
		"details": "I am the Flash!!",
		"level": "Level: 4",
		"prerequisite":["speedup_skill3"],
		"type": "weapon"		
	}
}
