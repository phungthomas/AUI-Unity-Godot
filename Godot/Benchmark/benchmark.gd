extends Node3D

# "Prefab" of the cube to be preloaded
const CUBE = preload("res://Cube.tscn")

# Number of cubes in the scene
var cubes = 0

var timer = Timer.new()
var start_time = 0
var end_time = 0

func _ready():
	Engine.max_fps = 60
	start_benchmark()

func start_benchmark():
	print("Starting benchmark...")
	start_time = Time.get_ticks_usec()
	timer.timeout.connect(_on_timer_timeout)
	add_child(timer)
	timer.start(0.01)

func _on_timer_timeout():
	var instance = CUBE.instantiate()
	add_child(instance)
	
	var x = randf_range(-5,5)
	var z = randf_range(-5,5)
		
	instance.translate(Vector3(x, 0, z))
	
	cubes = cubes+1

	if Engine.get_frames_per_second() < 60 && cubes > 500:
		print("FPS DROPPED BELOW 60 FPS")
		end_time = Time.get_ticks_usec()
		var elapsed_time = (end_time - start_time) / 1000000.0  # Convert microseconds to seconds
		print("Benchmark completed in", elapsed_time, "seconds.")
		timer.stop()
		timer.timeout.disconnect(_on_timer_timeout)
	else:
		_monitor()

func _monitor():
	print("Cubes: " + str(cubes))
	print("FPS : " + str(Performance.get_monitor(Performance.TIME_FPS)))
	print("Memory used : " + str(Performance.get_monitor(Performance.MEMORY_STATIC) / (1024*1024)) + " MB")
	print("Render video memory used : " + str(Performance.get_monitor(Performance.RENDER_VIDEO_MEM_USED) / (1024 * 1024)) + " MB")
