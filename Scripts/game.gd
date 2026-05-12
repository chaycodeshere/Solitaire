extends Node2D

var game_paused : bool
var cards_ready : int #it should hit 52.
var playingcard : PackedScene = preload("res://Scenes/card.tscn")
var cardsarray : Array #array to contain cards

func _ready():
	game_paused = false
	cards_ready = 0
	$continuebuton.hide()
	$restartbutton.hide()
	$quitbutton.hide()
	$pausedtext.hide()
	card_spawn()
	card_locate()

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

func card_spawn():
	while cards_ready < 52:
		var pcard = playingcard.instantiate()
		pcard.picker = cards_ready + 1
		pcard.appointing_identity()
		pcard.global_position = Vector2(24, 24)
		cardsarray.append(pcard)
		add_child(pcard)
		cards_ready += 1
		print(pcard.picker_fixed)

func card_locate():
	var dealt_card : int = 0 #card location line. First card goes to first column etc.
	while dealt_card < 28:
		var selected_card = cardsarray.pick_random()
		var card3 = cardsarray.pick_random()
		var card5 = cardsarray.pick_random()
		var card6 = cardsarray.pick_random()
		var card8 = cardsarray.pick_random()
		var card9 = cardsarray.pick_random()
		var card10 = cardsarray.pick_random()
		var card12 = cardsarray.pick_random()
		var card13 = cardsarray.pick_random()
		var card14 = cardsarray.pick_random()
		var card15 = cardsarray.pick_random()
		var card17 = cardsarray.pick_random()
		var card18 = cardsarray.pick_random()
		var card19 = cardsarray.pick_random()
		var card20 = cardsarray.pick_random()
		var card21 = cardsarray.pick_random()
		var card23 = cardsarray.pick_random()
		var card24 = cardsarray.pick_random()
		var card25 = cardsarray.pick_random()
		var card26 = cardsarray.pick_random()
		var card27 = cardsarray.pick_random()
		var card28 = cardsarray.pick_random()
		add_child(selected_card)
		if dealt_card == 0: #column1
			selected_card.global_position = Vector2(92, 49)
			dealt_card += 1
			cardsarray.erase(selected_card)
			print("yeh")
		elif dealt_card == 1: #column2
			selected_card.global_position = Vector2(152, 49)
			dealt_card += 1
			cardsarray.erase(selected_card)
			print(card3.name)
			card3.global_position = Vector2(152, 64)
			print(card3.global_position)
			selected_card.add_child(card3)
			print(card3.get_parent().name)
			dealt_card += 1
			cardsarray.erase(card3)
			print("yeh")
		elif dealt_card == 3: #column3
			selected_card.global_position = Vector2(212, 49)
			dealt_card += 1
			cardsarray.erase(selected_card)
			card5.global_position = Vector2(212, 64)
			selected_card.add_child(card5)
			dealt_card += 1
			cardsarray.erase(card5)
			card6.global_position = Vector2(212, 79)
			card5.add_child(card6)
			dealt_card += 1
			cardsarray.erase(card6)
			print("yeh")
		elif dealt_card == 6: #column4
			selected_card.global_position = Vector2(272, 49)
			dealt_card += 1
			cardsarray.erase(selected_card)
			card8.global_position = Vector2(272, 64)
			selected_card.add_child(card8)
			dealt_card += 1
			cardsarray.erase(card8)
			card9.global_position = Vector2(272, 79)
			card8.add_child(card9)
			dealt_card += 1
			cardsarray.erase(card9)
			card10.global_position = Vector2(272, 94)
			card9.add_child(card10)
			dealt_card += 1
			cardsarray.erase(card10)
			print("yeh")
		elif dealt_card == 10: #column5
			selected_card.global_position = Vector2(332, 49)
			dealt_card += 1
			cardsarray.erase(selected_card)
			card12.global_position = Vector2(332, 64)
			selected_card.add_child(card12)
			dealt_card += 1
			cardsarray.erase(card12)
			card13.global_position = Vector2(332, 79)
			card12.add_child(card13)
			dealt_card += 1
			cardsarray.erase(card13)
			card14.global_position = Vector2(332, 94)
			card13.add_child(card14)
			dealt_card += 1
			cardsarray.erase(card14)
			card15.global_position = Vector2(332, 109)
			card14.add_child(card15)
			dealt_card += 1
			cardsarray.erase(card15)
			print("yeh")
		elif dealt_card == 15: #column6
			selected_card.global_position = Vector2(392, 49)
			dealt_card += 1
			cardsarray.erase(selected_card)
			card17.global_position = Vector2(392, 64)
			selected_card.add_child(card17)
			dealt_card += 1
			cardsarray.erase(card17)
			card18.global_position = Vector2(392, 79)
			card17.add_child(card18)
			dealt_card += 1
			cardsarray.erase(card18)
			card19.global_position = Vector2(392, 94)
			card18.add_child(card19)
			dealt_card += 1
			cardsarray.erase(card19)
			card20.global_position = Vector2(392, 109)
			card19.add_child(card20)
			dealt_card += 1
			cardsarray.erase(card20)
			card21.global_position = Vector2(392, 124)
			card20.add_child(card21)
			dealt_card += 1
			cardsarray.erase(card21)
			print("yeh")
		elif dealt_card == 21: #column7
			selected_card.global_position = Vector2(452, 49)
			dealt_card += 1
			cardsarray.erase(selected_card)
			card23.global_position = Vector2(452, 64)
			selected_card.add_child(card23)
			dealt_card += 1
			cardsarray.erase(card23)
			card24.global_position = Vector2(452, 79)
			card23.add_child(card24)
			dealt_card += 1
			cardsarray.erase(card24)
			card25.global_position = Vector2(452, 94)
			card24.add_child(card25)
			dealt_card += 1
			cardsarray.erase(card25)
			card26.global_position = Vector2(452, 109)
			card25.add_child(card26)
			dealt_card += 1
			cardsarray.erase(card26)
			card27.global_position = Vector2(452, 124)
			card26.add_child(card27)
			dealt_card += 1
			cardsarray.erase(card27)
			card28.global_position = Vector2(452, 139)
			card27.add_child(card28)
			dealt_card += 1
			cardsarray.erase(card28)
			print("yeh")
