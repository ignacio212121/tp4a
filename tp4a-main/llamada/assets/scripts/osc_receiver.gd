extends OSCReceiver

# Called every frame. 'delta' is the elapsed time since the previous frame.
signal nucleo_terminado
signal actividad_terminada
signal reiniciar
func _process(delta):
	if target_server.incoming_messages.has(osc_address):
		var estado = target_server.incoming_messages[osc_address][0]
		match estado:
			"nucleo_terminado":
				emit_signal("nucleo_terminado")
			"actividad_terminada":
				emit_signal("actividad_terminada")
			"reiniciar":
				emit_signal("reiniciar")
		target_server.incoming_messages.clear()	
