extends Spatial

onready var world_1 = $Models/Maps/Botom
onready var world_2 = $Models/Maps/Top
onready var world_3 = $Models/Maps/Left
onready var world_4 = $Models/Maps/Right

func _process(delta):
	world_1.rotation.x += 1 * delta
	world_1.rotation.z += 1 * delta
	
	world_2.rotation.x -= 1 * delta
	world_2.rotation.z -= 1 * delta
	
	world_3.rotation.x -= 1 * delta
	world_3.rotation.z += 1 * delta
	
	world_4.rotation.x += 1 * delta
	world_4.rotation.z -= 1 * delta
