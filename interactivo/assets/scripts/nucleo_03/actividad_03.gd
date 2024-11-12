extends Node2D

signal actividad_terminada

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	hola()

func _on_idea_1_button_down() -> void:
	$Idea11.visible = true

func _on_idea_2_button_down() -> void:
	$Idea22.visible = true

func _on_idea_3_button_down() -> void:
	$Idea33.visible = true

func hola():
	if $Idea11.visible == true && $Idea22.visible == true && $Idea33.visible == true:
		$Info.visible = true
		$BotonS.visible = true

func _on_boton_s_button_down() -> void:
	$InfoFinal.visible = true

func _on_boton_s_2_button_down() -> void:
	$Idea11.visible = false
	$Idea22.visible = false
	$Idea33.visible = false
	$Info.visible = false
	$BotonS.visible = false
	$AnimatedSprite2D.visible = false
	$InfoFinal.visible = false
	$Idea1.visible = false
	$Idea2.visible = false
	$Idea3.visible = false
	$Final.visible = true

func _on_boton_l_button_down() -> void:
	emit_signal("actividad_terminada")
