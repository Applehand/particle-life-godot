extends Node

var rng = RandomNumberGenerator.new()

var red_forces = {
			"green" : rng.randf_range(-1.0, 1.0),
			"blue" : rng.randf_range(-1.0, 1.0)
		}
var green_forces = {
			"red" : rng.randf_range(-1.0, 1.0),
			"blue" : rng.randf_range(-1.0, 1.0)
		}
var blue_forces = {
			"green" : rng.randf_range(-1.0, 1.0),
			"red" : rng.randf_range(-1.0, 1.0)
		}
var red_min_dist = {
			"green" : rng.randf_range(30.0, 50.0),
			"blue" : rng.randf_range(30.0, 50.0)
		}
var green_min_dist = {
			"red" : rng.randf_range(30.0, 50.0),
			"blue" : rng.randf_range(30.0, 50.0)
		}
var blue_min_dist = {
			"green" : rng.randf_range(30.0, 50.0),
			"red" : rng.randf_range(30.0, 50.0)
		}
var red_radius = {
			"green" : rng.randf_range(7.0, 250.0),
			"blue" : rng.randf_range(70.0, 250.0)
		}
var green_radius = {
			"red" : rng.randf_range(70.0, 250.0),
			"blue" : rng.randf_range(70.0, 250.0)
		}
var blue_radius = {
			"green" : rng.randf_range(70.0, 250.0),
			"red" : rng.randf_range(70.0, 250.0)
		}

var tables = {
	"force": {
		"red" : red_forces,
		"green" : green_forces,
		"blue" : blue_forces,
	},
	"min_distances": {
		"red" : red_min_dist,
		"green" : green_min_dist,
		"blue" : blue_min_dist,
	},
	"radii": {
		"red" : red_radius,
		"green" : green_radius,
		"blue" : blue_radius,
	},
}
