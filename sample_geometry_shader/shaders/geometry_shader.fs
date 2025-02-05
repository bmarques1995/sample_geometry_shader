#version 450 core
layout (location = 0) in vec3 fColor;
layout (location = 0) out vec4 FragColor;

void main()
{
    FragColor = vec4(fColor, 1.0);   
}

//glslangValidator --glsl-version 450 --target-env vulkan1.3 -o geometry_shader.gs.spv -S geom ./geometry_shader.gs
//spirv-cross --hlsl ./geometry_shader.ps.spv --output geometry_shader.ps.hlsl