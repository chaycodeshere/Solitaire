extends StaticBody2D

var chosenface = ["ha", "h2", "h3", "h4", "h5", "h6", "h7", "h8", "h9", "h10", "hj", "hq", "hk",
"da", "d2", "d3", "d4", "d5", "d6", "d7", "d8", "d9", "d10", "dj", "dq", "dk",
"ca", "c2", "c3", "c4", "c5", "c6", "c7", "c8", "c9", "c10", "cj", "cq", "ck",
"sa", "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "sj", "sq", "sk"] #card identity that will be appointed
var cardidentity : String
@onready var actualsprite = $actualface
var picker : int



func _ready():
	actualsprite.region_rect = Rect2(48, 256, 48, 64)
	await get_tree().create_timer(1).timeout
	$actualface.show()
	appointing_identity()

func appointing_identity():
	picker = randi_range(1, 52)
	var picker_fixed : int = picker - 1 #since first one in arrays and sheets is 0.
	if picker in range(1, 14): #randi_range() covers the upper limit but range() does not.
		actualsprite.region_rect = Rect2(picker_fixed*48, 0, 48, 64)
	elif picker in range(14, 27):
		actualsprite.region_rect = Rect2((picker_fixed-13)*48, 64, 48, 64)
	elif picker in range(27, 40):
		actualsprite.region_rect = Rect2((picker_fixed-26)*48, 128, 48, 64)
	elif picker in range(40, 53):
		actualsprite.region_rect = Rect2((picker_fixed-39)*48, 192, 48, 64)
	cardidentity = chosenface[picker_fixed]
	print(cardidentity)
