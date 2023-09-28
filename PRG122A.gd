extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	var preroot = int($LineEdit.text)
	var squared = preroot * preroot
	var squareroot = sqrt(preroot)
	$Result.text = "Your number = %.2f \n" % preroot\
	 +"Your number squared = %.2f \n" % squared\
	 +"Your square root = %.2f"% squareroot 
	$ItemList.add_item("Number        Square        Root")
	for num in range(0, 100001): 
		var numsquared = num**2
		var numsqrt = sqrt(num)
		var line = "%.6f        %.6f        %.6f" % [num, numsquared, numsqrt]
		$ItemList.add_item(line)


func _on_clear_pressed():
	$Result.text = "Result"
	$LineEdit.text = ""

func _on_exit_pressed():
	get_tree().quit()
