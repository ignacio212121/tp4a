extends Node2D

@onready var _MainWindow: Window = get_window()
@onready var _SubWindow: Window = $Window

func _ready():
#sharing the same world as subwindow
	_SubWindow.world_2d = _MainWindow.world_2d
	$Window2.world_2d = _MainWindow.world_2d
# declare the variables...

		# Enable per-pixel transparency, required for transparent windows but has a performance cost
		# Can also break on some systems
	ProjectSettings.set_setting("display/window/per_pixel_transparency/allowed", true)
		# Set the window settings - most of them can be set in the project settings
	_MainWindow.borderless = true		# Hide the edges of the window
	_MainWindow.unresizable = true		# Prevent resizing the window
	_MainWindow.always_on_top = true	# Force the window always be on top of the screen
	_MainWindow.gui_embed_subwindows = false # Make subwindows actual system windows <- VERY IMPORTANT
	_MainWindow.transparent = true		# Allow the window to be transparent
		# Settings that cannot be set in project settings
	_MainWindow.transparent_bg = true	# Make the window's background transparent
		
		# set the subwindow's world...
		# The window's size may need to be smaller than the default minimum size
	# so we have to change the minimum size BEFORE setting the window's size
	_MainWindow.size = Vector2(1920,1080)
	#_MainWindow.size = _MainWindow.min_size
	_MainWindow.position = Vector2(1920,0)
	_SubWindow.position = Vector2(1920,0)
	$Window2.position = Vector2(0,0)
	# set the subwindow's world...
