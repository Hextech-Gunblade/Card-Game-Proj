extends Camera2D

@export var zoomSpeed: float = 10
@export var moveSpeed: float = 1000

var zoomTarget: Vector2

var dragStartMousePos = Vector2.ZERO
var dragStartCameraPoos = Vector2.ZERO
var isDragging : bool = false;

func _ready():
	zoomTarget = zoom

func _process(delta):
	Zoom(delta)
	SimplePan(delta)
	ClickAndDrag(delta)

func Zoom(delta):
	if Input.is_action_just_pressed("zoom_in"):
		zoomTarget *= 1.1
	if Input.is_action_just_pressed("zoom_out"):
		zoomTarget *= 0.9

	zoom = zoom.slerp(zoomTarget, zoomSpeed * delta)

func SimplePan(delta):
	var moveAmount=Vector2.ZERO
	if Input.is_action_pressed("camera_move_left"):
		moveAmount.x += -1 
	if Input.is_action_pressed("camera_move_right"):
		moveAmount.x += 1 
	if Input.is_action_pressed("camera_move_up"):
		moveAmount.y += -1 
	if Input.is_action_pressed("camera_move_down"):
		moveAmount.y += 1 
	moveAmount = moveAmount.normalized()
	position += moveAmount * delta * moveSpeed * (1/zoom.x)
	pass

func ClickAndDrag(delta):
	# Add functionality for click-and-drag here
	pass
