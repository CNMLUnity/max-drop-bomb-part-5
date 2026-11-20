extends RigidBody3D


func _ready() -> void:
	contact_monitor = true
	max_contacts_reported = 1
	body_entered.connect(_on_body_entered)


func _on_body_entered(_body: Node) -> void:
	Globals.hit.emit()
