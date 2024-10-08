extends Node2D

var arrow_scene = preload("res://Entities/Player/arrow.tscn")
@onready var character := $Player
@onready var timer = $Timer

var current_question_index = 0
var level_questions = []

func _ready():
	pass

	#$TextureProgressBar.value =
func _process(_delta):
	var remaining_time = timer.time_left
	$TextureProgressBar.value = remaining_time*20
	if($TextureProgressBar.value == 0):
		$Label.visible = false
	if Global.shooting:
		Global.shooting = false
		var arrow = arrow_scene.instantiate()
		if character.direction.x > 0:
			arrow.position = Vector2(character.position.x + 30, character.position.y + 10)
			arrow.direction = Vector2.RIGHT
		elif character.direction.x < 0:
			arrow.position = Vector2(character.position.x - 30, character.position.y + 10)
			arrow.direction = Vector2.LEFT
		$Projectiles.add_child(arrow)
	Global.player_pos = character.position

