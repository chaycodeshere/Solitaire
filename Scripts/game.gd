extends Node2D

var cards_ready : int #it should hit 52.
var playingcard : PackedScene = preload("res://Scenes/card.tscn")
var cardsarray : Array #array to contain cards
var column1last #vars to indicate and assign lowest card in a column
var column2last
var column3last
var column4last
var column5last
var column6last
var column7last



func _ready():
	Globals.game_paused = false
	Globals.gameready = false
	cards_ready = 0
	$continuebuton.hide()
	$restartbutton.hide()
	$quitbutton.hide()
	$pausedtext.hide()
	card_spawn()
	card_locate()
	cardsarray.map(func(sidecards): sidecards.sidecardaffirmer())
	Globals.gameready = true

func _input(event):
	if Input.is_action_just_pressed("escape"):
		if Globals.game_paused == false:
			Globals.game_paused = true
			$continuebuton.show()
			$restartbutton.show()
			$quitbutton.show()
			$pausedtext.show()
		else :
			Globals.game_paused = false
			$continuebuton.hide()
			$restartbutton.hide()
			$quitbutton.hide()
			$pausedtext.hide()

func _on_continuebuton_pressed():
	Globals.game_paused = false
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
		pcard.global_position = Vector2(25, 36)
		cardsarray.append(pcard)
		add_child(pcard)
		cards_ready += 1

func card_locate():
	var dealt_card : int = 0 #card location line. First card goes to first column etc.
	while dealt_card < 28:
		var selected_card = cardsarray.pick_random()
		selected_card.z_index = 1
		cardsarray.erase(selected_card)
		if dealt_card == 0: #column1
			selected_card.global_position = Vector2(92, 49)
			selected_card.set_old_pos_and_z_in_start()
			selected_card.backofcard.hide()
			dealt_card += 1
		elif dealt_card == 1: #column2
			selected_card.global_position = Vector2(152, 49)
			selected_card.set_old_pos_and_z_in_start()
			dealt_card += 1
			var card3 = cardsarray.pick_random()
			cardsarray.erase(card3)
			card3.backofcard.hide()
			card3.z_index = 2
			card3.global_position = Vector2(152, 64)
			card3.set_old_pos_and_z_in_start()
			dealt_card += 1
		elif dealt_card == 3: #column3
			selected_card.global_position = Vector2(212, 49)
			selected_card.set_old_pos_and_z_in_start()
			dealt_card += 1
			var card5 = cardsarray.pick_random()
			cardsarray.erase(card5)
			card5.z_index = 2
			var card6 = cardsarray.pick_random()
			cardsarray.erase(card6)
			card6.backofcard.hide()
			card6.z_index = 3
			card5.global_position = Vector2(212, 64)
			card5.set_old_pos_and_z_in_start()
			dealt_card += 1
			card6.global_position = Vector2(212, 79)
			card6.set_old_pos_and_z_in_start()
			dealt_card += 1
		elif dealt_card == 6: #column4
			selected_card.global_position = Vector2(272, 49)
			selected_card.set_old_pos_and_z_in_start()
			dealt_card += 1
			var card8 = cardsarray.pick_random()
			cardsarray.erase(card8)
			card8.z_index = 2
			var card9 = cardsarray.pick_random()
			cardsarray.erase(card9)
			card9.z_index = 3
			var card10 = cardsarray.pick_random()
			cardsarray.erase(card10)
			card10.backofcard.hide()
			card10.z_index = 4
			card8.global_position = Vector2(272, 64)
			card8.set_old_pos_and_z_in_start()
			dealt_card += 1
			card9.global_position = Vector2(272, 79)
			card9.set_old_pos_and_z_in_start()
			dealt_card += 1
			card10.global_position = Vector2(272, 94)
			card10.set_old_pos_and_z_in_start()
			dealt_card += 1
		elif dealt_card == 10: #column5
			selected_card.global_position = Vector2(332, 49)
			selected_card.set_old_pos_and_z_in_start()
			dealt_card += 1
			var card12 = cardsarray.pick_random()
			cardsarray.erase(card12)
			card12.z_index = 2
			var card13 = cardsarray.pick_random()
			cardsarray.erase(card13)
			card13.z_index = 3
			var card14 = cardsarray.pick_random()
			cardsarray.erase(card14)
			card14.z_index = 4
			var card15 = cardsarray.pick_random()
			cardsarray.erase(card15)
			card15.backofcard.hide()
			card15.z_index = 5
			card12.global_position = Vector2(332, 64)
			card12.set_old_pos_and_z_in_start()
			dealt_card += 1
			card13.global_position = Vector2(332, 79)
			card13.set_old_pos_and_z_in_start()
			dealt_card += 1
			card14.global_position = Vector2(332, 94)
			card14.set_old_pos_and_z_in_start()
			dealt_card += 1
			card15.global_position = Vector2(332, 109)
			card15.set_old_pos_and_z_in_start()
			dealt_card += 1
		elif dealt_card == 15: #column6
			selected_card.global_position = Vector2(392, 49)
			selected_card.set_old_pos_and_z_in_start()
			dealt_card += 1
			var card17 = cardsarray.pick_random()
			cardsarray.erase(card17)
			card17.z_index = 2
			var card18 = cardsarray.pick_random()
			cardsarray.erase(card18)
			card18.z_index = 3
			var card19 = cardsarray.pick_random()
			cardsarray.erase(card19)
			card19.z_index = 4
			var card20 = cardsarray.pick_random()
			cardsarray.erase(card20)
			card20.z_index = 5
			var card21 = cardsarray.pick_random()
			cardsarray.erase(card21)
			card21.backofcard.hide()
			card21.z_index = 6
			card17.global_position = Vector2(392, 64)
			card17.set_old_pos_and_z_in_start()
			dealt_card += 1
			card18.global_position = Vector2(392, 79)
			card18.set_old_pos_and_z_in_start()
			dealt_card += 1
			card19.global_position = Vector2(392, 94)
			card19.set_old_pos_and_z_in_start()
			dealt_card += 1
			card20.global_position = Vector2(392, 109)
			card20.set_old_pos_and_z_in_start()
			dealt_card += 1
			card21.global_position = Vector2(392, 124)
			card21.set_old_pos_and_z_in_start()
			dealt_card += 1
		elif dealt_card == 21: #column7
			selected_card.global_position = Vector2(452, 49)
			selected_card.set_old_pos_and_z_in_start()
			dealt_card += 1
			var card23 = cardsarray.pick_random()
			cardsarray.erase(card23)
			card23.z_index = 2
			var card24 = cardsarray.pick_random()
			cardsarray.erase(card24)
			card24.z_index = 3
			var card25 = cardsarray.pick_random()
			cardsarray.erase(card25)
			card25.z_index = 4
			var card26 = cardsarray.pick_random()
			cardsarray.erase(card26)
			card26.z_index = 5
			var card27 = cardsarray.pick_random()
			cardsarray.erase(card27)
			card27.z_index = 6
			var card28 = cardsarray.pick_random()
			cardsarray.erase(card28)
			card28.backofcard.hide()
			card28.z_index = 7
			card23.global_position = Vector2(452, 64)
			card23.set_old_pos_and_z_in_start()
			dealt_card += 1
			card24.global_position = Vector2(452, 79)
			card24.set_old_pos_and_z_in_start()
			dealt_card += 1
			card25.global_position = Vector2(452, 94)
			card25.set_old_pos_and_z_in_start()
			dealt_card += 1
			card26.global_position = Vector2(452, 109)
			card26.set_old_pos_and_z_in_start()
			dealt_card += 1
			card27.global_position = Vector2(452, 124)
			card27.set_old_pos_and_z_in_start()
			dealt_card += 1
			card28.global_position = Vector2(452, 139)
			card28.set_old_pos_and_z_in_start()
			dealt_card += 1
	cardsarray.shuffle()
	var scn : int = 0 #side card number. a quick var for while code under this to run.
	while scn < 24:
		cardsarray[scn].z_index = scn
		cardsarray[scn].old_z = cardsarray[scn].z_index
		scn += 1
	cardsarray.map(func(cards): cards.set_old_pos_and_z_in_start())
