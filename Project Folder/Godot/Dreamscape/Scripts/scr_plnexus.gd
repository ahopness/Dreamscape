extends KinematicBody

var turning_amount = 10.0

var speed = 7
var acceleration = 20
var gravity = 9.8

var is_h_walking = false
var is_v_walking = false

onready var sensitivity = get_node("/root/GameManeger").mouse_sensitivity
var obj_wave = preload("res://Objects/obj_wave.tscn")

var direction = Vector3()
var velocity = Vector3()
var fall = Vector3()

onready var body = $Body
onready var head = $Body/head
onready var anm = $AnimationPlayer
onready var ftp_sound = $player_footsteps/player_audio

func _ready():
	#mouse lock
	get_node("/root/GameManeger").is_mouse_locked = true

func _input(event):
	#Mouse Look
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x * sensitivity))
		head.rotate_x(deg2rad(-event.relative.y * sensitivity))
		head.rotation.x = clamp(head.rotation.x, deg2rad(-65), deg2rad(65))

func _physics_process(delta):
	direction = Vector3()
	
	#move foward
	if Input.is_action_pressed("player_foward"):
		direction -= transform.basis.z
		body.rotation.x = lerp_angle(body.rotation.x, deg2rad(-turning_amount + 8), 5 * delta)
		is_h_walking = true
	#move backward
	elif Input.is_action_pressed("player_backward"):
		direction += transform.basis.z
		body.rotation.x = lerp_angle(body.rotation.x, deg2rad(turning_amount - 5), 5 * delta)
		is_h_walking = true
	else:
		body.rotation.x = lerp_angle(body.rotation.x, deg2rad(0), 5 * delta)
		is_h_walking = false
	#move left
	if Input.is_action_pressed("player_left"):
		body.rotation.z = lerp_angle(body.rotation.z, deg2rad(turning_amount - 3.5), 5 * delta)
		direction -= transform.basis.x
		is_v_walking = true
	#move right
	elif Input.is_action_pressed("player_right"):
		body.rotation.z = lerp_angle(body.rotation.z, deg2rad(-turning_amount + 3.5), 5 * delta)
		direction += transform.basis.x
		is_v_walking = true
	else:
		body.rotation.z = lerp_angle(body.rotation.z, deg2rad(0), 5 * delta)
		is_v_walking = false
	
	#footstep
	if is_h_walking == true || is_v_walking == true:
		anm.play("anm_walking")
	else:
		anm.play("anm_idle")
	
	direction = direction.normalized()
	velocity = velocity.linear_interpolate(direction * speed, acceleration * delta)
	velocity = move_and_slide(velocity, Vector3.UP)

func spawn_wave():
	var _obj_wave = obj_wave.instance()
	_obj_wave.name = "player_wave"
	self.get_parent().add_child(_obj_wave)
	_obj_wave.translation = translation
	return

#change footstep pitch
func _on_player_audio_finished():
	ftp_sound.pitch_scale = rand_range(.8, 1.2)
