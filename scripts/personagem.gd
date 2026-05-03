extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -620.0
@onready var anim = $AnimatedSprite2D
@onready var zona_morte = $"../Area2D"
@onready var fase1 = $".."
var atacando = false

func _physics_process(delta: float) -> void:

	if not atacando:
		if not is_on_floor():
			velocity += get_gravity() * delta

		if Input.is_action_just_pressed("pulo") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY
	
		var direction := Input.get_axis("esquerda", "direita")
		if direction:
			velocity.x = direction * SPEED
			anim.play("caminhando")
		
			if direction < 0:
				$AnimatedSprite2D.flip_h = true
			else:
				$AnimatedSprite2D.flip_h = false
		elif direction == 0:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			anim.play("parado")
		
	if Input.is_action_just_pressed("ataque_jogador"):
		ataque()
		velocity.x = move_toward(velocity.x, 0, SPEED)
		rebater_projeteis()
		
	move_and_slide()
	
func ataque():
	atacando = true
	anim.play("ataque")
	await anim.animation_finished
	atacando = false
	
func rebater_projeteis():
	var areas = $rebater.get_overlapping_areas()

	for area in areas:
		if area.has_method("rebater"):
			area.rebater(Vector2.RIGHT)

func _on_area_2_dzona_body_entered(body: Node2D) -> void:
	if body.name.contains("jogador"):
		Fase1.fim_de_jogo()
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	if (area.name.begins_with("inimigo_projetil")):
			Sistemajogo.receber_dano(1)
