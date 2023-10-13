@tool
extends EditorPlugin


func _enter_tree():
	# Initialization of the plugin goes here
	add_autoload_singleton("Rakugo", "res://addons/Rakugo/Rakugo.gd")

	ProjectSettings.set_setting("addons/rakugo/game_version", "1.0.0")
	ProjectSettings.set_setting("addons/rakugo/history_length", 30)
	ProjectSettings.set_setting("addons/rakugo/narrator/name", "narrator")
	ProjectSettings.set_setting("addons/rakugo/debug", false)
	ProjectSettings.set_setting("addons/rakugo/save_folder", "user://saves")

	print("Rakugo is enabled")


func _exit_tree():
	ProjectSettings.set_setting("addons/rakugo/game_version", null)
	ProjectSettings.set_setting("addons/rakugo/history_length", null)
	ProjectSettings.set_setting("addons/rakugo/narrator/name", null)
	ProjectSettings.set_setting("addons/rakugo/debug", null)
	ProjectSettings.set_setting("addons/rakugo/save_folder", null)
