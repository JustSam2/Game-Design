extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_clear_btn_pressed():
	$ResultLBL.text = ""
	$HeightLE.text = ""
	$WidthLE.text = ""
	var height = 0
	var width = 0


func _on_exit_btn_pressed():
	get_tree().quit()


func _on_calc_btn_pressed():
	var height = int($HeightLE.text)
	var width = int($WidthLE.text)
	var Result = width * height
	var perimeter = (width * 2) + (height * 2)
	$ResultLBL.text = "Area = %.2f"% Result
	$ResultLBL2.text = "Perimeter = %.2f"% perimeter
	
