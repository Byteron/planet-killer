extends Area2D

const FRICTION := 0.05;
const ACCELERATION := 15;
const BACKWARDS_ACCELERATION := 30;
const MAX_SPEED := 600;

var max_border_y: int;
var max_border_x: int;

const min_border_x = 32;
const min_border_y = 32;

var motion := Vector2();


func _ready():
	max_border_y = get_viewport_rect().size.y - 32;
	max_border_x = get_viewport_rect().size.x - 32;

func _physics_process(delta):
	var right = Input.is_action_pressed("ui_right");
	var left =  Input.is_action_pressed("ui_left");
	var down = Input.is_action_pressed("ui_down");
	var up = Input.is_action_pressed("ui_up");
	var shoot = Input.is_action_pressed("ui_shoot");

	if right:
		if motion.x < -ACCELERATION: 
			motion.x = min(motion.x + BACKWARDS_ACCELERATION, MAX_SPEED);
			# $FrictionParticle.emit_for_motion(lastFrameMotion);
		else:
			motion.x = min(motion.x + ACCELERATION, MAX_SPEED);	
	elif left:
		if motion.x > ACCELERATION:
			motion.x = max(motion.x - BACKWARDS_ACCELERATION, -MAX_SPEED);
			# $FrictionParticle.emit_for_motion(lastFrameMotion);
		else:
			motion.x = max(motion.x - ACCELERATION, -MAX_SPEED);
	else:
		# $FrictionParticle.set_emitting(false);
		motion.x = lerp(motion.x, 0, FRICTION);	
	
	if down:
		if motion.y < -ACCELERATION:
			motion.y = min(motion.y + BACKWARDS_ACCELERATION, MAX_SPEED);
		else:
			motion.y = min(motion.y + ACCELERATION, MAX_SPEED);
	elif up:
		if motion.y > ACCELERATION:
			motion.y = max(motion.y - BACKWARDS_ACCELERATION, -MAX_SPEED);
		else:
			motion.y = max(motion.y - ACCELERATION, -MAX_SPEED);
	else:
		motion.y = lerp(motion.y, 0, FRICTION);
		
	var newPos = get_global_position() + Vector2(motion.x * delta, motion.y * delta);
	if newPos.y >= max_border_y || newPos.y <= min_border_y:
		motion.y = 0;
		newPos.y = min(newPos.y, max_border_y);
		newPos.y = max(min_border_y, newPos.y);
	if newPos.x >= max_border_x || newPos.x < min_border_x:
		motion.x = 0;
		newPos.x = min(newPos.x, max_border_x);
		newPos.x = max(min_border_x, newPos.x);
		
	
	if newPos.x > get_viewport_rect().size.x:
		newPos.x = get_viewport_rect().size.x;
	elif newPos.x <= 0:
		newPos.x = 0
	
	set_global_position(newPos);
