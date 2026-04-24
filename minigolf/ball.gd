extends RigidBody3D

var dragging := false
var start_pos := Vector2.ZERO
var end_pos := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		self.apply_impulse(Vector3.FORWARD)
	
	if event is InputEventMouseButton:
		if event is InputEventScreenTouch or event is InputEventMouseButton:
			if event.is_pressed():
				dragging = true
				start_pos = event.position
				print(event.position)
			
			if event.is_released():
				dragging = false
				end_pos = event.position
				var shot = Vector2(end_pos - start_pos).normalized()
				self.apply_impulse(Vector3(shot.x, 0, shot.y))
				print(shot)
