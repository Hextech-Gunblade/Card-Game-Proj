extends Node2D

const CARD_SCENE_PATH = "res://CardScenes/Card.tscn"

var player_deck = ["Garen","Garen","Ezreal","Ezreal","Morgana","Morgana","Thresh"]
var card_database_reference 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print($Area2D.collision_mask)
	#player_deck.shuffle() //  Shuffle your bullshit deck lmao
	card_database_reference = preload("res://Scripts/CardDatabase.gd")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func draw_card():
	
	var card_drawn = player_deck[0]
	player_deck.erase(card_drawn)
	
	if player_deck.size() == 0:
		$Area2D/CollisionShape2D.disabled = true
		$Sprite2D.visible = false
		
	var card_scene = preload(CARD_SCENE_PATH)
	var new_card = card_scene.instantiate()
	var card_image_path = str("res://Assets/"+ card_drawn +".png")
	new_card.get_node("CardImage").texture = load(card_image_path)
	new_card.get_node("Type").text = str(card_database_reference.CARDS[card_drawn][0])
	new_card.get_node("Agi").text = str(card_database_reference.CARDS[card_drawn][1])
	new_card.get_node("Dex").text = str(card_database_reference.CARDS[card_drawn][2])
	new_card.get_node("Mana").text = str(card_database_reference.CARDS[card_drawn][3])
	new_card.get_node("Wis").text = str(card_database_reference.CARDS[card_drawn][4])
	new_card.get_node("Atk").text = str(card_database_reference.CARDS[card_drawn][5])
	new_card.get_node("HP").text = str(card_database_reference.CARDS[card_drawn][6])
	new_card.get_node("Def").text = str(card_database_reference.CARDS[card_drawn][7])
	$"../CardManager".add_child(new_card)
	new_card.name =  "Card"
	$"../PlayerHand".add_card_to_hand(new_card)
