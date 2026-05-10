extends AnimatedSprite2D

func _ready() -> void:
	Sistemajogo.vidaBoss_modificada.connect(atualizar_life_boss)
	atualizar_life_boss(Sistemajogo.boss_vidas)

func atualizar_life_boss(life):
	match life:
		0: play("zero")
		1: play("um")
		2: play("dois")
		3: play("tres")
		4: play("quatro")
		5: play("cinco")
		6: play("seis")
		7: play("sete")
		8: play("oito")
		9: play("nove")
		10: play("full_dez")
		
