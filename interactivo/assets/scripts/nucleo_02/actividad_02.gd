extends Node2D

@export var color: Color = Color("#E8007D")
signal actividad_terminada
# Called when the node enters the scene tree for the first time.
func _ready():
	$ExportandoDatos/ProgressBar.modulate = color
	$ExportandoDatos/Loading.modulate = color
	$ExportandoDatos/Loading.play("default")
	$Presionar.modulate = color

func _on_amarillo_clickeado():
	$Colores.queue_free()
	$ExportandoDatos/ProgressBar.value += 50
	$Posicionar.visible = true


func _on_boton_colores():
	$Posicionar.visible = false
	$Aplicaciones.visible = true


func _on_ps_pressed():
	$Aplicaciones.visible = false
	$PosicionarAplicaciones.visible = true


func _on_boton_aplicaciones():
	$PosicionarAplicaciones.visible = false
	$ExportandoDatos/ProgressBar.value += 50
	$Personalizacion/Timer.start()


func _on_timer_timeout():
	$ExportandoDatos.visible = false
	$Personalizacion.visible = true
	$Presionar.visible = false


func _on_boton_personalizacion():
	emit_signal("actividad_terminada")
