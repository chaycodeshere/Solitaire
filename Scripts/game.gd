extends Node2D

var game_paused : bool

func _ready():
	game_paused = false
	$continuebuton.hide()
	$restartbutton.hide()
	$quitbutton.hide()
	$pausedtext.hide()

func _input(event):
	if Input.is_action_just_pressed("escape"):
		if game_paused == false:
			game_paused = true
			$continuebuton.show()
			$restartbutton.show()
			$quitbutton.show()
			$pausedtext.show()
		else :
			game_paused = false
			$continuebuton.hide()
			$restartbutton.hide()
			$quitbutton.hide()
			$pausedtext.hide()

func _on_continuebuton_pressed():
	game_paused = false
	$continuebuton.hide()
	$restartbutton.hide()
	$quitbutton.hide()
	$pausedtext.hide()
func _on_restartbutton_pressed():
	get_tree().reload_current_scene()
func _on_quitbutton_pressed():
	get_tree().quit()
