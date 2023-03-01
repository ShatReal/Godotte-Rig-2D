extends Node2D


func _ready() -> void:
	var group := ButtonGroup.new()
	for anim in $GodetteRig/AnimationPlayer.get_animation_list():
		if anim == "RESET":
			continue
		var b := Button.new()
		b.text = anim
		$CanvasLayer/VBoxContainer.add_child(b)
		b.pressed.connect(on_button_pressed.bind(anim))
		b.button_group = group
		b.toggle_mode = true
		if anim == "idle":
			b.button_pressed = true


func on_button_pressed(anim: String) -> void:
	$GodetteRig/AnimationPlayer.play(anim)
