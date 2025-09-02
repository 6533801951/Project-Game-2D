extends ColorRect

@onready var lblname = $lbl_name
@onready var lbldescription = $lbl_description
@onready var lbllevel = $lbl_level
@onready var itemIcon = $ColorRect/ItemIcon

var mouse_over = false
var item = null
@onready var main = get_tree().get_first_node_in_group("main")

signal selected_upgrade(upgrade)

func _ready():
	connect("selected_upgrade",Callable(main,"upgrade_character"))
	if item == null:
		item = "heal_skill"
	lblname.text = UpgradeDb.UPGRADES[item]["displayname"]
	lbldescription.text = UpgradeDb.UPGRADES[item]["details"]
	lbllevel.text = UpgradeDb.UPGRADES[item]["level"]
	itemIcon.texture = load(UpgradeDb.UPGRADES[item]["icon"])
	
func _input(event: InputEvent):
	if event.is_action_pressed("shoot"):
		if mouse_over:
			emit_signal("selected_upgrade", item)
			
func _on_mouse_entered() -> void:
	mouse_over = true

func _on_mouse_exited() -> void:
	mouse_over = false
