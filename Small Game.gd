extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_red_pressed():
	$Display.text="Red"


func _on_blue_pressed():
	$Display.text="Blue"


func _on_green_pressed():
	$Display.text="Green"


func _on_yellow_pressed():
	$Display.text="Yellow"


func _on_clear_pressed():
	$Display.text=""
