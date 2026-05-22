extends Control

@onready var somBtn : AudioStreamPlayer2D = $AudioStreamPlayer2D

func _on_play_btn_button_down() -> void:
	get_tree().change_scene_to_file("res://cenas/fase1.tscn")
	Fase1.reset_game()

func _on_exit_btn_button_down() -> void:
	get_tree().quit()

func _on_controles_btn_button_down() -> void:
	get_tree().change_scene_to_file("res://cenas/controles.tscn")

func _on_play_btn_mouse_entered() -> void:
	som_de_click()

func _on_controles_btn_mouse_entered() -> void:
	som_de_click()

func _on_exit_btn_mouse_entered() -> void:
	som_de_click()

func som_de_click():
	somBtn.play()
