extends CanvasLayer

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var hearts = $player_status/heart
const heart_row_size = 10
const heart_offset = 16

func create_heart():
	var n_heart = Sprite2D.new()
	n_heart.texture = hearts.texture
	n_heart.hframes = hearts.hframes
	n_heart.vframes = hearts.vframes
	n_heart.frame = 8
	hearts.add_child(n_heart)

func draw_hearts():
	for heart in hearts.get_children():
		hearts.remove_child(heart)
	for i in range(int(player.data.max_health)/20):
		create_heart()
func _ready():
	draw_hearts()
	pass



func _process(delta):
	var p_health = player.data.health
	var full_hearts = floor(p_health / 20)
	var remainder = int(p_health) % 20
	
	for heart in hearts.get_children():
		var index = heart.get_index()
		var x = (index % heart_row_size) * heart_offset
		var y = (index / heart_row_size) * heart_offset
		heart.position = Vector2(x,y)
		
		# Frame 8 empty, Frame 7 for 1/4, frame 6 for half, frame5 for 3/4, frame 4 for full
		if index > full_hearts:
			heart.frame = 8
		elif index == full_hearts:
			heart.frame = 8 - int(remainder / 5)
		elif index < full_hearts:
			heart.frame = 4
	pass
