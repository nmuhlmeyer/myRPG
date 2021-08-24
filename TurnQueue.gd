extends Node2D

class_name TurnQueue

var active_character

func initialize():
	active_character = get_child(0)

#func play_turn():
	#yield(active_character.play_turn(), 'completed')
	#var new_index : int = (active_character.get_index() + 1) % get_child_count()
	#active_character = get_child(new_index)

var speed1 = 10
var speed2 = 15
var speed3 = 8
var tick = 0
var numTicks = 30
var inBattle = true
var isAlive

func _ready():
	turnTicks()
	
func turnTicks():
	var battlers = {'player' : speed1, 'enemy' : speed2, 'enemy2': speed3}
	var battler_ticks = {}
	for battler in battlers: # initialize battlers starting ticks
		battler_ticks[battler] = 0
	
	while inBattle:
		# start of battle actions
		tick += 1
		var numTurns = 0
		var tickVal = []
		for battler in battlers: # update turn position per battler
			battler_ticks[battler] += battlers[battler] # add speed each tick
			if battler_ticks[battler] >= numTicks:
				numTurns += 1
				tickVal.append(battler)
		if numTurns == 1:
			print(tickVal[0] + ' takes their turn.')
			battler_ticks[tickVal[0]] -= numTicks
		elif numTurns > 1:
			print('multiple battlers take turn')
			tickVal.sort() # sort battlers in reverse turn order
			tickVal.invert()
			#print(tickVal)
			#print(battler_ticks)
			#print(tickVal,battler_ticks)
			for battler in tickVal:
				print(battler + ' takes their turn.')
				battler_ticks[battler] -= numTicks
			
						
				
			
			#print(tickVal)
			
			#var maxValue = 0
			#for value in range(numTurns):
				#if value >= maxValue:
					#maxValue = value
			#var currentBattler
			#for battler in battlers:
				#if battlers[battler] == maxValue:
					#currentBattler = battler
				#break
			
			
			
			# resolve battlers
		
		
		if tick == 5: # battler dies
			var a
			battlers.erase('enemy')
			battler_ticks.erase('enemy')
		if tick == 10:
			inBattle = false
			
func getKeyList(dict):
	return dict.keys()
	
func getValueList(dict):
	return dict.values()

func play_turn():
	yield(active_character.play_turn(), 'completed')
	
