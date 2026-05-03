extends Node

signal vida_alterada(vidas)
signal vidaBoss_modificada(boss_vidas)

var vidas = 5
var boss_vidas = 10

func receber_dano(valor):
	vidas -= valor
	emit_signal("vida_alterada", vidas)
	
	if vidas < 1:
		Fase1.fim_de_jogo()
		
func recDano_boss_fase1(valor):
	boss_vidas -= valor
	emit_signal("vidaBoss_modificada", boss_vidas)
	
	if boss_vidas <= 0:
		get_tree().change_scene_to_file("res://cenas/tela_vitoria.tscn")
