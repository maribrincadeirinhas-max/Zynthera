extends CharacterBody2D


@export var tempo_entre_tiros := 1.5

var projetil_geleia = preload("res://cenas/projetil_geleia.tscn")
@onready var spawn_point = $Marker2D
@onready var spawn_point2 = $Marker2D2
@onready var spawn_point3 = $Marker2D3
@onready var notifier = $VisibleOnScreenNotifier2D

var ativo := true

func _ready():
	atirar_loop(spawn_point, tempo_entre_tiros)
	atirar_loop(spawn_point2, 2.5)
	atirar_loop(spawn_point3, 0.8)

func atirar_loop(spawn: Marker2D, velocidade: float):
	while ativo:
		atirar(spawn)
		await get_tree().create_timer(velocidade).timeout

func atirar(ponto: Marker2D):
	var projetil = projetil_geleia.instantiate()
	get_parent().add_child(projetil)
	projetil.name = "inimigo_projetil"
	projetil.initialize(ponto.global_position, Vector2.LEFT)
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	if (area.name.begins_with("projetil_rebatido")):
		Sistemajogo.recDano_boss_fase1(1)
		
