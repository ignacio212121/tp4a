extends Node2D

signal actividad_terminada

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_button_down() -> void:
	$Dos.visible = true
	$Uno.visible = false
	$Button.visible = false
	$BotonM.visible = true
	$Titila.visible = false
	$Titila2.visible = true
	$LeonardoIa.visible = false

func _on_boton_m_button_down() -> void:
	emit_signal("actividad_terminada")
