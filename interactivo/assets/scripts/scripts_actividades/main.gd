extends Node

var cantidad_arrastrables = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_arrastrable_posicionado():
	cantidad_arrastrables += 1
	if cantidad_arrastrables == 5:
		$Borrador.visible = true


func _on_dibujar_actividad_finalizada():
	$Dibujar.queue_free()
