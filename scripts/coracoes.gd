extends AnimatedSprite2D

func _ready():
	Sistemajogo.vida_alterada.connect(atualizar_coracoes)
	atualizar_coracoes(Sistemajogo.vidas) 

func atualizar_coracoes(vidas):
	match vidas:
		5: play("cinco")
		4: play("quatro")
		3: play("tres")
		2: play("dois")
		1: play("um")
		0: play("zero")
