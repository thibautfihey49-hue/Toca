extends Node
class_name SauvegardeManager
var donnees: Dictionary = {}
const CHEMIN = "user://sauvegarde.json"
func sauvegarder(e: Dictionary) -> void:
    donnees.merge(e, true)
    var f = FileAccess.open(CHEMIN, FileAccess.WRITE)
    if f: f.store_string(JSON.stringify(donnees)); f.close()
func charger() -> Dictionary:
    if FileAccess.file_exists(CHEMIN):
        var f = FileAccess.open(CHEMIN, FileAccess.READ)
        var txt = f.get_as_text()
        f.close()
        var res = JSON.parse_string(txt)
        donnees = res if res is Dictionary else {}
    return donnees
