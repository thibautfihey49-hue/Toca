extends Node2D
signal changer(nom: String)
@onready var portail: Area2D = $PortailMaison
func _ready(): portail.input_event.connect(_vers_maison)
func _vers_maison(_, e, __):
    if (e is InputEventMouseButton and e.pressed) or (e is InputEventScreenTouch and e.pressed):
        changer.emit("maison")
