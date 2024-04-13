extends TextureRect

var count: int = 0
var isSelected: bool = false

var selectHalo: TextureRect
var countLabel: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	selectHalo = $halo
	selectHalo.show_behind_parent = true
	selectHalo.hide()
	countLabel = $Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setSelectedState(newState: bool):
	isSelected = newState
	if(isSelected):
		selectHalo.show()
	else:
		selectHalo.hide()
	
func updateItemCount(itemCount: int):
	count = itemCount
	countLabel.text = "x" + str(count)
	if (itemCount == 0):
		self_modulate.a = 0.1
	else:
		self_modulate.a = 1

