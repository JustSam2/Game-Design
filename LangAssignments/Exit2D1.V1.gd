extends Area2D

@export var next_level = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "kbdplayer":
		body.queue_free()
		OS.alert("you win")
		var lvl = "res://" + next_level + ".tscn"
		get_tree().change_scene_to_file(lvl)
