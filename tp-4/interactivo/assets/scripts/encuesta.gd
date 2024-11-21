extends Node2D

signal volver_empezar

func _on_opcion_1_pressed():
	GLOBAL.votos_01 += 1
	_mostrar_resultados()

func _on_texture_button_pressed():
	GLOBAL.votos_02 += 1
	_mostrar_resultados()

func _mostrar_resultados():
	$PrimeraPantalla.visible = false
	_calcular_resultados()
	$Resultados.visible = true

func _calcular_resultados():
	var totales = GLOBAL.votos_01 + GLOBAL.votos_02
	var porcentaje_01 = round(GLOBAL.votos_01 * 100 / totales)
	$Resultados/GraficoResutltados.value = porcentaje_01
	$Resultados/Porcentaje1.text = str(porcentaje_01) + "%"
	$Resultados/Porcentaje2.text = str(100 - porcentaje_01) + "%"
	$Resultados/Total.text = "Total de personas encuestadas: " + str(GLOBAL.votos_01 + GLOBAL.votos_02)

func _on_volver_empezar_pressed():
	$PrimeraPantalla.visible = true
	$Resultados.visible = false
	emit_signal("volver_empezar")
