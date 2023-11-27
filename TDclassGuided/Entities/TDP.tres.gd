extends CharacterBody2D


const SPEED = 200.0
const MAX_OBT_HEALTH = 1000.0

@export var data = {
	"max_health":100.0,
	"health":100.0,
	"money":10,
}

var inertia = Vector2()
var look_direction = Vector2.DOWN  # (0, 1)

var menu_scene = preload("res://TDclassGuided/Assets/GUI.tscn")
var menu_instance = null

@onready var p_hud = get_tree().get_first_node_in_group("hud")

func pickup_health(value):
	data.health += value
	data.health = clamp(data.health, 0, data.max_health)

func pickup_money(value):
	data.money += value
func _ready():
	menu_instance = menu_scene.instantiate()
	get_tree().get_root().add_child.call_deferred(menu_instance)
	menu_instance.hide()

func _physics_process(delta):
	var direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	).normalized()  # Scale to 1 to prevent speed boost
	update_animation(direction)
	if direction.length() > 0:
		look_direction = direction
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2(), SPEED)
	
	velocity += inertia
	move_and_slide()
	inertia = inertia.move_toward(Vector2(), delta * 1000.0)
	
	if Input.is_action_just_pressed("ui_cancel"):
		menu_instance.show()
		get_tree().paused = true


func update_animation(direction):
	var a_name = "idle"  # Default
	if direction.length() > 0:
		look_direction = direction
		a_name = "side"
		if direction.x != 0:
			a_name = "side"
			$AnimatedSprite2D.flip_h = direction.x < 0
		elif direction.y < 0:
			a_name = "up"
		elif direction.y > 0:
			a_name = "side"
		$AnimatedSprite2D.play()
	else:
		if look_direction.x != 0:
			a_name = "idle"
			$AnimatedSprite2D.flip_h = look_direction.x < 0
		elif look_direction.y < 0:
			a_name = "idle"
		elif look_direction.y > 0:
			a_name = "idle"
			$AnimatedSprite2D.play()
	
	if $AnimatedSprite2D.animation != a_name:
		$AnimatedSprite2D.animation = a_name
		$AnimatedSprite2D.play()
