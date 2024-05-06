extends Area3D

var score: int = 0
@onready var score_label = get_node("/root/Node/LabelScore")

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if body.is_in_group("Player"):
		print("ENTER")

func _on_body_exited(body):
	if body.is_in_group("Player"):
		score += 1
		score_label.text = "score: %s" % score
		print(score)
