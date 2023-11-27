extends RigidBody2D


func _ready():
	$"../Panel/GravSlider".value = $phys_ball.gravity_scale

func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var nball = preload("res://physball.tscn").instantiate()
		nball.position = event.position
		add_child(nball)

func _on_h_slider_value_changed(value):
	for child in get_children():
		if child is RigidBody2D:
			child.gravity_scale = value

func _on_acf_pressed():
	for child in get_children():
		if child is RigidBody2D:
			child.apply_central_force(Vector2.RIGHT * 500)

func _on_apply_pressed():
	var inertia = float($"../Panel/Inertia".text)
	var VX = float($"../Panel/Velocityx".text)
	var VY = float($"../Panel/Velocityy".text)
	var velocity = Vector2(VX , VY)
	for child in get_children():
		if child is RigidBody2D:
			child.inertia = inertia
			child.linear_velocity = velocity
