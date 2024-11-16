extends Node2D

@export var color: Color = Color("#E8007D")
var cant_arrastrables: int = 0

signal actividad_terminada

func _ready():
	$CombinacionDatos/ProgressBar.modulate = color
	$TimerAyuda.start()

func _process(delta: float) -> void:
	no_soy_tonto()

func _on_arrastrable_posicionado():
	cant_arrastrables += 1
	$CombinacionDatos/ProgressBar.value += 33
	if cant_arrastrables == 3:
		$CombinacionDatos/BotonS.visible = true
		$Mensaje.visible = true
		$Arrastrables.queue_free()
		$CombinacionDatos/Resultado.visible = true

func no_soy_tonto():
	if $CombinacionDatos/ProgressBar.value > 1:
		$TimerAyuda.stop()

func _on_timer_ayuda_timeout() -> void:
	$Arrastrables/ArrastrableFotografia/AnimationPlayer.play("ayuda_soy_tonto_1")
	$Arrastrables/ArrastrableFlyer/AnimationPlayer.play("ayuda_soy_tonto_1")
	$Arrastrables/ArrastrableDiciembre/AnimationPlayer.play("ayuda_soy_tonto_1")

func _on_button_mouse_entered() -> void:
	$Arrastrables/ArrastrableFotografia/AnimationPlayer.stop()
	$Arrastrables/ArrastrableFotografia/Button.visible = false

func _on_button_2_mouse_entered() -> void:
	$Arrastrables/ArrastrableFlyer/AnimationPlayer.stop()
	$Arrastrables/ArrastrableFlyer/Button2.visible = false

func _on_button_3_mouse_entered() -> void:
	$Arrastrables/ArrastrableDiciembre/AnimationPlayer.stop()
	$Arrastrables/ArrastrableDiciembre/Button3.visible = false

func _on_boton_s_pressed():
	emit_signal("actividad_terminada")
