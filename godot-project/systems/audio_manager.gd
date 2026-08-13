extends Node
class_name AudioManager
@onready var lecteur = AudioStreamPlayer.new()
func _ready(): add_child(lecteur)
func jouer(s: AudioStream) -> void:
    if s: lecteur.stream = s; lecteur.play()
