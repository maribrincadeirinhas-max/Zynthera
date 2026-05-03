extends Area2D

var velocidade = 300
var direction = Vector2.LEFT


func _process(delta: float) -> void:
	position += direction * velocidade * delta

func initialize(spawn_pos: Vector2, dir: Vector2):
	global_position = spawn_pos
	direction = dir
	
func rebater(nova_direcao: Vector2):
	direction = nova_direcao.normalized()
	$AnimatedSprite2D.flip_h = true
	name = "projetil_rebatido"
	$AnimatedSprite2D.modulate = Color(0.825, 0.031, 0.338, 1.0)

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
