extends Control

var current_unit = null

onready var cam = get_node("../Camera2D")
onready var u_inst = get_node("../terra/units")

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if Input.is_action_just_pressed("DT_unit_manager"):
		if is_visible():
			current_unit = null
			hide()
		else:
			show()
	if current_unit != null and (Input.is_action_pressed("DT_unit_add")):
		if Input.is_action_just_pressed("LKM"):
			u_inst.add_unit("Timofffee", current_unit, cam.get_global_mouse_pos())  

func _on_unit_select(u):
	current_unit = u