extends Node

var Bullet = preload("res://source/projectiles/Bullet.tscn")

func Bullet(pos, rot, speed, spread):
	var bullet = Bullet.instance()
	bullet.initialize(pos, rot, speed, spread)
	return bullet