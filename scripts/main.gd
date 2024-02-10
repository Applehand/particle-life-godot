extends Node2D

var num_particles: int = 100
var particle_scene: PackedScene = preload("res://scenes/Particle.tscn")
var all_particles: Array[Particle]

@onready var viewport_rect: Vector2 = get_viewport_rect().size


func _ready() -> void:
	spawn_particles()
	for child in get_children():
		if child is Particle:
			all_particles.append(child)


func spawn_particles() -> void:
	for i in range(num_particles):
		var particle: Particle = particle_scene.instantiate()
		add_child(particle)
		var rng = RandomNumberGenerator.new()
		var rndX = rng.randi_range(0, viewport_rect.x)
		var rndY = rng.randi_range(0, viewport_rect.y)
		particle.position = Vector2(rndX, rndY)

func _physics_process(delta: float) -> void:
	for particle in all_particles:
		particle.calculate_position(all_particles)
		#particle.position.x = clamp(position.x, 0, viewport_rect.x)
		#particle.position.y = clamp(position.x, 0, viewport_rect.y)
	
