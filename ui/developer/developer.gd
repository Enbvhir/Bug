extends Control


func _on_button_pressed() -> void:
	Global.switch_scene(Global.UI_THEME)
	Global.play_sfx(Global.SFX_BUTTON_CLICK)

func _on_button_mouse_entered() -> void:
	Global.play_sfx(Global.SFX_BUTTON_ON)
