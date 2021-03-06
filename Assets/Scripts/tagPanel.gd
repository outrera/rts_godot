extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var font_color = Color(0,0,0)
var tr_Army = 'Army'
onready var cam = get_node('../../Camera2D')
onready var units = get_node('../../world/units')
onready var control = get_node('../../Control')
onready var tags_grid = get_node('Panel/ScrollContainer/GridContainer')

func _ready():
	upd_tags()

func upd_tags():
	for button in tags_grid.get_children():
		button.free()
		
	for tag in units.get_tags(units.get_children()):
		if not (tag in [null,-1]):
			var button = Button.new()
			button.set_name(str(tag))
			button.set_text(tr_Army + ' ' + str(tag + 1))
			button.set_flat(true)
			button.add_color_override("font_color", font_color)
			tags_grid.add_child(button)
			button.connect("pressed", self, "_on_tag_select", [tag])
	update()
		
func _on_tag_select(tag):
	print(tag)
	for unit in units.get_children():
		unit.unselect()
		
	for unit in units.get_children():
		if unit.tag == tag:
			unit.select()



