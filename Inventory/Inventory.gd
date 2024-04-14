extends Node

var selectedItem: int = 0
var newSelectedItem: int
var nbTotalItems: int

var inventoryPool: Array[int] = []
var items: Array[Node] = []
var widths: Array[float] = [3.4, 6.4, 6.4, 3.4, 6.4]
signal onItemUsed(platformType: int)
signal onItemChanged(newPlatformType: int)

# Called when the node enters the scene tree for the first time.
func _ready():
	nbTotalItems = $InventoryBar.get_child_count()
	items = $InventoryBar.get_children()
	fillInventory([5,5,5,5,5])
	self._onSelectedItemChanges()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
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
		items[child].setSelectedState( child == selectedItem)
	onItemChanged.emit(selectedItem)

func _onInventoryChanged():
	print("Inventory: ", inventoryPool)
	for child in nbTotalItems:
		_updateInventoryItemCount(child)

func _updateInventoryItemCount(itemId: int):
	items[itemId].updateItemCount(inventoryPool[itemId])

func fillInventory(newInventoryPool: Array[int]):
	if (newInventoryPool.size() != nbTotalItems):
		printerr("fillInventory() - newInventory size is not the expected size (", newInventoryPool.size(), "vs", nbTotalItems)
		return
	
	inventoryPool = newInventoryPool
	self._onInventoryChanged()

# returns true if the item has successfully been used
func useSelectedItem() -> bool:
	if (inventoryPool[selectedItem] <= 0):
		printerr("No item left with id ", selectedItem)
		return false

	inventoryPool[selectedItem] -= 1
	print("Used item ", selectedItem, ". Remaining: ", inventoryPool[selectedItem])
	_updateInventoryItemCount(selectedItem)
	onItemUsed.emit(selectedItem)
	return true
	
func getWidthSelectedItem(index) -> float:
	return widths[index]
	
