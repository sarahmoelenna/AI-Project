/*
    Beginning DirectX 11 Game Programming
    By Allen Sherrod and Wendy Jones

    Texture Mapping Shader
*/


Texture2D colorMap_ : register( t0 );
SamplerState colorSampler_ : register( s0 );

cbuffer cbChangesEveryFrame : register( b0 )
{
    matrix worldMatrix;
};

struct VS_Input
{
    float4 pos  : POSITION;
    float2 tex0 : TEXCOORD0;
};

struct PS_Input
{
    float4 pos  : SV_POSITION;
    float2 tex0 : TEXCOORD0;
};


PS_Input VS_Main( VS_Input vertex )
{
    PS_Input vsOut = ( PS_Input )0;
    vsOut.pos = mul( vertex.pos, worldMatrix );
    vsOut.tex0 = vertex.tex0;

    return vsOut;
}


float4 PS_Main( PS_Input frag ) : SV_TARGET
{
    return colorMap_.Sample( colorSampler_, frag.tex0 );
}