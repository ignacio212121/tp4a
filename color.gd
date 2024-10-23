extends CollisionShape2D

func _on_area_2d_mouse_entered() -> void:
	$"../Sprite2D".visible=true


func _on_area_2d_mouse_exited() -> void:
	$"../Sprite2D".visible=false
