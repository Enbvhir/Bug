extends Node

var is_mobile:bool=false
func _ready() -> void:
	if OS.has_feature("mobile"):is_mobile=true

const BGM_THEME = preload("uid://je7u4m541dwf")
const BGM_RUINS = preload("uid://dtvdxt84y1r7i")
const BGM_CYBERPUNK = preload("uid://cb8clc75d23q8")
const BGM_TOWN = preload("uid://dggu0xqst1wkc")
const BGM_CAVE = preload("uid://ymlvkd8o4mae")
const BGM_FLAT = preload("uid://bdbftcd40rbgx")
const BGM_CHURCH = preload("uid://yv10y1pnfn1y")

func play_bgm(bgm:AudioStream):
	%Bgm.stream=bgm
	%Bgm.play()
func stop_bgm():%Bgm.stop()
func _on_bgm_finished() -> void:%Bgm.play()

const AMBIENT_TUTORIAL = preload("uid://bfaruyeuj7hlq")
const AMBIENT_1 = preload("uid://dc10dikalkq8t")
const AMBIENT_CAVE = preload("uid://beewphvxfjtep")
func play_ambient(ambient:AudioStream):
	%Ambient.stream=ambient
	%Ambient.play()
func stop_ambient():%Ambient.stop()
func _on_ambient_finished() -> void:%Ambient.play()

const SFX_IMPACT = preload("uid://c2isctsk0iub5")
const SFX_IMPACT_1 = preload("uid://ck58vnydx53b4")

const SFX_BUTTON_CLICK = preload("uid://cak5j1u74pllk")
const SFX_BUTTON_ON = preload("uid://p8wen4phjbj3")
const SFX_SWITCH = preload("uid://c3lkmsp3h40mj")

const SFX_LASER_1 = preload("uid://d1j3poqwtk5c")
const SFX_LASER_3 = preload("uid://dcdf1fgrtrsi7")

const SFX_MAN_STEP_1 = preload("uid://i7bg2tavyt4a")
const SFX_MAN_STEP_2 = preload("uid://cop2y31i6e4v0")
const SFX_JUMPER_FIRE = preload("uid://d0gauquut8wh7")
const SFX_JUMPER_JUMP = preload("uid://dibywm646h8rj")
const SFX_JUMPER_LAND = preload("uid://d2s321bgwbgop")
const SFX_THROWER_SHOOT = preload("uid://dtvh1fnsxb8e1")
const SFX_THROWER_STEP_1 = preload("uid://c4ximflekjetk")
const SFX_THROWER_STEP_2 = preload("uid://br03gomgm4x7f")
const SFX_BALL_TRANSFORM = preload("uid://djkdm4bligmbq")
const SFX_PLASMA_TURN = preload("uid://bloa0jehrde0o")
const SFX_FLYER_SHOOT = preload("uid://d335srixdg06")

const SFX_LASER_HIT = preload("uid://bupaluw1s7y1s")
const SFX_BOOM = preload("uid://g5ke2amnrthx")
const SFX_BOOM_2 = preload("uid://cw70dumvcrb4u")

const SFX_ATTACK = preload("uid://cbywfslpikhew")
const SFX_SPRINT = preload("uid://bfsq4eys8ye7l")
const SFX_STEP_1 = preload("uid://wy2biutkp7vm")
const SFX_STEP_2 = preload("uid://chrys5gsvfbrf")
const SFX_STEP_3 = preload("uid://bbsvrcoc5p51f")
const SFX_DROP = preload("uid://de3lfa4oninkg")
const SFX_JUMP = preload("uid://d3cwyht8qrn0l")
const SFX_HIT = preload("uid://kespeoj5jdqc")
const SFX_HURT = preload("uid://dmf2hhh8vv7os")
const SFX_DEATH = preload("uid://ko45cgd21i7u")
const SFX_AMMOTIME_1 = preload("uid://cwvl1i38oksym")
const SFX_AMMOTIME_3 = preload("uid://bgy5bstrk5tx6")
func play_sfx(sfx:PackedScene):%Sfx.add_child(sfx.instantiate())
func play_sfx_pitched(sfx:PackedScene,p:float):
	var s:AudioStreamPlayer=sfx.instantiate()
	s.pitch_scale=p
	%Sfx.add_child(s)

const DIALOGUE_C_3_FAILURE_S = preload("uid://mc40vyxc72u2")
const DIALOGUE_C_3_VICTORY_S = preload("uid://budfin8yjlqgj")

const DIALOGUE_C_1_START = preload("uid://cyd3e0wnnthop")
const DIALOGUE_C_3_ENTER = preload("uid://birt60wtpnhyd")
const DIALOGUE_C_3_VICTORY = preload("uid://ir2kpvd1fwk7")

func play_dialogue(sfx:PackedScene):%Dialogue.add_child(sfx.instantiate())
func clear_dialogue():for d in %Dialogue.get_children():d.queue_free()

const UI_PRE_ENTER = preload("uid://dyajrc3icedew")
const UI_POLICY = preload("uid://cy2v4yy56kypw")
const UI_THEME = preload("uid://cw11diprqdn11")
const UI_INTRO = preload("uid://cd8beddty8fv7")
const UI_PLAY = preload("uid://b33na2hc1mtcl")
const UI_FAIL = preload("uid://ds2udw36hcry6")
const UI_CLEAR = preload("uid://cy4qt40ba7mq7")
const UI_DEVELOPER = preload("uid://ce68q30ob1o3q")
@onready var color_rect: ColorRect = $CanvasLayer/ColorRect
func switch_scene(packed_scene:PackedScene):
	var tree:=get_tree()
	var tween:Tween=create_tween()
	tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tween.tween_property(color_rect,"color:a",1,0.5)
	await tween.finished
	
	get_tree().call_deferred("change_scene_to_packed",packed_scene)
	#get_tree().change_scene_to_packed(packed_scene)
	
	await tree.tree_changed
	tween=create_tween()
	tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tween.tween_property(color_rect,"color:a",0,0.5)

var camera_shake:float
func stun(time:float=0.2):
	Engine.time_scale=0.001
	if %TimerStun.is_stopped():%TimerStun.start(0.2)
	else:%TimerStun.start(%TimerStun.time_left+0.2)

func _on_timer_stun_timeout() -> void:
	Engine.time_scale=1

const EFFECT_BOOM = preload("uid://ckl3f6gmbo15j")
const PROJECTILE_1 = preload("uid://db2c1jf6vflq5")
const PROJECTILE_THROWER = preload("uid://cwysknnbfaugv")
const PROJECTILE_FLYER = preload("uid://2lfwbxys80s8")

var ui_play:Play=null
var player:Player=null
var camera:Camera2D=null
var enter_point_order:int
var is_teleportation:bool=false
var name_current_level:String
var is_restart:bool=false
