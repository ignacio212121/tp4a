extends Node2D

signal actividad_terminada

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.visible = true
	$AnimatedSprite2D.play()
	$Background.play()
	$Glitch.visible = true
	$FondoMalo.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_animated_sprite_2d_animation_finished() -> void:
	$Felicidades.visible = true
	$BotonM.visible = true
	$Titila.visible = true

func _on_boton_m_button_down() -> void:
	$MarcoDeError.visible = true
	$MarcoDeError2.visible = true
	$AnimatedSprite2D.visible = false
	$Datos.visible = true
	$Datos/AnimatedSprite2D.play()
	$Info.visible = true
	$Botones.visible = true
	$Felicidades.visible = false
	$BotonM.visible = false
	$Titila.visible = false
	$Botones/TextureButton/AnimationPlayer.play("parpadeo")

func _on_texture_button_mouse_entered() -> void:
	$Botones/TextureButton2/AnimationPlayer.play("parpadeo")
	$Botones/TextureButton.visible = false
	$Botones/TextureButton2.visible = true

func _on_texture_button_2_mouse_entered() -> void:
	$Botones/TextureButton2.visible = false
	$Botones/TextureButton3.visible = true
	$Botones/TextureButton3/AnimationPlayer.play("parpadeo")

func _on_texture_button_3_mouse_entered() -> void:
	$Botones/TextureButton3.visible = false
	$Botones/TextureButton4.visible = true
	$Botones/TextureButton4/AnimationPlayer.play("parpadeo")

func _on_texture_button_4_mouse_entered() -> void:
	$Botones/TextureButton4.visible = false
	$Botones/TextureButton5.visible = true
	$Botones/TextureButton5/AnimationPlayer.play("parpadeo")

func _on_texture_button_5_mouse_entered() -> void:
	$Botones/TextureButton5.visible = false
	$Botones/TextureButton6.visible = true
	$Botones/TextureButton6/AnimationPlayer.play("parpadeo")

func _on_texture_button_6_mouse_entered() -> void:
	$Botones/TextureButton6/AnimationPlayer.stop()

func _on_texture_button_6_mouse_exited() -> void:
	$Botones/TextureButton6/AnimationPlayer.play("parpadeo")

func _on_texture_button_6_button_down() -> void:
	$Datos.visible = false
	$MarcoDeError2.visible = false
	$MarcoDeError.visible = false
	$FondoMalo.visible = false
	$Glitch.visible = false
	$Botones/TextureButton6.visible = false
	$TransferenciaC.visible = true
	$Timer.start()

func _on_timer_timeout() -> void:
	$InfoFuente.visible = true

func _on_boton_s_button_down() -> void:
	emit_signal("actividad_terminada")
