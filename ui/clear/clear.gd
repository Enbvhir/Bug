extends Control


func _on_button_pressed() -> void:
	Global.switch_scene(Global.UI_THEME)


func _on_control_mouse_entered() -> void:
	Global.play_sfx(Global.SFX_BUTTON_ON)


func _on_timer_timeout() -> void:
	Global.switch_scene(Global.UI_DEVELOPER)
