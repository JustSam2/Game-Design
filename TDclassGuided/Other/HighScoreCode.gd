extends Control
var highscores = []
func update_scoreboard():
	pass
	$ItemList.clear()
	highscores.sort()
	for index in range(len(highscores)):
		$ItemList.add_item("%d. %d" % [index+1 , highscores[index]])
	
func _ready():
	var header = "Score"
	$ItemList.add_item(str(header))

func _process(delta):
	update_scoreboard()

func _on_button_pressed():
	var score = int($LineEdit.text)
	highscores.append(score)


func _on_button_2_pressed():
	var position = int($LineEdit2.text) - 1
	highscores.remove_at(position)
