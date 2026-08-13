extends Area2D
class_name Interactif
signal clique
@export var nom: String = "Objet"
func _ready(): input_event.connect(_clic)
func _clic(_, e, __):
    if (e is InputEventMouseButton and e.pressed and e.button_index == MOUSE_BUTTON_LEFT) or (e is InputEventScreenTouch and e.pressed):
        clique.emit()
