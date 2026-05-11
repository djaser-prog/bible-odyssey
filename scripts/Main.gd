# Add inside _physics_process()
if position.distance_to(area.global_position) < 10 and Input.is_action_pressed("jump"):
    $VoiceOfGodLabel.visible = true
    $VoiceOfGodLabel.text = "Behold! I am the Lord who made the Garden."
    # Optional: Auto hide after 3 seconds
    wait(3)
    $VoiceOfGodLabel.visible = false
