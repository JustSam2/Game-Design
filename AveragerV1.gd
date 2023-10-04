extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_pressed():
	var averager = 0
	var num1 = int($nument1.text)
	if num1 > 0:
		averager + 1
	var num2 = int($nument2.text)
	if num2 > 0:
		averager + 1
	var num3 = int($nument3.text)
	if num3 > 0:
		averager + 1
	var num4 = int($nument4.text)
	if num4 > 0:
		averager + 1
	var average1 = num1 + num2 + num3 + num4
	var average2 = average1/averager
	$output.text = "Average = %.2f" % average2

func _on_clear_pressed():
	$nument1.text = ""
	$nument2.text = ""
	$nument3.text = ""
	$nument4.text = ""
	$output.text = ""


func _on_exit_pressed():
	get_tree().quit()
