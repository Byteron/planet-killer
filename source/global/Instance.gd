extends Node

var Bullet = preload("res://source/projectiles/Bullet.tscn")

func Bullet(pos, rot, speed = 1000):
	var bullet = Bullet.instance()
	bullet.initialize(pos, rot, speed)
	return bullet