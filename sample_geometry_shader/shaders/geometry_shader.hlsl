// Vertex Shader (HLSL compatible)
struct VSInput {
    float2 aPos : POSITION;
    float3 aColor : COLOR;
};

struct VSOutput {
    float4 position : SV_POSITION;
    float3 color : COLOR;
};

VSOutput vs_main(VSInput input) {
    VSOutput output;
    output.color = input.aColor;
    output.position = float4(input.aPos, 0.0, 1.0);
    return output;
}

// Geometry Shader (HLSL compatible)
struct GSInput {
    float4 position : SV_POSITION;
    float3 color : COLOR;
};

struct GSOutput {
    float4 position : SV_POSITION;
    float3 color : COLOR;
};

[maxvertexcount(5)]
void gs_main(point GSInput input[1], inout TriangleStream<GSOutput> OutputStream) {
    GSOutput output;
    output.color = input[0].color;
    
    output.position = input[0].position + float4(-0.2, -0.2, 0.0, 0.0);
    OutputStream.Append(output);
    output.position = input[0].position + float4( 0.2, -0.2, 0.0, 0.0);
    OutputStream.Append(output);
    output.position = input[0].position + float4(-0.2,  0.2, 0.0, 0.0);
    OutputStream.Append(output);
    output.position = input[0].position + float4( 0.2,  0.2, 0.0, 0.0);
    OutputStream.Append(output);
    
    output.color = float3(1.0, 1.0, 1.0);
    output.position = input[0].position + float4( 0.0,  0.4, 0.0, 0.0);
    OutputStream.Append(output);
    
    OutputStream.RestartStrip();
}

// Fragment Shader (HLSL compatible)
struct PSInput {
    float3 color : COLOR;
};

float4 ps_main(PSInput input) : SV_TARGET {
    return float4(input.color, 1.0);
}