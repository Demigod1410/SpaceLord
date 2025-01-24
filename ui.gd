extends CanvasLayer
var time_passed := 0
static var img = load("res://heart.png")
func _health (amount):
	for child in $MarginContainer2/HBoxContainer.get_children():	
		child.queue_free() 
		
	for i in amount:
			var text_rect = TextureRect.new()
			text_rect.texture = img
			$MarginContainer2/HBoxContainer.add_child(text_rect)
			text_rect.stretch_mode = TextureRect.STRETCH_KEEP



func _on_score_timer_timeout():
	time_passed += 1
	$MarginContainer/Label.text = str(time_passed)
	Global.score = time_passed
