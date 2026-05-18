extends Node

var game_paused : bool
var gameready : bool
var ismousefull : bool # checks if mouse is currently holding a card or not

func _ready():
	ismousefull = false
