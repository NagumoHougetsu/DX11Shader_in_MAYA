float4x4 gWVP   :   WorldViewProjection;
float4x4 gWIT   :   WorldInverseTranspose;
float4x4 gW     :   World;
float4x4 gVI    :   ViewInverse;
float4x4 gVP    :   ViewProjection;

float3 gLight0Dir   :   DIRECTION <
    string Object = "Light 0";
    int UIOrder = 0;
>;

float3 gLight0Pos   :   POSITION <
    string Object = "Light 0";
    int UIOrder = 1;
>;

Texture2D gLight0ShadowMap  :   ShadowMap <
    string Object = "Light 0";
    int UIOrder = 2;
>;

float4x4 gMatLight  :   shadowMapMatrix <
    string Object = "Light 0";
    int UIOrder = 3;
>;

uniform bool gUseBaseColorTexture <
    string UIGroup = "Shading";
    int UIOrder = 100;
    string UIName = "Use BaseColor Texture";
> = false;

uniform Texture2D gBaseColorTexture <
    string UIGroup = "Shading";
    int UIOrder = 101;
    string UIName = "BaseColorTexture";
    string UIWidget = "FilePicker";
    string ResourceType = "2D";
>;

uniform float3 gBaseColor <
    string UIGroup = "Shading";
    int UIOrder = 102;
    string UIName = "Base Color";
    string UIWidget = "ColorPicker";
> = {1.0f, 1.0f, 1.0f};

uniform bool gUseShadowColorTexture <
    string UIGroup = "Shading";
    int UIOrder = 103; 
    string UIName = "Use ShadowColor Texture";
> = false;

uniform Texture2D gShadowColorTexture <
    string UIGroup = "Shading";
    int UIOrder = 104;
    string UIName = "ShadowColor Texture";
    string UIWidget = "FilePicker";
    string ResourceType = "2D";
>;

uniform float3 gShadowColor <
    string UIGroup = "Shading";
    int UIOrder = 105;
    string UIName = "Shadow Color";
    string UIWidget = "ColorPicker";
> = {0.0f, 0.0f, 0.0f};

uniform float gToonThreshold <
    string UIGroup = "Shading";
    int UIOrder = 106;
    string UIName = "Toon Threshold";
    float UIMin = -1.0f;
    float UIMax = 1.0f;
> = 0.0f;

uniform float gToonFeather <
    string UIGroup = "Shading";
    int UIOrder = 107;
    string UIName = "Toon Feather";
    float UIMin = 0.0f;
    float UIMax = 1.0f;
> = 0.0f;

uniform bool gUseOutline <
    string UIGroup = "Outline";
    int UIOrder = 200;
    string UIName = "Use Outline";
> = false;

uniform bool gUseOutlineColorTexture <
    string UIGroup = "Outline";
    int UIOrder = 201;
    string UIName = "Use Outline Color Texture";
> = false;

uniform Texture2D gOutlineColorTexture <
    string UIGroup = "Outline";
    int UIOrder = 202;
    string UIName = "Outline Color Texture";
    string UIWidget = "FilePicker";
    string ResourceType = "2D";
>;

uniform float3 gOutlineColor <
    string UIGroup = "Outline";
    int UIOrder = 203;
    string UIName = "Outline Color";
    string UIWidget = "ColorPicker";
> = {0.0f, 0.0f, 0.0f};

uniform float gOutlineWidth <
    string UIGroup = "Outline";
    int UIOrder = 204;
    string UIName = "Outline Width";
    float UIMin = 0.0f;
    float UIMax = 3.0f;
> = 1.0f;

uniform bool gUseLightDirThin <
    string UIGroup = "Outline";
    int UIOrder = 205;
    string UIName = "LightDir Thin";
> = false;

uniform float gLightDirThinDegree <
    string UIGroup = "Outline";
    int UIOrder = 206;
    string UIName = "Thin Degree";
    float UIMin = 0.0f;
    float UIMax = 1.0f;
> = 0.0f;

uniform bool gUseColorTresses <
    string UIGroup = "Outline";
    int UIOrder = 207;
    string UIName = "Use ColorTresses";
> = false;

uniform bool gUseOutlineMask <
    string UIGroup = "Outline";
    int UIOrder = 208;
    string UIName = "Use Outline Mask";
> = false;

uniform int gOutlineMaskSource <
    string UIGroup = "Outline";
    int UIOrder = 209;
    string UIName = "Outline Mask Source";
    string UIFieldNames = "Mask Texture:Color Alpha";
    int UIMin = 0;
    int UIMax = 1;
> = 0;

uniform Texture2D gOutlineMaskTexture <
    string UIGroup = "Outline";
    int UIOrder = 210;
    string UIName = "Outline Mask Texture";
    string UIWidget = "FilePicker";
    string ResourceType = "2D";
>;

uniform bool gUseDistanceWidth <
    string UIGroup = "Outline";
    int UIOrder = 211;
    string UIName = "Distance Width";
> = false;

uniform float gDistanceWidthDegree <
    string UIGroup = "Outline";
    int UIOrder = 212;
    string UIName = "Distance Width Degree";
    float UIMin = 0.0f;
    float UIMax = 1.0f;
> = 1.0f;

uniform bool gUseRim <
    string UIGroup = "Rimlight";
    int UIOrder = 300;
    string UIName = "Use Rim";
> = false;

uniform int gRimBlendMode <
    string UIGroup = "Rimlight";
    int UIOrder = 301;
    string UIName = "Rim Blend Mode";
    string UIFieldNames = "Screen:Add:Dodge color";
    int UIMin = 0;
    int UIMax = 2;
> = 0;

uniform bool gUseRimColorTexture<
    string UIGroup = "Rimlight";
    int UIOrder = 302;
    string UIName = "Use Rim ColorTexture";
> = false;

uniform float3 gRimColor<
    string UIGroup = "Rimlight";
    int UIOrder = 303;
    string UIName = "Rim Color"; 
    string UIWidget = "ColorPicker";
> = {1.0f, 1.0f, 1.0f};

uniform Texture2D gRimColorTexture<
    string UIGroup = "Rimlight";
    int UIOrder = 304;
    string UIName = "Rim Color Texture";
    string UIWidget = "FilePicker";
    string ResourceType = "2D";
>;

uniform float gRimLevel<
    string UIGroup = "Rimlight";
    int UIOrder = 305;
    string UIName = "Rim Level";
    float UIMin = 0.0f;
    float UIMax = 1.0f;
> = 1.0f;

uniform float gRimArea<
    string UIGroup = "Rimlight";
    int UIOrder = 306;
    string UIName = "Rim Area";
    float UIMin = 0.0f;
    float UIMax = 1.0f;
> = 0.5f;

uniform float gRimFeather<
    string UIGroup = "Rimlight";
    int UIOrder = 307;
    string UIName = "Rim Feather";
    float UIMin = 0.0f;
    float UIMax = 1.0f;
> = 0.0f;

uniform bool gLightDirMask <
    string UIGroup = "Rimlight";
    int UIOrder = 308;
    string UIName = "Use LightDir Thin";
> = false;

uniform float gLightDirMaskDegree <
    string UIGroup = "Rimlight";
    int UIOrder = 309;
    string UIName = "Thin Degree";
    float UIMin = 0.0f;
    float UIMax = 1.0f;
> = 0.0f;

uniform bool gUseNormalMap <
    string UIGroup = "NormalMap";
    int UIOrder = 400;
    string UIName = "Use NormalMap";
> = false;

uniform Texture2D gNormalMap <
    string UIGroup = "NormalMap";
    int UIOrder = 401;
    string UIName = "NormalMap";
    string UIWidget = "FilePicker";
    string ResourceType = "2D";
>;

uniform float gNormalIntensity <
    string UIGroup = "NormalMap";
    int UIOrder = 402;
    string UIName = "Normal Intensity";
    float UIMin = 0.0f;
    float UIMax = 5.0f;
> = 1.0f;

uniform bool gUseCastShadow <
    string UIGroup = "CastShadow";
    int UIOrder = 500;
    string UIName = "Use Cast Shadow";
> = false;

uniform int gShadowMethod <
    string UIGroup = "CastShadow";
    int UIOrder = 501;
    string UIName = "Shadow Method";
    string UIFieldNames = "Depth Shadow:PCF Soft Shadow";
    int UIMin = 0;
    int UIMax = 1;
> = 0;

uniform float gShadowIntensity <
    string UIGroup = "CastShadow";
    int UIOrder = 502;
    string UIName = "Shadow Intensity";
    float UIMin = 0.0f;
    float UIMax = 1.0f;
> = 0.5f;

uniform bool gUseGamma <
    string UIGroup = "Color Space";
    int UIOrder = 600;
    string UIName = "Gamma 2.2";
> = true;

uniform SamplerState gWrapSampler{
    Filter = MIN_MAG_MIP_LINEAR;
    AddressU = WRAP;
    AddressV = WRAP;
};

uniform SamplerComparisonState gCompSampler{
    Filter = COMPARISON_MIN_MAG_MIP_LINEAR;
    ComparisonFunc = GREATER;
    MaxAnisotropy = 1;
};

struct VS_INPUT{
    float4 Position :   POSITION;
    float4 Normal   :   NORMAL;
    float4 Tangent  :   TANGENT;
    float2 UV       :   TEXCOORD0;
};

struct VS_TO_PS{
    float4 HPos     :   SV_Position;
    float4 Normal   :   NORMAL;
    float4 Tangent  :   TANGENT;
    float3 Binormal :   BINORMAL;
    float2 UV       :   TEXCOORD0;
    float3 View     :   TEXCOORD1;
    float4 posInLVP :   TEXCOORD2;
};

VS_TO_PS VS(VS_INPUT In){
    VS_TO_PS Out;
    Out.HPos = mul(In.Position, gWVP);
    Out.Normal = mul(In.Normal, gWIT);
    Out.Tangent = normalize(mul(In.Tangent, gWIT));
    Out.Binormal = cross(In.Normal, In.Tangent).xyz * In.Tangent.w;
    Out.Binormal = normalize(mul(float4(Out.Binormal, 0.0f), gWIT));
    Out.UV = float2(In.UV.x, (1.0f - In.UV.y));
    Out.View = normalize(mul(In.Position, gW).xyz - gVI[3].xyz);
    Out.posInLVP = mul(In.Position, gMatLight);
    Out.posInLVP.z = distance(mul(In.Position, gW), gLight0Pos)/1000;
    return Out;
}

VS_TO_PS VS_OUTLINE(VS_INPUT In){
    VS_TO_PS Out;
    float4 worldPosition = mul(In.Position, gW);
    float4 worldNormal = mul(In.Normal, gWIT);
    if(gUseOutline == true){
        worldNormal.xyz *= gOutlineWidth;
        if(gUseOutlineMask == true){
            float outlineMask = float3(1.0f, 1.0f, 1.0f);
            if(gOutlineMaskSource == 0){
                outlineMask = gOutlineMaskTexture.SampleLevel(gWrapSampler, In.UV, 0).r;
            }else if(gOutlineMaskSource == 1){
                outlineMask = gOutlineColorTexture.SampleLevel(gWrapSampler, In.UV, 0).a;
            }
            worldNormal.xyz *= outlineMask;
        }
        if(gUseLightDirThin == 1){
            float LN = max(gLightDirThinDegree, dot(In.Normal, gLight0Dir));
            worldNormal *= LN;
        }
        if(gUseDistanceWidth == 1){
            float depth = distance(mul(In.Position, gW).xyz, gVI[3].xyz);
            worldNormal *= depth * (gDistanceWidthDegree * 0.005f);
        }
        worldPosition.xyz += worldNormal.xyz;
    }    
    Out.HPos = mul(worldPosition, gVP);
    Out.Normal = mul(In.Normal, gWIT);
    Out.Tangent = normalize(mul(In.Tangent, gWIT));
    Out.Binormal = cross(In.Normal, In.Tangent).xyz * In.Tangent.w;
    Out.Binormal = normalize(mul(float4(Out.Binormal, 0.0f), gWIT));
    Out.UV = float2(In.UV.x, (1.0f - In.UV.y));
    return Out;
}

float3 CalcShade(float4 Normal, float4 Tangent, float3 Binormal, float4 posInLVP, float2 UV, bool mode){
    float3 OutColor;
    float3 lightDir = normalize(gLight0Dir);
    float3 baseColor;
    float3 shadowColor;
    float gamma = 1.0f;
    if(gUseGamma == true){
        gamma = 2.2;
    }
    float3 normal;
    if(mode == true && gUseNormalMap == true){
        normal = gNormalMap.Sample(gWrapSampler, UV).xyz * 2.0f - 1.0f;
        normal.xy *= gNormalIntensity;
        normal = normal.x * Tangent + normal.y * Binormal + normal.z * Normal;
    }else{
        normal = Normal.xyz;
    }
    float N = dot(normal, -lightDir);
    N = smoothstep(gToonThreshold - gToonFeather, gToonThreshold + gToonFeather, N);
    if(gUseBaseColorTexture == true){
        baseColor = pow(gBaseColorTexture.Sample(gWrapSampler, UV).xyz, gamma);
    }else{
        baseColor = gBaseColor;
    }
    if(gUseShadowColorTexture == true){
        shadowColor = pow(gShadowColorTexture.Sample(gWrapSampler, UV).xyz, gamma);
    }else{
        shadowColor = gShadowColor;
    } 
    if(mode == true && gUseCastShadow == true){
        float2 shadowMapUV = posInLVP.xy / posInLVP.w;
        shadowMapUV *= float2(0.5f, -0.5f);
        shadowMapUV += float2(0.5f, 0.5f);
        float zInLVP = posInLVP.z / posInLVP.w;
        if(gShadowMethod == 0){
            if(shadowMapUV.x > 0.0f && shadowMapUV.x < 1.0f && shadowMapUV.y > 0.0f && shadowMapUV.y < 1.0f){
                float zInShadowMap = gLight0ShadowMap.Sample(gWrapSampler, shadowMapUV).r;
                if(zInLVP > zInShadowMap){
                    N *= gShadowIntensity;
                }
            }
        }else if(gShadowMethod == 1){
            float shadow = gLight0ShadowMap.SampleCmpLevelZero(gCompSampler, shadowMapUV, zInLVP);
            shadow = 1.0f - (shadow * (1.0f - gShadowIntensity));
            N *= shadow;
        }
    }
    OutColor = lerp(shadowColor, baseColor, N);
    return OutColor;
}

float4 PS(VS_TO_PS In) : SV_Target{
    float3 color = CalcShade(In.Normal, In.Tangent, In.Binormal, In.posInLVP, In.UV, true);
    float gamma = 1.0f;
    if(gUseGamma == true){
        gamma = 2.2f;
    }
    float3 normal;
    if(gUseNormalMap == true){
        normal = gNormalMap.Sample(gWrapSampler, In.UV).xyz * 2.0f - 1.0f;
        normal.xy *= gNormalIntensity;
        normal = normal.x * In.Tangent + normal.y * In.Binormal + normal.z * In.Normal;
    }else{
        normal = In.Normal.xyz;
    }
    float3 rimColor;
    if(gUseRim == true){
        if(gUseRimColorTexture == true){
            rimColor = pow(gRimColorTexture.Sample(gWrapSampler, In.UV).xyz, gamma);
        }else if(gUseRimColorTexture == false){
            rimColor = gRimColor;
        }
        float vdn = clamp(0.0f, 1.0f, dot(In.View, normal.xyz) + 1.0f);
        float rimArea = 1.0f - gRimArea;
        vdn = smoothstep(rimArea - gRimFeather, rimArea + gRimFeather, vdn);
        if(gUseRimColorTexture == true){
            rimColor = pow(gRimColorTexture.Sample(gWrapSampler, In.UV).xyz, gamma);
        }else if(gUseRimColorTexture == false){
            rimColor = gRimColor;
        }
        if(gRimBlendMode == 0){
            rimColor = 1.0f - (1.0f - color) * (1.0f - rimColor);
        }else if(gRimBlendMode == 1){
            rimColor += color;
        }else if(gRimBlendMode == 2){
            rimColor = clamp(0.0f, 0.99f, rimColor);
            rimColor = color / (1.0f - rimColor);
        }
        if(gLightDirMask == true){
            float LN =  max(gLightDirMaskDegree, dot(normal, gLight0Dir));
            vdn *= LN;
        }
        color = lerp(color, rimColor, vdn * gRimLevel);
    }
    return float4(color, 1.0);
}

float4 PS_OUTLINE(VS_TO_PS In) : SV_Target{
    float3 color = float3(1.0f, 1.0f, 1.0f);
    float gamma = 1.0f;
    if(gUseGamma == true){
        gamma = 2.2f;
    }
    if(gUseColorTresses == true){
        float3 tressColor = CalcShade(In.Normal, In.Tangent, In.Binormal, In.posInLVP, In.UV, false);
        color = tressColor * gOutlineColor;
    }else{
        if(gUseOutlineColorTexture == true){
            color = pow(gOutlineColorTexture.Sample(gWrapSampler, In.UV).xyz, gamma);
        }else if(gUseOutlineColorTexture == false){
            color = gOutlineColor;
        }
    }
    return float4(color, 1.0f);
}

RasterizerState CullFront{
    CullMode = Front;
};

RasterizerState CullBack{
    CullMode = Back;
};

technique11 Toon_Outline_Opaque{
        pass P0{
            SetRasterizerState(CullFront);
            SetVertexShader(CompileShader(vs_5_0, VS()));
            SetPixelShader(CompileShader(ps_5_0, PS()));
        }
        pass P1{
            SetRasterizerState(CullBack);
            SetVertexShader(CompileShader(vs_5_0, VS_OUTLINE()));
            SetPixelShader(CompileShader(ps_5_0, PS_OUTLINE()));
        }
}