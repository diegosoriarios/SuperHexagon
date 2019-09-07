extends Node2D

var motion = 0
var camera_zoom = 1.0
var timer = 0

func _process(delta):
	$Point.rotation_degrees = motion
	if Input.is_action_pressed("ui_right"): motion += 8
	if Input.is_action_pressed("ui_left"): motion -= 8
	
	$Camera2D.zoom = Vector2(camera_zoom, camera_zoom)
	
	timer += 1
	if timer > 60: timer = 0
	camera_zoom = 1 + sin(timer * 0.2) * 0.02