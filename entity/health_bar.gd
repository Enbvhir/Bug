extends Control


var parent:Enemy
@onready var back: TextureProgressBar = $Back
@onready var front: TextureProgressBar = $Front
func _ready() -> void:
	parent=get_parent()
	back.max_value=parent.hp
	front.max_value=parent.hp

func _process(delta: float) -> void:
		front.value=parent.hp
		if back.value==front.value:pass
		else:back.value=move_toward(back.value,front.value,80*delta)
		
		if parent.hp==0:
			if is_zero_approx(back.value):visible=false
