extends Node
class_name Services
static var sauvegarde: SauvegardeManager
static var audio: AudioManager
func _ready():
    sauvegarde = SauvegardeManager.new()
    add_child(sauvegarde)
    audio = AudioManager.new()
    add_child(audio)
