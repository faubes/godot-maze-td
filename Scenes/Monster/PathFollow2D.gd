extends PathFollow2D

var Monster = preload("res://Scenes/Monster/BaseMonster.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var t = 0.0
export var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(5):
		var monster = Monster.instance()
		add_child(monster)

func _physics_process(delta):
	t+= delta*speed
	set_offset(t)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
