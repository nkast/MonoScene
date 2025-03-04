﻿
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// CONSTANTS
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// MetallicRoughness Shader
// - R : Oclussion, or unused if alternate occlusion map is defined
// - G : Metallic factor
// - B : Roughness factor
// - A : Unused

// SpecularGlossiness Shader
// - R : specular Red     \
// - G : specular Green    |- specular RGB
// - B : specular Blue    /
// - A : Glossiness

DECLARE_TEXTURE(SecondaryTexture, 2);

float4 SecondaryScale;
int SecondaryTextureIdx;
float3 SecondaryTransformU;
float3 SecondaryTransformV;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// FUNCTIONS
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

float4 GetSecondarySample(float2 uv0, float2 uv1)
{
    float3 uvw = float3(SecondaryTextureIdx < 1 ? uv0 : uv1, 1);
    uv0.x = dot(uvw, SecondaryTransformU);
    uv0.y = dot(uvw, SecondaryTransformV);

    return SAMPLE_TEXTURE(SecondaryTexture, uv0);
}