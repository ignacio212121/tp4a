extends Node2D

@export var color: Color = Color("#E8007D")
var cant_arrastrables: int = 0

signal actividad_terminada

func _ready():
	$CombinacionDatos/ProgressBar.modulate = color

func _on_arrastrable_posicionado():
	cant_arrastrables += 1
	$CombinacionDatos/ProgressBar.value += 33
	if cant_arrastrables == 3:
		$CombinacionDatos/BotonS.visible = true
		$Mensaje.visible = true
		$Arrastrables.queue_free()
		$CombinacionDatos/Resultado.visible = true


func _on_boton_s_pressed():
	emit_signal("actividad_terminada")
