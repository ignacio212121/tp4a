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
	$Fondo/BotonS.visible = true
	$Button1.visible = true
	$Button2.visible = true
	$Button3.visible = true

func _on_button_1_mouse_entered() -> void:
	$LeonardoDisabled.visible = true
	$DalleDisabled.visible = true
	$IdeogramDisabled.visible = true
	$LeonardoInfo.visible = true

func _on_button_2_mouse_entered() -> void:
	$LeonardoDisabled.visible = true
	$DalleDisabled.visible = true
	$IdeogramDisabled.visible = true
	$DalleInfo.visible = true

func _on_button_3_mouse_entered() -> void:
	$LeonardoDisabled.visible = true
	$DalleDisabled.visible = true
	$IdeogramDisabled.visible = true
	$IdeogramInfo.visible = true

func _on_button_1_mouse_exited() -> void:
	$LeonardoDisabled.visible = false
	$DalleDisabled.visible = false
	$IdeogramDisabled.visible = false
	$LeonardoInfo.visible = false

func _on_button_2_mouse_exited() -> void:
	$LeonardoDisabled.visible = false
	$DalleDisabled.visible = false
	$IdeogramDisabled.visible = false
	$DalleInfo.visible = false

func _on_button_3_mouse_exited() -> void:
	$LeonardoDisabled.visible = false
	$DalleDisabled.visible = false
	$IdeogramDisabled.visible = false
	$IdeogramInfo.visible = false

func _on_boton_s_button_down() -> void:
	emit_signal("actividad_terminada")
