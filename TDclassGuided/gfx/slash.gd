extends Area2D

var damage = 10
var knockback = 64.0
var anim_life = 0.2
func _process(delta):
	anim_life -= delta
	if anim_life < 0:
		queue_free()
		return
	
	for enemy in get_tree().get_nodes_in_group("enemy"):
		if overlaps_body(enemy):
			enemy.take_damage(damage, self)
			enemy.interta = (enemy.global_position-self.global_position).normalized() * knockback
			
	pass
