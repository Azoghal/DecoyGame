extends Node

enum COLOUR {RED=0,GREEN=1,BLUE=2}
var colouroptions = {
	COLOUR.RED: Color.INDIAN_RED,
	COLOUR.GREEN: Color.SEA_GREEN,
	COLOUR.BLUE: Color.CORNFLOWER_BLUE
}
var colournames = {
	COLOUR.RED: "RED",
	COLOUR.GREEN: "GREEN",
	COLOUR.BLUE: "BLUE"
}
var colourcolour = {
	COLOUR.RED: COLOUR.RED,
	COLOUR.GREEN: COLOUR.GREEN,
	COLOUR.BLUE: COLOUR.BLUE
}

func set_colour(bob:Node2D, col: COLOUR):
	bob.modulate = colouroptions[col]

func random_colour() -> COLOUR:
	return colourcolour[randi_range(0,len(COLOUR.values())-1)]
