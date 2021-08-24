extends Label

func update_text(maxHP, maxMP, maxweight, pAttack, pDefense, mAttack, mDefense, restoration, speed, aggro, aim, evasion, crit):
	text = """Max HP: %s
			Max MP: %s
			Weight %s
			Physical Attack: %s
			Physical Defense: %s
			Magic Attack: %s
			Magic Defense: %s
			Restoratative Power: %s
			Speed: %s
			Chance of Being Targeted: %s
			Aim: %s
			Evasion: %s
			Critical Chance: %s
			
			""" % [maxHP, maxMP, maxweight, pAttack, pDefense, mAttack, mDefense, restoration, speed, aggro, aim, evasion, crit]
