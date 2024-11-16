extends Node2D

signal actividad_terminada

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pierna_d_button_down() -> void:
	$Base/PiernaDerecha.visible = true
	info_aparece()
func _on_pierna_d_mouse_entered() -> void:
	$Base/PiernaDerecha2.visible = true
func _on_pierna_d_mouse_exited() -> void:
	$Base/PiernaDerecha2.visible = false


func _on_pierna_i_button_down() -> void:
	$Base/PiernaIzquierda.visible = true
	info_aparece()
func _on_pierna_i_mouse_entered() -> void:
	$Base/PiernaIzquierda2.visible = true
func _on_pierna_i_mouse_exited() -> void:
	$Base/PiernaIzquierda2.visible = false


func _on_brazo_i_button_down() -> void:
	$Base/BrazoIzquierdo.visible = true
	info_aparece()
func _on_brazo_i_mouse_entered() -> void:
	$Base/BrazoIzquierdo2.visible = true
func _on_brazo_i_mouse_exited() -> void:
	$Base/BrazoIzquierdo2.visible = false


func _on_brazo_d_button_down() -> void:
	$Base/BrazoDerecho.visible = true
	info_aparece()
func _on_brazo_d_mouse_entered() -> void:
	$Base/BrazoDerecho2.visible = true
func _on_brazo_d_mouse_exited() -> void:
	$Base/BrazoDerecho2.visible = false

func _on_torso_button_down() -> void:
	$Base/Torso2.visible = true
	info_aparece()
func _on_torso_mouse_entered() -> void:
	$Base/Torso3.visible = true
func _on_torso_mouse_exited() -> void:
	$Base/Torso3.visible = false


func _on_cabeza_button_down() -> void:
	$Base/Cabeza2.visible = true
	info_aparece()
func _on_cabeza_mouse_entered() -> void:
	$Base/Cabeza3.visible = true
func _on_cabeza_mouse_exited() -> void:
	$Base/Cabeza3.visible = false

func info_aparece():
	if $Base/PiernaDerecha.visible == true && $Base/PiernaIzquierda.visible == true && $Base/Cabeza2.visible == true && $Base/Torso2.visible == true && $Base/BrazoDerecho.visible == true && $Base/BrazoIzquierdo.visible == true:
		$Base/Info.visible = true
		$BotonS.visible = true

func _on_boton_s_button_down() -> void:
	$Final.visible = true

func _on_boton_s_2_button_down() -> void:
	emit_signal("actividad_terminada")
