# PlayerController.gd

extends CharacterBody2D

var swing_distance = 100 # How far the player swings (pixels)
var max_angle = 90       # Max angle before pulling back
var rope_length = 80     # Rope length when grabbing tree

@onready var body = $PlayerCharacterBody
@onready var left_hand = $LeftHandGrabPoint
@onready var right_hand = $RightHandGrabPoint

# Called every frame
func _physics_process(delta):
    if Input.is_action_pressed("jump"):
        # Try to swing from nearby tree (area2D)
        var nearest_area = get_nearby_area()
        if nearest_area:
            start_swing(nearest_area)
# In PlayerController.gd or Main.gd
func _on_LanguageSwitchBtn_pressed():
    change_language("es")  # Switch to Spanish


func start_swing(area: Area2D):
    var direction = area.global_position - position
    var distance = direction.length()

    if distance < rope_length and not body.is_on_ground():
        # Pull back to center
        var angle_to_center = atan(direction.y / direction.x)
        
        # Rotate player toward the tree (Tarzan style!)
        rotate_by(angle_to_center + 180)

        # Apply force so they swing!
        var force_dir = Vector2(0, -1).rotated(angle_to_center)
        body.apply_impulse(force_dir * 50)

# Optional: Make "Grab Point" visible
func _ready():
    $LeftHandGrabPoint.visible = true
    $RightHandGrabPoint.visible = true


