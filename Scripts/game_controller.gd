extends Node3D

@export var rocket: PackedScene
@onready var game_start = get_node("UserInterface/GameStart")
@onready var game_end = get_node("UserInterface/GameEnd")
var player: Node
# TODO #1: Create variable for score label.

#TODO #9: Create variable for high score and best score label.


func _ready() -> void:
	Globals.hit.connect(game_over)
	game_start.visible = true
	Globals.spawning = false
	game_end.visible = false
	# TODO #5: Set score to 0 at start of game and connect signal.
	
	# TODO #10: Set high score to 0 at start of game.
	


func _process(_delta: float) -> void:
	if (Input.is_anything_pressed() && Globals.spawning == false):
		if Globals.started: 
			await get_tree().create_timer(1).timeout 
			restart()
		else: 
			game_start.visible = false
			Globals.spawning = true
			spawn_player()


func game_over():
	game_end.visible = true
	Globals.started = true
	Globals.spawning = false
	player.queue_free()
	# TODO #12: Only update high schore label if score is greater than current high score.
	
	# TODO #8: Reset the score when the game ends.
	


func restart():
	game_end.visible = false
	Globals.started = false
	Globals.spawning = true
	spawn_player()


func spawn_player():
	var rockets = get_tree().get_nodes_in_group("Rocket") 
	if rockets.is_empty(): #to prevent spawning mutliple rockets
		player = rocket.instantiate()
		player.position = Vector3(0,-4.3,0)
		add_child(player)


# TODO #6: Update score label.



# TODO #11: Update high score label.
