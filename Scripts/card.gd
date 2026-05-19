extends StaticBody2D

var chosenface = ["h 1", "h 2", "h 3", "h 4", "h 5", "h 6", "h 7", "h 8", "h 9", "h 10", "h 11", "h 12", "h 13",
"d 1", "d 2", "d 3", "d 4", "d 5", "d 6", "d 7", "d 8", "d 9", "d 10", "d 11", "d 12", "d 13",
"c 1", "c 2", "c 3", "c 4", "c 5", "c 6", "c 7", "c 8", "c 9", "c 10", "c 11", "c 12", "c 13",
"s 1", "s 2", "s 3", "s 4", "s 5", "s 6", "s 7", "s 8", "s 9", "s 10", "s 11", "s 12", "s 13"] 
#card identity that will be appointed

var cardidentity : String
var cardcolor : String #if card is red or black
var picker : int
var picker_fixed : int
var number : int #actually this wasnt needed at all but picker and picker_fixed vars are coded into not returnable ways
var isrootcard : bool #checks if this card is the root of a column. I mean the lowest card.
@onready var backofcard : Sprite2D = $backofcard
var mouseon : bool #if mouse is over the card
var picked : bool #if card is currently picked
var old_pos : Vector2 #a placeholder var to log and save old position in case to return there when needed
var old_z : int # same thing for z index
var sidecard : bool # if this card is a card at side

func _ready():
	$actualface.show()
	await get_tree().create_timer(0.5).timeout
	mouseon = false
	picked = false

func appointing_identity():
	picker_fixed = picker - 1 #since first one in arrays and sheets is 0.
	if picker in range(1, 14): #randi_range() covers the upper limit but range() does not.
		$actualface.region_rect = Rect2(picker_fixed * 48, 0, 48, 64)
		number = picker
	elif picker in range(14, 27):
		var uno = picker_fixed - 13
		number = uno + 1
		$actualface.region_rect = Rect2(uno *48, 64, 48, 64)
	elif picker in range(27, 40):
		var duo = picker_fixed - 26
		number = duo + 1
		$actualface.region_rect = Rect2(duo * 48, 128, 48, 64)
	elif picker in range(40, 53):
		var trio = picker_fixed - 39
		number = trio + 1
		$actualface.region_rect = Rect2(trio * 48, 192, 48, 64)
	else :
		if picker == null:
			$actualface.region_rect = Rect2(0, 0, 48, 64)
	cardidentity = chosenface[picker_fixed]
	if cardidentity.begins_with("h") or cardidentity.begins_with("d"):
		cardcolor = "red"
	else :
		cardcolor = "black"

func set_old_pos_and_z_in_start():
	old_pos = global_position
	old_z = z_index

func pickingup():
	if Globals.gameready == true and Globals.game_paused == false:
		if Input.is_action_just_pressed("rightclick"):
			if mouseon == true and Globals.ismousefull == false and self.sidecard == true:
				Globals.ismousefull = true
				global_position.y += 88
				z_index = 23 - z_index
				set_old_pos_and_z_in_start()
		if Input.is_action_just_released("rightclick"):
			Globals.ismousefull = false
		if Input.is_action_pressed("leftclick"):
			if mouseon == true and Globals.ismousefull == false:
				picked = true
				scale = Vector2(1.25, 1.25)
				z_index = 25
				print(z_index)
		if Input.is_action_just_released("leftclick"):
			if mouseon == true:
				picked = false
				Globals.ismousefull = false
				scale = Vector2(1, 1)
				z_index = old_z
				print(z_index)
				global_position = old_pos

func sidecardaffirmer(): #this seperate func was created to be able to fire from another script
	self.sidecard = true
	print("lol")

func _physics_process(delta):
	process_priority = z_index * -1
	pickingup()
	if get_parent().name == "game":
		isrootcard = true
	else :
		isrootcard = false
	
	if get_parent().is_in_group("cardgroup"):
		z_index = get_parent().z_index + 1
		old_z = z_index
	
	if picked == true:
		position = get_global_mouse_position()
		Globals.ismousefull = true


func _on_mouse_entered():
	mouseon = true
func _on_mouse_exited():
	mouseon = false
