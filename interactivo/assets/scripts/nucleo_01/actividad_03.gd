extends Node2D

signal actividad_terminada

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Background.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_button_down() -> void:
	$Calidad1.visible = false
	$Calidad2.visible = true
	$TextureButton.visible = true

func _on_texture_button_button_down() -> void:
	$TextureButton.visible = false
	$AnimatedSprite2D.visible = true
	$AnimatedSprite2D.play()

func _on_animated_sprite_2d_frame_changed() -> void:
	if $AnimatedSprite2D.frame == 2:
		$Glitch.visible = true
		$FondoMalo.visible = true
		$MarcoDeError/AnimatedSprite2D2.play()

func _on_animated_sprite_2d_animation_finished() -> void:
	$MarcoDeError.visible = true
	$AnimatedSprite2D.visible = false
	$Datos.visible = true
	$Datos/AnimatedSprite2D.play()
	$Info.visible = true
	$MarcoDeError2.visible = true
	$Botones.visible = true

func _on_texture_button_mouse_entered() -> void:
	$Botones/TextureButton.visible = false
	$Botones/TextureButton2.visible = true

func _on_texture_button_2_mouse_entered() -> void:
	$Botones/TextureButton2.visible = false
	$Botones/TextureButton3.visible = true

func _on_texture_button_3_mouse_entered() -> void:
	$Botones/TextureButton3.visible = false
	$Botones/TextureButton4.visible = true

func _on_texture_button_4_mouse_entered() -> void:
	$Botones/TextureButton4.visible = false
	$Botones/TextureButton5.visible = true

func _on_texture_button_5_mouse_entered() -> void:
	$Botones/TextureButton5.visible = false
	$Botones/TextureButton6.visible = true

func _on_texture_button_6_button_down() -> void:
	$Datos.visible = false
	$MarcoDeError2.visible = false
	$MarcoDeError.visible = false
	$FondoMalo.visible = false
	$Calidad2.visible = false
	$TextureButton.visible = false
	$Glitch.visible = false
	$Botones/TextureButton6.visible = false
	$TransferenciaC.visible = true
	$Timer.start()

func _on_timer_timeout() -> void:
	$InfoFuente.visible = true

func _on_boton_s_button_down() -> void:
	$InfoFinal.visible = true


func _on_info_final_actividad_terminada():
	emit_signal("actividad_terminada")
