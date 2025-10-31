extends Level


@onready var teleportation: Area2D = $Teleportation

func _ready() -> void:
	super._ready()
	Global.play_bgm(Global.BGM_TOWN)

func _on_timer_timeout() -> void:
	teleportation.monitoring=true
