extends Control

var scoreH = 0
var scoreA = 0

func addPointH():
	scoreH +=1


# Called when the node enters the scene tree for the first time.
func _ready():
	var scoreH = 0
	var scoreA = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hh_pressed():
	scoreH = scoreH + 1
	$Team1.text = "Score = %d" % scoreH
	
	
func _on_h_pressed():
	scoreH = scoreH - 1
	$Team1.text = "Score = %d" % scoreH

func _on_reset_h_pressed():
	scoreH = 0
	$Team1.text = "Score = %d" % scoreH


func _on_aa_pressed():
	scoreA = scoreA + 1
	$Team2.text = "Score = %d" % scoreA


func _on_a_pressed():
	scoreA = scoreA - 1
	$Team2.text = "Score = %d" % scoreA

func _on_reset_a_pressed():
	scoreA = 0
	$Team2.text = "Score = %d" % scoreA
