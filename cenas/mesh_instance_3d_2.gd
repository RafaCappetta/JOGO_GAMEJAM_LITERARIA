extends MeshInstance3D

func _ready():
	
	var meu_viewport = $SubViewport 
	
	var material_video = StandardMaterial3D.new()
	
	material_video.albedo_texture = meu_viewport.get_texture()
	
	material_video.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	
	material_override = material_video
