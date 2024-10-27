extends Node

# Al apretar la 'r' o 'R' se reiniciaría el interactivo
func _process(delta):
	if Input.is_action_just_pressed("reiniciar"):
		$Intro.reiniciar()
