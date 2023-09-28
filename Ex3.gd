extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_calc_btn_pressed():
	var input = int($InputLE.text)
	var quantitydoz = input / 12
	if quantitydoz < 1:
		quantitydoz = 0
	var quantitysingle = input - (quantitydoz * 12)
	var extraeggs = 1
	var price = 0
	if input > 0 and input <= 48:
		price = 0.50
	elif input > 48 and input <= 72:
		price = 0.45
	elif input > 72 and input <= 96:
		price = 0.40
	elif input > 96 and input <= 110:
		price = 0.35
	elif input > 110 and input <= 134:
		price = 0.30
	elif input > 134 and input <= 158:
		price = 0.25
	elif input > 158:
		price = 0.20
	var pricetotal = price * input
	$QuantityLBL.text = "single eggs = %.2f"% quantitysingle
	$DozenQuantityLBL.text = "Dozens = %.2f"% quantitydoz
	$TotalPriceLBL.text = "Total Egg price is $%.2f"% pricetotal


func _on_clear_btn_pressed():
	$InputLE.text = ""
	$QuantityLBL.text = ""
	$DozenQuantityLBL.text = ""
	$TotalPriceLBL.text = ""


func _on_exit_btn_pressed():
	get_tree().quit()
