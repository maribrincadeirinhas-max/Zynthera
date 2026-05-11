extends TileMapLayer

func reset_game():
	Sistemajogo.vidas = 5
	emit_signal("vida_alterada", 5)
	Sistemajogo.boss_vidas = 10
	emit_signal("vidaBoss_modificada", 10)
	
	 
func fim_de_jogo():
	get_tree().change_scene_to_file("res://cenas/tela_derrota.tscn")
	reset_game()

func voce_venceu():
	get_tree().change_scene_to_file("res://cenas/tela_derrota.tscn")
	reset_game()
	
