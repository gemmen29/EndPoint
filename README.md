# EndPoint Godot Project

This is a Godot 4 conversion of the Unity "EndPoint" project.

## Setup Instructions

1.  **Open in Godot**: Open Godot 4.x and import this folder (`H:\Godot Project\end-point`) as a project.
2.  **Create Scenes**: Since Unity scenes cannot be automatically converted, you need to recreate them in Godot.

### Player Setup
1.  Create a new Scene with a `RigidBody2D` as the root.
2.  Add a `Sprite2D` (for the ball visual) and a `CollisionShape2D` (Circle).
3.  Attach the `BallController.gd` script to the root `RigidBody2D`.
4.  Add the player node to a Group named "Player" (Node tab -> Groups).
5.  Adjust `Move Speed`, `Roll Torque`, and `Jump Force` in the Inspector as needed (Godot units are pixels, so values are higher than Unity).

### Hazard Setup
1.  Create a new Scene with an `Area2D` as the root.
2.  Add a `Sprite2D` and `CollisionShape2D`.
3.  Attach `Hazard.gd`.
4.  Ensure the `Player Group` property matches the group you added the player to ("Player").

### EndPoint Setup
1.  Create a new Scene with an `Area2D` as the root.
2.  Add a `Sprite2D` and `CollisionShape2D`.
3.  Attach `EndPoint.gd`.

### FlipOnCapsule Setup
1.  Create a new Scene with an `Area2D` as the root.
2.  Add a `Sprite2D` and `CollisionShape2D`.
3.  Attach `FlipOnCapsule.gd`.
4.  **Important**: In your main level scene, assign the `Map Root` property to the Node2D that holds your level geometry/tilemap that you want to rotate.

## Inputs
The scripts use default Godot UI actions:
-   **Move**: Arrow Keys (Left/Right) or `ui_left`/`ui_right`.
-   **Jump**: Up/Down Arrow or `ui_up`/`ui_down`.
-   **Flip**: Space or Enter (`ui_accept`).

You can customize these in `Project -> Project Settings -> Input Map`.
