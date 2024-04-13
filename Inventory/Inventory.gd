extends Node

var selectedItem: int = 0
var newSelectedItem: int
var nbTotalItems: int

# Called when the node enters the scene tree for the first time.
func _ready():
	nbTotalItems = $InventoryBar.get_child_count()
	print(nbTotalItems)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self._inputsHandler()

func _inputsHandler():
	if (Input.is_action_just_pressed("inventory_select_next")):
		newSelectedItem = (selectedItem + 1) % nbTotalItems
	elif (Input.is_action_just_pressed("inventory_select_previous")):
		newSelectedItem = (selectedItem + nbTotalItems - 1) % nbTotalItems
	elif (Input.is_action_just_pressed("inventory_select_one")):
		newSelectedItem = 0
	elif (Input.is_action_just_pressed("inventory_select_two")):
		newSelectedItem = 1
	elif (Input.is_action_just_pressed("inventory_select_three")):
		newSelectedItem = 2
	elif (Input.is_action_just_pressed("inventory_select_four")):
		newSelectedItem = 3
	elif (Input.is_action_just_pressed("inventory_select_five")):
		newSelectedItem = 4

	if (newSelectedItem != selectedItem):
		selectedItem = newSelectedItem
		self._onSelectedItemChanges()

func _onSelectedItemChanges():
	print("Selected Item: ", selectedItem)
	for child in nbTotalItems:
		($InventoryBar.get_child(child).get_child(0)).visible = child == selectedItem
