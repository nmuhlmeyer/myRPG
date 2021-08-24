extends Node

onready var _character = $Character
onready var _level = $Interface/Level
onready var _stats = $Interface/Stats
onready var _bar = $Interface/ExperienceBar

func _ready():
	_level.update_text(_character.level, _character.experience, _character.experience_required)
	_stats.update_text(_character.maxHP, _character.maxMP, _character.maxWeight, _character.pAttack, _character.pDefense, _character.mAttack, _character.mDefense, _character.restoration, _character.speed, _character.aggro, _character.aim, _character.evasion, _character.crit)
	
func _input(event): # Only for testing
	if not event.is_action_pressed('ui_accept'):
		return
	_character.gain_experience(50)
	_level.update_text(_character.level, _character.experience, _character.experience_required)
