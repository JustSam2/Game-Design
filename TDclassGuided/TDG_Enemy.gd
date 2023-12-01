extends CharacterBody2D



enum STATES {IDLE=0, UP, DOWN, LEFT, RIGHT, UPLEFT, UPRIGHT, DOWNLEFT, DOWNRIGHT, DAMAGED }



const SPEED = 60.0
var max_health: float = 30.0
var health = max_health
var damage = 10.0
var ai_state = STATES.IDLE

var inertia = Vector2()
var ai_timer_max = 0.5
var ai_timer = ai_timer_max - randi() % 5
var damage_lock = 0.0
var animation_lock = 0.0
var knockback = 128.0
var vision_dist = 145.0
var money_value = 5

signal recovered
@onready var rcl = $RCL
@onready var rcm = $RCM
@onready var rcr = $RCR

var state_directions = [
	Vector2.ZERO,
	Vector2.UP,
	Vector2.DOWN,
	Vector2.LEFT,
	Vector2.RIGHT,
	Vector2(-1, -1).normalized(), #up left
	Vector2(1, -1).normalized(), #up right
	Vector2(-1, 1).normalized(), #down left
	Vector2(1, 1).normalized(), #down right
	Vector2.ZERO
]

func turn_toward_player_location(location: Vector2):
	#set state to move toward player
	var dir_to_player = (location - global_position).normalized()
	velocity = dir_to_player * (SPEED * 3)
	var closest_angle = INF
	var closest_state = STATES.IDLE
	for i in range(1,5):
		var state_dir = state_directions[i]
		var angle_diff = abs(state_dir.angle_to(dir_to_player))
		if angle_diff < closest_angle:
			closest_angle = angle_diff
			closest_state = STATES.values()[i]
		ai_state = closest_state

func take_damage(dmg, attacker=null):
	if damage_lock == 0.0:
		ai_state = STATES.DAMAGED
		health -= damage
		damage_lock = 0.2
		animation_lock = 0.2
		#todo damage_intensity and shader
		if health <= 0:
			#play sound and die
			queue_free()
		else:
			if attacker != null:
				var location = attacker.global_position
				await recovered
				turn_toward_player_location(location)
	pass

func _physics_process(delta):
	animation_lock = max(animation_lock - delta, 0.0)
	damage_lock = max(damage_lock - delta, 0.0)
	if int(ai_state) >= 1 and int(ai_state) <= 8:
		var raydir = state_directions[int(ai_state)]
		rcm.target_position = raydir * vision_dist
		rcl.target_position = raydir.rotated(deg_to_rad(-45)).normalized() * vision_dist
		rcr.target_position = raydir.rotated(deg_to_rad(45)).normalized() * vision_dist
	if animation_lock == 0:
		if ai_state == STATES.DAMAGED:
			ai_state = STATES.IDLE
			recovered.emit()
		for player in get_tree().get_nodes_in_group("Player"):
			if $attackbox.overlaps_area(player):
				if player.damage_lock == 0.0:
					player.inertia = (player.global_position - global_position).normalized() * knockback
					player.take_damage(damage)
				else:
					return
			if player.data.state != player.STATES.DEAD:
				if (rcl.is_colliding() and rcl.get_collider() == player) or (rcm.is_colliding() and rcm.get_collider() == player) or (rcr.is_colliding() and rcr.get_collider() == player):
					turn_toward_player_location(player.global_position)
	ai_timer = clamp(ai_timer - delta, 0.0, ai_timer_max)
	if ai_timer == 0.0:
		if ai_state == STATES.IDLE:
			var rnd_move = randi() % 4
			ai_state = STATES.values()[rnd_move + 1]
		
		var direction = state_directions[int(ai_state)]
		velocity = direction * SPEED
		
		#reminder; walk animations
		
		velocity += inertia.move_toward(Vector2(), delta * 1000.0)


















