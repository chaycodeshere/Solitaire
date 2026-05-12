extends StaticBody2D

var chosenface = ["ha", "h2", "h3", "h4", "h5", "h6", "h7", "h8", "h9", "h10", "hj", "hq", "hk",
"da", "d2", "d3", "d4", "d5", "d6", "d7", "d8", "d9", "d10", "dj", "dq", "dk",
"ca", "c2", "c3", "c4", "c5", "c6", "c7", "c8", "c9", "c10", "cj", "cq", "ck",
"sa", "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "sj", "sq", "sk"] #card identity that will be appointed
var cardidentity : String
var picker : int
var picker_fixed : int
var isrootcard : bool #checks if this card is the root of a column. I mean the lowest card.
var checkers : bool


func _ready():
	$actualface.show()
	checkers = false
	await get_tree().create_timer(3).timeout
	checkers = true

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
	print($actualface.region_rect)
	cardidentity = chosenface[picker_fixed]

func _physics_process(delta):
	if get_parent().name == "game":
		isrootcard = true
	else :
		isrootcard = false
	if get_parent().is_in_group("cardgroup"):
		z_index = get_parent().z_index + 1
