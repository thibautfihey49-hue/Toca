extends Node
class_name GestionnaireScenes
const SCENES = {"maison":"res://scenes/maison/maison.tscn", "parc":"res://scenes/parc/parc.tscn"}
func _ready(): await get_tree().process_frame; changer("maison")
func changer(nom: String) -> void:
    if SCENES.has(nom): get_tree().change_scene_to_file(SCENES[nom])
    else: push_error("Scène inconnue : " + nom)
