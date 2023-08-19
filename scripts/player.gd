extends CharacterBody2D

@export var move_speed = 200

func _process(delta):
	if(Input.is_action_pressed("ui_up")):
		self.position.y -= move_speed * delta
	if(Input.is_action_pressed("ui_down")):
		self.position.y += move_speed * delta
