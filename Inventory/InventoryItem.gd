extends TextureRect

var count: int = 0
var isSelected: bool = false

var selectedRect: ReferenceRect
var countLabel: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	selectedRect = $ReferenceRect
	countLabel = $Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setSelectedState(newState: bool):
	isSelected = newState
	selectedRect.visible = isSelected
	
func updateItemCount(itemCount: int):
	count = itemCount
	countLabel.text = str(count)

