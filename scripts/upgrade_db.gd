extends Node

const ICON_PATH = "res://assert/sprite/skill/"
const UPGRADES = {
	"ammo_skill1":{
		"icon": ICON_PATH + "ammo_skill.png",
		"displayname": "กระสุนลูกปลาย",
		"details": "เพิ่มจำนวนกระสุนที่ยิงออกไป",
		"level": "Level: 1",
		"prerequisite":[],
		"type": "weapon"
	},
	"ammo_skill2":{
		"icon": ICON_PATH + "ammo_skill.png",
		"displayname": "กระสุนลูกปลาย 2",
		"details": "เพิ่มจำนวนกระสุนที่ยิงออกไป",
		"level": "Level: 2",
		"prerequisite":["ammo_skill1"],
		"type": "weapon"
	},
	"ammo_skill3":{
		"icon": ICON_PATH + "ammo_skill.png",
		"displayname": "กระสุนลูกปลาย 3",
		"details": "เพิ่มจำนวนกระสุนที่ยิงออกไป",
		"level": "Level: 3",
		"prerequisite":["ammo_skill2"],
		"type": "weapon"
	},
	"ammo_skill4":{
		"icon": ICON_PATH + "ammo_skill.png",
		"displayname": "กระสุนลูกปลาย 4?",
		"details": "เพิ่มจำนวนกระสุน...ยังอยากเพิ่มอีกหรอ",
		"level": "Level: 4",
		"prerequisite":["ammo_skill3"],
		"type": "weapon"
	},
	"attackspeed_skill1":{
		"icon": ICON_PATH + "attackspeed_skill.png",
		"displayname": "กล่องกระสุนเพิ่มเติม",
		"details": "เพิ่มความเร็วในการยิงมากขึ้น",
		"level": "Level: 1",
		"prerequisite":[],
		"type": "weapon"
	},
	"attackspeed_skill2":{
		"icon": ICON_PATH + "attackspeed_skill.png",
		"displayname": "กล่องกระสุนเพิ่มเติม 2",
		"details": "เพิ่มความเร็วในการยิงมากขึ้น",
		"level": "Level: 2",
		"prerequisite":["attackspeed_skill1"],
		"type": "weapon"
	},
	"attackspeed_skill3":{
		"icon": ICON_PATH + "attackspeed_skill.png",
		"displayname": "กล่องกระสุนเพิ่มเติม 3",
		"details": "เพิ่มความเร็วในการยิงมากขึ้น",
		"level": "Level: 3",
		"prerequisite":["attackspeed_skill2"],
		"type": "weapon"
	},
	"attackspeed_skill4":{
		"icon": ICON_PATH + "attackspeed_skill.png",
		"displayname": "กล่องกระสุนเพิ่มเติมมมมม!!",
		"details": "เร็ว..ต้องเร็วกว่านี้!!",
		"level": "Level: 4",
		"prerequisite":["attackspeed_skill3"],
		"type": "weapon"
	},
	"camera_skill1":{
		"icon": ICON_PATH + "camera_skill.png",
		"displayname": "ตาเหยี่ยว",
		"details": "เพิ่มระยะการมองเห็นของผู้เล่น",
		"level": "Level: 1",
		"prerequisite":[],
		"type": "weapon"
	},
	"camera_skill2":{
		"icon": ICON_PATH + "camera_skill.png",
		"displayname": "ตาเหยี่ยว 2",
		"details": "เพิ่มระยะการมองเห็นของผู้เล่นให้เห็นนอกแผนที่",
		"level": "Level: 2",
		"prerequisite":["camera_skill1"],
		"type": "weapon"
	},
	"damage_skill1":{
		"icon": ICON_PATH + "damage_skill.png",
		"displayname": "เวย์โปรตีน",
		"details": "เพิ่มความเสียหายที่ทำได้",
		"level": "Level: 1",
		"prerequisite":[],
		"type": "weapon"
	},
	"damage_skill2":{
		"icon": ICON_PATH + "damage_skill.png",
		"displayname": "เวย์โปรตีน 2",
		"details": "เพิ่มความเสียหายที่ทำได้",
		"level": "Level: 2",
		"prerequisite":["damage_skill1"],
		"type": "weapon"
	},
	"damage_skill3":{
		"icon": ICON_PATH + "damage_skill.png",
		"displayname": "เวย์โปรตีน 3",
		"details": "เพิ่มความเสียหายที่ทำได้",
		"level": "Level: 3",
		"prerequisite":["damage_skill2"],
		"type": "weapon"
	},
	"damage_skill4":{
		"icon": ICON_PATH + "damage_skill.png",
		"displayname": "เวย์โปรตีน 4",
		"details": "POWERRRRRRR!!",
		"level": "Level: 4",
		"prerequisite":["damage_skill3"],
		"type": "weapon"
	},
	"expup_skill1":{
		"icon": ICON_PATH + "expup_skill.png",
		"displayname": "ขนมปังช่วยจำ",
		"details": "เพิ่มจำนวนประสบการณ์ที่ได้รับ",
		"level": "Level: 1",
		"prerequisite":[],
		"type": "weapon"
	},
	"expup_skill2":{
		"icon": ICON_PATH + "expup_skill.png",
		"displayname": "ขนมปังช่วยจำ ฟาร์มเฮ้าส์",
		"details": "เพิ่มจำนวนประสบการณ์ที่ได้รับมากกว่าเดิม",
		"level": "Level: 2",
		"prerequisite":["expup_skill1"],
		"type": "weapon"
	},
	"heal_skill":{
		"icon": ICON_PATH + "heal_skill.png",
		"displayname": "กล่องพยาบาลจาก Shopee",
		"details": "รักษาอาการบาดเจ็บ",
		"level": "Item",
		"prerequisite":[],
		"type": "item"
	},"maxhp_skill1":{
		"icon": ICON_PATH + "maxhp_skill.png",
		"displayname": "เกราะสั่งทำพิเศษ",
		"details": "เพิ่มจำนวนพลังชีวิตสูงสุด",
		"level": "Level: 1",
		"prerequisite":[],
		"type": "weapon"
	},"maxhp_skill2":{
		"icon": ICON_PATH + "maxhp_skill.png",
		"displayname": "เกราะสั่งทำพิเศษใส่ไข่",
		"details": "เพิ่มจำนวนพลังชีวิตสูงสุด",
		"level": "Level: 2",
		"prerequisite":["maxhp_skill1"],
		"type": "weapon"
	},"maxhp_skill3":{
		"icon": ICON_PATH + "maxhp_skill.png",
		"displayname": "เกราะสั่งทำพิเศษใส่ไขนกกระทา",
		"details": "เพิ่มจำนวนพลังชีวิตสูงสุด",
		"level": "Level: 3",
		"prerequisite":["maxhp_skill2"],
		"type": "weapon"
	},
	"maxhp_skill4":{
		"icon": ICON_PATH + "maxhp_skill.png",
		"displayname": "เกราะสั่งทำพิเศษหมูกรอบ",
		"details": "อมตะ!!!",
		"level": "Level: 4",
		"prerequisite":["maxhp_skill3"],
		"type": "weapon"
	},
	"speedup_skill1":{
		"icon": ICON_PATH + "speedup_skill.png",
		"displayname": "รองเท้าสายไฟ",
		"details": "เพิ่มความเร็วในการเคลื่อนที่",
		"level": "Level: 1",
		"prerequisite":[],
		"type": "weapon"		
	},
	"speedup_skill2":{
		"icon": ICON_PATH + "speedup_skill.png",
		"displayname": "รองเท้าสายไฟ 2",
		"details": "เพิ่มความเร็วในการเคลื่อนที่",
		"level": "Level: 2",
		"prerequisite":["speedup_skill1"],
		"type": "weapon"		
	},
	"speedup_skill3":{
		"icon": ICON_PATH + "speedup_skill.png",
		"displayname": "รองเท้าสายไฟ 3",
		"details": "เพิ่มความเร็วในการเคลื่อนที่",
		"level": "Level: 3",
		"prerequisite":["speedup_skill2"],
		"type": "weapon"		
	},
	"speedup_skill4":{
		"icon": ICON_PATH + "speedup_skill.png",
		"displayname": "รองเท้าสายไฟสีแดง",
		"details": "I am the Flash!!",
		"level": "Level: 4",
		"prerequisite":["speedup_skill3"],
		"type": "weapon"		
	}
}
