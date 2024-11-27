extends Node2D

signal zona_cumplida

func _on_mouse_entered():
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		$CollisionShape2D.disabled = true
		$Sprite2D.visible = false
		$Sprite2D2.visible = false
		emit_signal("zona_cumplida")
