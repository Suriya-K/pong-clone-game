extends CharacterBody2D

signal ball_update_position(position:Vector2)
signal paddle_get_score(paddle_name:String)

@export var ball_speed = 300

var update_velocity = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = update_velocity


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collision = move_and_collide(self.velocity * ball_speed* delta)
	if(collision):
		self.velocity = self.velocity.bounce(collision.get_normal())
		ball_speed *= 1.01
	if self.position.x <= -10 :
		paddle_get_score.emit('enemy')
		velocity = update_velocity
	if self.position.x >= get_viewport_rect().size.x + 10 :
		paddle_get_score.emit('player')
		velocity = update_velocity
		
	ball_update_position.emit(self.global_position)

