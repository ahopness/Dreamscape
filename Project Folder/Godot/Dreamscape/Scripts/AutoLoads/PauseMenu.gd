extends Control

enum pages{
	main = 0,
	config_main = 1,
	exit = 2
}

var currect_page
onready var anm = $AnimationPlayer

func _ready():
	currect_page = pages.main

func _process(delta):
	if currect_page == pages.main:
		#main > exit
		if Input.is_action_just_pressed("player_backward"):
			anm.play_backwards("anm_main")
			yield(anm, "animation_finished")
			anm.play("anm_exit")
			yield(anm, "animation_finished")
			currect_page = pages.exit
		
		#main > config_main
		if Input.is_action_just_pressed("player_right"):
			anm.play_backwards("anm_main")
			yield(anm, "animation_finished")
			anm.play("anm_config-main")
			yield(anm, "animation_finished")
			currect_page = pages.config_main
	
	if currect_page == pages.exit:
		#exit > main
		if Input.is_action_just_pressed("player_right"):
			anm.play_backwards("anm_exit")
			yield(anm, "animation_finished")
			anm.play("anm_main")
			yield(anm, "animation_finished")
			currect_page = pages.main
		
		#exit > quit
		if Input.is_action_just_pressed("player_left"):
			anm.play_backwards("anm_exit")
			yield(anm, "animation_finished")
			get_tree().quit()
			currect_page = pages.main
		
	
	if currect_page == pages.config_main:
		#config_main > menu
		if Input.is_action_just_pressed("player_backward"):
			anm.play_backwards("anm_config-main")
			yield(anm, "animation_finished")
			anm.play("anm_main")
			yield(anm, "animation_finished")
			currect_page = pages.main
