extends Node2D

signal actividad_terminada

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_boton_m_button_down() -> void:
	$Base/Crear.visible = false
	$Base/Titila.visible = false
	$Base/BotonM.visible = false
	$Base/BarraDeCarga.visible = true
	$Base/BarraDeCarga.play("default")
	$Base/Label.visible = true
	$Info.visible = true
	$Presionar.visible = false

func _on_barra_de_carga_animation_finished() -> void:
	$Base/Label.visible = false
	$Base/BarraDeCarga.visible = false
	$Base/Label2.visible = true
	$Base/Personaje.visible = true
	$Timer.start()

func _on_timer_timeout() -> void:
	emit_signal("actividad_terminada")
	print("jeje")
