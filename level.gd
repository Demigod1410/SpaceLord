extends Node2D

var meteor_scene : PackedScene = load("res://meteror.tscn")
var laser_scene : PackedScene = load("res://laser.tscn") 
var health:int = 3

func _ready():
	get_tree().call_group('ui', '_health', health)
func _on_meteor_timer_timeout():
	await get_tree().create_timer(5).timeout
	var meteor = meteor_scene.instantiate()
	
	$Meterors.add_child(meteor)
	meteor.connect('crash', _on_meteor_crash)
func _on_meteor_crash():
	health -= 1
	get_tree().call_group('ui', '_health', health)
	if health <=0:
		get_tree().change_scene_to_file("res://game_over.tscn")
	$Player.play_crash_sound()


func _on_player_laser(pos):
	var laser =laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
	
