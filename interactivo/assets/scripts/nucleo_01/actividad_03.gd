extends Node2D

signal actividad_terminada

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Background.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_button_down() -> void:
	$Calidad1.visible = false
	$Calidad2.visible = true
	$TextureButton.visible = true
	$Presionar.visible = false

func _on_texture_button_button_down() -> void:
	$TextureButton.visible = false
	$Calidad2.visible = false
	$TextureButton.visible = false
	emit_signal("actividad_terminada")
