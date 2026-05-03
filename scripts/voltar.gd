extends Control


func _on_voltar_btn_button_down() -> void:
	get_tree().change_scene_to_file("res://cenas/menu.tscn")
