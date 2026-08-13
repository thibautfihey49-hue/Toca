extends Node2D
signal changer(nom: String)
@onready var portail: Area2D = $PortailParc
@onready var frigo: Interactif = $Frigo
func _ready():
    portail.input_event.connect(_vers_parc)
    frigo.clique.connect(_frigo_ouvert)
func _vers_parc(_, e, __):
    if (e is InputEventMouseButton and e.pressed) or (e is InputEventScreenTouch and e.pressed):
        changer.emit("parc")
func _frigo_ouvert(): print("🍦 Frigo ouvert !")
