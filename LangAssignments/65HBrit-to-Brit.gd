extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_calc_pressed():
	var pencepre = int($pence.text)
	var shillings = int($shillings.text)
	var shillings2 = shillings * 12
	var pounds = int($pounds.text)
	var pounds2 = pounds
	var pence = pencepre + shillings2 + pounds2
	var finalized = pence/100
	$Label.text = "Result: %.2f" % finalized

func _on_reset_pressed():
	$shillings.text = ""
	$pence.text = ""
	$pounds.text = ""
	$Label.text = ""


func _on_exit_pressed():
	get_tree().quit()
