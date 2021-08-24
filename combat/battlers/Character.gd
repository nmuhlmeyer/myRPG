extends Node

export var character_name: String = 'Character'

# Character Stats
export var maxHP: int
export var maxMP: int
export var maxWeight: int
export var pAttack: int
export var pDefense: int
export var mAttack: int
export var mDefense: int
export var restoration: int
export var speed: int
export var aggro: int
export var aim: int
export var evasion: int
export var crit: int

#maxHP = 100
#maxMP = 50
#pAttack = 10
#pDefense = 10
#mAttack = 10
#mDefense = 10
#accuracy = 10
#evasion = 10
#restoration = 10
#speed = 10

# Leveling Systems
export (int) var level = 1
var experience = 0
var experience_total = 0
var experience_required = get_required_experience(level + 1)

const a = 4 # EXP curve multiplier
const b = 1.8 # EXP curve exponent
const c = 8 # EXP curve constant

func get_required_experience(level):
	return round(pow(level, b) + level * a + c)

func gain_experience(amount):
	experience_total += amount
	experience += amount
	while experience >= experience_required:
		experience -= experience_required
		level_up()

func level_up():
	level += 1
	experience_required = get_required_experience(level + 1)
	
	var stats = ['maxHP', 'maxMP', 'pAttack', 'pDefense', 'mAttack', 'mDefense', 'restoration', 'aggro', 'aim', 'evasion', 'crit']
	#var statIncrease = [10, 5, 1, 1, 1, 1, 1, 1, 1, 1]
	#set() # set value of stat
	#get() # get value of stat
	var random_stat = stats[randi() % stats.size()]
	set(random_stat, get(random_stat) + randi() % 4)
