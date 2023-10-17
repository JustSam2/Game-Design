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
	$Team1lbl2.text = ""
	$Team2lbl2.text = ""

func _on_aa_pressed():
	scoreA = scoreA + 1
	$Team2.text = "Score = %d" % scoreA


func _on_a_pressed():
	scoreA = scoreA - 1
	$Team2.text = "Score = %d" % scoreA

func _on_reset_a_pressed():
	scoreA = 0
	$Team2.text = "Score = %d" % scoreA
	$Team1lbl2.text = ""
	$Team2lbl2.text = ""


func _on_results_pressed():
	if scoreA > scoreH:
		$Team1lbl2.text = "Winner"
	if scoreH > scoreA:
		$Team1lbl2.text = "Winner"


func _on_teamnamesetter_pressed():
	$Team1lbl.text = str($team1le.text)
	$Team2lbl.text = str($team2le.text)


func _on_teamnameresetter_pressed():
	$Team1lbl.text = "Team 1"
	$Team2lbl.text = "Team 2"
