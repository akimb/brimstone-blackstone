extends EquippableItem

class_name HarvestingTool

@export var affectedTypes : Array[ResourceNodeType]
@export var toolDamageValue : int = 1 

func interactWithBody(body):
	if (body is ResourceNode):
		for type in affectedTypes:
			if (body.resourceTypes.has(type)):
#				print_debug("Match found at type " + type.displayName + " on " + body.name)
				body.harvest(toolDamageValue)
