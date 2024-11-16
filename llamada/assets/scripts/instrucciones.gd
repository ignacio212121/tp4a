extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Arrastrar.play()
	$Dibujar.play()
	$Presionar.play()
	$SubViewport/VideoStreamPlayer.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_video_stream_player_finished() -> void:
	get_parent().get_parent().siguiente_pantalla()
