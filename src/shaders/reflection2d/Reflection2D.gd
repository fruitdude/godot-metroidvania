# Forwards the Y zoom and Y scale values to the mirror shader
tool
extends Sprite


func _ready() -> void:
	connect("item_rect_changed", self, "_on_item_rect_changed")
	connect("texture_changed", self, "update_aspect_ratio")
	update_aspect_ratio()


func update_aspect_ratio() -> void:
	#calculating texture size and ratio before passing it to the shader
	var size: Vector2 = texture.get_size()
	material.set_shader_param("aspect_ratio", size.x / size.y)
	

func _process(_delta: float) -> void:
	update_zoom(get_viewport_transform().y.y)


func update_zoom(value: float) -> void:
	material.set_shader_param("zoom_y", value)


func _on_item_rect_changed() -> void:
	material.set_shader_param("scale_y", scale.y)
