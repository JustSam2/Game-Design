extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_calc_btn_pressed():
	var Radius = int($RadiusLE.text)
	var ResultArea = (Radius * Radius) * 3.14
	var ResultPerimeter = (Radius * 2) * 3.14
	$ResultLBL.text = "Area = %.2f"% ResultArea
	$ResultLBL2.text = "Perimeter = %.2f"% ResultPerimeter
	

func _on_exit_btn_pressed():
	get_tree().quit()


func _on_clear_btn_pressed():
	$RadiusLE.text = "Radius"
	$ResultLBL.text = ""
	$ResultLBL2.text = ""
