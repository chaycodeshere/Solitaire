extends StaticBody2D

var chosenface = ["ha", "h2", "h3", "h4", "h5", "h6", "h7", "h8", "h9", "h10", "hj", "hq", "hk",
"da", "d2", "d3", "d4", "d5", "d6", "d7", "d8", "d9", "d10", "dj", "dq", "dk",
"ca", "c2", "c3", "c4", "c5", "c6", "c7", "c8", "c9", "c10", "cj", "cq", "ck",
"sa", "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "sj", "sq", "sk"] #card identity that will be appointed
var cardidentity : String
var picker : int
var picker_fixed : int
var isrootcard : bool #checks if this card is the root of a column. I mean the lowest card.
@onready var backofcard : Sprite2D = $backofcard
var mouseon : bool #if mouse is over the card
var picked : bool #if card is currently picked
var old_pos : Vector2 #a placeholder var to log and save old position in case to return there when needed
var old_z : int # same thing for z index


func _ready():
	$actualface.show()
	await get_tree().create_timer(0.5).timeout
	mouseon = false
	picked = false

func appointing_identity():
	picker_fixed = picker - 1 #since first one in arrays and sheets is 0.
	if picker in range(1, 14): #randi_range() covers the upper limit but range() does not.
		$actualface.region_rect = Rect2(picker_fixed * 48, 0, 48, 64)
	elif picker in range(14, 27):
		var uno = picker_fixed - 13
		$actualface.region_rect = Rect2(uno *48, 64, 48, 64)
	elif picker in range(27, 40):
		var duo = picker_fixed - 26
		$actualface.region_rect = Rect2(duo * 48, 128, 48, 64)
	elif picker in range(40, 53):
		var trio = picker_fixed - 39
		$actualface.region_rect = Rect2(trio * 48, 192, 48, 64)
	else :
		if picker == null:
			$actualface.region_rect = Rect2(0, 0, 48, 64)
	cardidentity = chosenface[picker_fixed]

func set_old_pos_and_z_in_start():
	old_pos = global_position
	old_z = z_index
	print(old_pos, old_z)

func pickingup():
	if Globals.gameready == true and Globals.game_paused == false:
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

func _physics_process(delta):
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
