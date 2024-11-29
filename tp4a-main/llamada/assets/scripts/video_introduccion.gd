extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$SubViewport/VideoStreamPlayer.play()

func _on_video_stream_player_finished():
	get_parent().get_parent().siguiente_pantalla()
