extends Control

@onready var somBtn : AudioStreamPlayer2D = $AudioStreamPlayer2D

func _on_menu_btn_button_down() -> void:
	get_tree().change_scene_to_file("res://cenas/menu.tscn")

func _on_menu_btn_mouse_entered() -> void:
	somBtn.play()
