extends Node

var Bullet = preload("res://source/projectiles/Bullet.tscn")
var Enemy = preload("res://source/enemies/Enemy.tscn")
var Explosion = preload("res://source/particles/Explosion.tscn")

func Bullet(pos, rot, speed, spread):
	var bullet = Bullet.instance()
	bullet.initialize(pos, rot, speed, spread)
	return bullet

func Enemy():
	return Enemy.instance()

func Explosion():
	return Explosion.instance()
