extends Node2D

func _ready():
    var inventory = $Inventory/GridContainer
    for i in range(inventory.get_child_count()):
        var item = inventory.get_child(i)
        item.connect('gui_input', self, '_on_item_gui_input')

func _on_item_gui_input(event):
    if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
        if event.pressed:
            var item = event.get_node()
            item.grab_focus()
        else:
            var item = event.get_node()
            var target = get_node_at_position(event.global_position)
            if target and target != item and target.get_name().contains('Item'):
                var temp = item.get_modulate()
                item.modulate = target.get_modulate()
                target.modulate = temp