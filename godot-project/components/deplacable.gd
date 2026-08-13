extends Node
class_name Deplacable
@export var cible: Node2D
@export var vitesse: float = 150.0
var dest = Vector2.ZERO
var en_cours = false
func deplacer_vers(p: Vector2) -> void: dest = p; en_cours = true
func _physics_process(d: float) -> void:
    if not en_cours or not cible: return
    cible.position = cible.position.move_toward(dest, vitesse * d)
    if cible.position.distance_to(dest) < 5: en_cours = false
