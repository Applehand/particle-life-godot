extends RigidBody2D
class_name Particle


@export var min_speed: int = 1
@export var max_speed: int = 2
@export var attr_str: float = 0.0002
@export var repel_str: float = 0.1

@export var scaling_factor: float = 0.0005
var colors = ['red', 'green', 'blue']
#var colors = {
	#"red": Color.RED,
	#"green": Color.GREEN,
	#"blue": Color.BLUE,
#}
var color

func _ready() -> void:
	color = colors.pick_random()

func calculate_position(all_particles) -> void:
	var direction: Vector2 = Vector2.ZERO
	var total_force: Vector2 = Vector2.ZERO
	var acceleration: Vector2 = Vector2.ZERO
	var distance: float = 0.0

	for particle in all_particles:
		if color == particle.color:
			continue
		direction *= 0
		direction = particle.position
		direction -= position
		distance = direction.length()
		direction.normalized()
		var min_distances: Dictionary = ParticleInteractionData.tables['min_distances'][color]
		var target_distance = min_distances.get(particle.color)
		if distance < target_distance:
			var force: Vector2 = direction
			force *= abs(min_distances[particle.color])*-3
			force *= remap(distance, 0, target_distance, 1, 0)
			force *= scaling_factor
			total_force += force
			
	acceleration += total_force
	linear_velocity += acceleration
	position += linear_velocity


func _process(_delta) -> void:
	queue_redraw()

func _draw() -> void:
	draw_circle(position, 2.0, Color.WHITE)
