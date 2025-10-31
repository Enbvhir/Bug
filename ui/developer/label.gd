extends Label


var current_color:Color
var target_color:Color
func _physics_process(delta: float) -> void:
	current_color.r=move_toward(current_color.r,target_color.r,delta)
	current_color.g=move_toward(current_color.g,target_color.g,delta)
	current_color.b=move_toward(current_color.b,target_color.b,delta)
	add_theme_color_override("font_color",current_color)

func _on_timer_timeout() -> void:
	target_color=Color(randf(),randf(),randf(),1)
