extends CharacterBody2D
class_name PersonnageBase
@export var vitesse: float = 120.0
var dep: Deplacable
func _ready():
    dep = Deplacable.new()
    add_child(dep)
    dep.cible = self
    dep.vitesse = vitesse
func _input(e: InputEvent) -> void:
    var cam = get_viewport().get_camera_2d()
    if not cam: return
    if e is InputEventScreenDrag:
        dep.deplacer_vers(cam.unproject_position(e.position))
    elif e is InputEventMouseButton and e.pressed and e.button_index == MOUSE_BUTTON_LEFT:
        dep.deplacer_vers(cam.get_global_mouse_position())
