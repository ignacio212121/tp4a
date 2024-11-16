extends Node2D

func _ready() -> void:
	$SubViewport/VideoStreamPlayer.play()
	$Arrastrar.play()
	$Dibujar.play()
	$Presionar.play()

func _on_video_stream_player_finished() -> void:
	get_parent().get_parent().siguiente_pantalla()
