extends KinematicBody2D

var navmesh : Navigation2D

export var speed = 100

var path
var desired = 1
var target = Vector2(400,400)


# Called when the node enters the scene tree for the first time.
func _ready():
	navmesh = get_parent().get_node("Navigation2D")	
	if not navmesh:
		print("ack")
	var world_target = get_parent().get_node("Target")
	if world_target:
		target = world_target.position

func get_new_path():
	path = navmesh.get_simple_path(position, target)
	
func _physics_process(delta):
	if not path:
		get_new_path()
	if path.empty():
		return
	if position.distance_to(path[0]) > desired:
		var dir = (path[0] - position).normalized()*speed*delta
		var hit = move_and_collide(dir, false)
		if hit:
			get_new_path()
	else:
		path.remove(0)
	
