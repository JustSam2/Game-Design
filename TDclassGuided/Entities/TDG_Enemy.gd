extends CharacterBody2D



enum STATES {IDLE=0, DAMAGED, UP, LEFT, RIGHT, UPLEFT, UPRIGHT, DOWNLEFT, DOWNRIGHT}



const SPEED = 300.0
var max_health: float = 30.0
var health = max_health
var damage = 10.0
var ai_state = STATES.IDLE

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


