extends Node

var game_controller : GameController

enum MoveType {
	MOVEMENT,
	ATTACK,
	BLOCK,
	THROW,
}

enum ComboPiece {
	STARTER,
	LINKER,
	ENDER,
}

enum AttackLevel {
	LOW,
	MID,
	HIGH,
	AIR,
	RANGED,
	UNBLOCKABLE,
}

enum BlockLevel {
	NONE, 
	LOW, 
	HIGH, 
	AIR,
}
