extends Control

var event_order:int=0
func _ready() -> void:
	Global.play_dialogue(Global.DIALOGUE_C_1_START)

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("mouse_left"):
		match event_order:
			0:%AnimationPlayer.play("event")
			1:
				if Global.is_mobile:
					Global.switch_scene(Global.UI_PLAY)
				else:
					%AnimationPlayer2.play("event")
			2:Global.switch_scene(Global.UI_PLAY)
		event_order+=1

func _exit_tree() -> void:
	Global.clear_dialogue()
