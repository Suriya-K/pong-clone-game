extends CharacterBody2D

var move_speed = 50
var ball_position = Vector2.ZERO
var direction = Vector2.ZERO

func _ready():
	pass

func _process(delta):
	if abs(ball_position.y - self.position.y) > 4:
		if(ball_position.y > self.position.y):
			direction = Vector2.DOWN
		if(ball_position.y < self.position.y):
			direction = Vector2.UP
		direction = Vector2.ZERO

	direction.y = ball_position.y - self.position.y
	self.velocity = direction * move_speed
	var collision = move_and_collide(self.velocity * delta)
	if collision:
		move_speed -=1

func _on_revice_ball_position(pos:Vector2):
	ball_position = pos
