extends Node2D

var bunny = preload('res://bunny.scn')
var bunnyCount = 0
var elapsed = 0

func _ready():
	# Initalization here
	set_process(true)
	addBunny(10)
	pass



func _process(delta):
	if Input.is_action_pressed('mouse_down'):
		addBunny(10)
		
	elapsed = elapsed + delta
	
	# Update fps text once per second
	if elapsed > 1:
		var fps = OS.get_frames_per_second()
		get_node("fps").set_text("FPS: " + str(fps))
		
		get_node("fps").set_as_toplevel(1)
		get_node("bunnyCount").set_as_toplevel(1)
		
		elapsed = 0

func addBunny(n):
	for i in range(n):
		var b = bunny.instance()
		add_child(b)
		bunnyCount = bunnyCount + 1
	
	var count = "Bunnies: " + str(bunnyCount)
	get_node("bunnyCount").set_text(count)