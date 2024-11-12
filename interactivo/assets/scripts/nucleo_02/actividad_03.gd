extends Node2D

var color: Color = Color("#E8007D")

signal actividad_terminada
# Called when the node enters the scene tree for the first time.
func _ready():
	$BuscandoCambios/Loading.modulate = color
	$BuscandoCambios/Loading2.modulate = color
	$BuscandoCambios/Loading.play("default")
	$BuscandoCambios/Loading2.play("default")
	$BuscandoCambios/AnimatedSprite2D.play("default")


func _on_animated_sprite_2d_animation_finished():
	$BuscandoCambios/Loading.stop()
	$BuscandoCambios/Loading2.stop()
	$BuscandoCambios/Loading.visible = false
	$BuscandoCambios/Loading2.visible = false
	$BuscandoCambios/Amarillo.visible = true
	$BuscandoCambios/Instagram.visible = true
	$BuscandoCambios/AnimatedSprite2D.visible = false
	$BuscandoCambios/BotonM.visible = true


func _on_boton_m_pressed():
	$BuscandoCambios.visible = false
	$Resultado.visible = true
	
func _on_boton_s_pressed():
	$Resultado/BotonS.visible = false
	$Resultado/Avisar.visible = true


func _on_boton_final():
	emit_signal("actividad_terminada")
