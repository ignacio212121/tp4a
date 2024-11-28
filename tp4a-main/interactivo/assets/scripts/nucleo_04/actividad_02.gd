extends Node2D

signal actividad_terminada

var Linea = "HAZ UN ANUNCIO PUBLICITARIO"
var current_line = 1
var current_index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play()
	$Fondo/Label.text = ""
	$Fondo/Timer.start()
	$Fondo/Loading.play()
	$Fondo/Loading2.play()
	$Fondo/Loading3.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	if current_line == 1:
		if current_index < Linea.length():
			$Fondo/Label.text += Linea[current_index]
			current_index += 1

func _on_boton_m_button_down() -> void:
	$Fondo/Dalle.visible = true
	$Fondo/Ideogram.visible = true
	$Fondo/Leonardo.visible = true
	$BotonMFinal.visible = true
	$Titila.visible = true
	$Fondo/Titila.visible = false
	$Button1.visible = true
	$Button2.visible = true
	$Button3.visible = true
	$Presionar.visible = false
	$LeonardoInfo.visible = true
	$DalleInfo.visible = true
	$IdeogramInfo.visible = true

func _on_button_1_mouse_entered() -> void:
	$IdeogramInfo.visible = false
	$DalleInfo.visible = false
	$LeonardoDisabled.visible = true

func _on_button_2_mouse_entered() -> void:
	$IdeogramInfo.visible = false
	$LeonardoInfo.visible = false
	$DalleDisabled.visible = true

func _on_button_3_mouse_entered() -> void:
	$LeonardoInfo.visible = false
	$DalleInfo.visible = false
	$IdeogramDisabled.visible = true

func _on_button_1_mouse_exited() -> void:
	$IdeogramInfo.visible = true
	$DalleInfo.visible = true
	$LeonardoDisabled.visible = false

func _on_button_2_mouse_exited() -> void:
	$IdeogramInfo.visible = true
	$LeonardoInfo.visible = true
	$DalleDisabled.visible = false

func _on_button_3_mouse_exited() -> void:
	$LeonardoInfo.visible = true
	$DalleInfo.visible = true
	$IdeogramDisabled.visible = false

func _on_boton_m_final_button_down() -> void:
	emit_signal("actividad_terminada")
