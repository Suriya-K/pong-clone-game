extends Node2D

var ball_scene = preload("res://scenes/ball.tscn")
var ball_position = Vector2.ZERO

@export var player_score = 0
@export var enemy_score = 0

@onready var enemy = get_node("Enemy")
@onready var player_ui = get_node('UI/HBoxContainer/PlayerScore')
@onready var enemy_ui = get_node("UI/HBoxContainer/EnemyScore")
var ball
# Called when the node enters the scene tree for the first time.
func _ready():
	ball = ball_scene.instantiate()
	ball.position = get_viewport_rect().size / 2
	var rand_dir = randf()
	var update_velocity = Vector2(rand_dir,rand_dir).normalized()
	ball.update_velocity = update_velocity
	ball.connect("ball_update_position",Callable(enemy,'_on_revice_ball_position'))
	ball.connect("paddle_get_score",_on_paddle_get_score)
	self.add_child(ball)
	
func _on_paddle_get_score(paddle_name:String):
	if(paddle_name == "enemy"): 
		enemy_score +=1
		enemy_ui.text = "%d"%enemy_score
	if(paddle_name == "player"): 
		player_score +=1
		player_ui.text = "%d"%player_score
	var rand_x = randf_range(-1, 1)
	var rand_y = randf_range(-1, 1)
	var update_velocity = Vector2(rand_x, rand_y).normalized()
	ball.update_velocity = update_velocity
	enemy.move_speed = 50
	ball.position = get_viewport_rect().size / 2
	


