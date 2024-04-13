extends "../AbstractPlatform.gd"

class_name BasePlatform

var box = null

func _init(input_position = Vector3()):
    position = input_position

func _ready():
    box = CSGBox3D.new()
    box.transform.origin = position
    add_child(box)