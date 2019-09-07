extends Node2D

export(PackedScene) var hexagon

func _on_Timer_timeout():
	var h = hexagon.instance()
	add_child(h)
	pass # Replace with function body.
