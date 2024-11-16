extends Node2D

signal actividad_terminada

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Background.play()
	$Presionar.modulate = ("13dd0f")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_button_down() -> void:
	$Info.visible = true
	$TextureButton.visible = false
	$Redimensionar.visible = false
	$Red2.visible = true
	$Barra.visible = true
	$Barra.play()
	$Presionar.visible = false

func _on_barra_animation_finished() -> void:
	$Red2.visible = false
	$Barra.visible = false
	$Red3.visible = true
	$Enviar.visible = true

func _on_enviar_button_down() -> void:
	$Info2.visible = true

func _on_boton_s_button_down() -> void:
	emit_signal("actividad_terminada")
