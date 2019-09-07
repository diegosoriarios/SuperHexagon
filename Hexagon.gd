extends Node2D

var hex_size = 7
var hex_line = 2

func _ready():
	self.rotation_degrees = rand_range(-360, 360)
	randomize()
	
func _process(delta):
	self.scale = Vector2(hex_size, hex_size)
	$Line2D.width = hex_line
	
	hex_size -= 0.03
	if hex_size > 2: hex_line += 0.07
	if hex_size < 2: hex_line += 0.2
	
	if hex_size < 0:
		global.score += 1
		queue_free()

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_tree().paused = true
		global.score = 0
		yield(get_tree().create_timer(1.0), 'timeout')
		get_tree().paused = false
		#get_tree().reload_current_scene()
		get_tree().change_scene("res://MainScene.tscn")
	pass
