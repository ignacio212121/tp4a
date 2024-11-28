extends TextureButton

@export var color: Color = Color("#ffffff")
@export var texto: String = "TEXT"
var click: AudioStream = preload("res://assets/audio/clicksoundeffect.mp3")

func _ready():
	modulate = color
	$Label.text = texto
	$AudioStreamPlayer.stream = click

func _on_visibility_changed():
	modulate = color

func _on_button_down() -> void:
	$AudioStreamPlayer.play()
