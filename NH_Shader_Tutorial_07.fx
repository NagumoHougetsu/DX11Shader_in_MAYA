float4x4 gWVP   :   WorldViewProjection;
float4x4 gWIT   :   WorldInverseTranspose;
float4x4 gW     :   World;
float4x4 gVP    :   ViewProjection;

float3 gLight0Dir   :   DIRECTION <
    string Object = "Light 0";
    int UIOrder = 0;
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
> = {1.0, 1.0, 1.0};

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
> = {0.0, 0.0, 0.0};

uniform float gToonThreshold <
    string UIGroup = "Shading";
    int UIOrder = 106;
    string UIName = "Toon Threshold";
    float UIMin = -1.0;
    float UIMax = 1.0;
> = 0.0;

uniform float gToonFeather <
    string UIGroup = "Shading";
    int UIOrder = 107;
    string UIName = "Toon Feather";
    float UIMin = 0.0;
    float UIMax = 1.0;
> = 0.0;

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
> = {0.0, 0.0, 0.0};

uniform float gOutlineWidth <
    string UIGroup = "Outline";
    int UIOrder = 204;
    string UIName = "Outline Width";
    float UIMin = 0.0;
    float UIMax = 1.0;
> = 1.0;

uniform bool gUseColorTresses <
    string UIGroup = "Outline";
    int UIOrder = 205;
    string UIName = "Use ColorTresses";
> = false;

uniform bool gUseOutlineMask <
    string UIGroup = "Outline";
    int UIOrder = 206;
    string UIName = "Use Outline Mask";
> = false;

uniform int gOutlineMaskSource <
    string UIGroup = "Outline";
    int UIOrder = 207;
    string UIName = "Outline Mask Source";
    string UIFieldNames = "Mask Texture:Color Alpha";
    float UIMin = 0;
    float UIMax = 1;
    float UIStep = 1;
> = 0;

uniform Texture2D gOutlineMaskTexture <
    string UIGroup = "Outline";
    int UIOrder = 208;
    string UIName = "Outline Mask Texture";
    string UIWidget = "FilePicker";
    string ResourceType = "2D";
>;

uniform bool gUseGamma <
    string UIGroup = "Color Space";
    int UIOrder = 300;
    string UIName = "Gamma 2.2";
> = true;

uniform SamplerState gWrapSampler{
    Filter = MIN_MAG_MIP_LINEAR;
    AddressU = WRAP;
    AddressV = WRAP;
};

struct VS_INPUT{
    float4 Position :   POSITION;
    float4 Normal   :   NORMAL;
    float2 UV       :   TEXCOORD0;
};

struct VS_INPUT_OUTLINE{
    float4 Position :   POSITION;
    float4 Normal   :   NORMAL;
    float2 UV       :   TEXCOORD0;
};

struct VS_TO_PS{
    float4 HPos     :   SV_Position;
    float4 Normal   :   NORMAL;
    float2 UV       :   TEXCOORD0;
};

VS_TO_PS VS(VS_INPUT In){
    VS_TO_PS Out;
    Out.HPos = mul(In.Position, gWVP);
    Out.Normal = mul(In.Normal, gWIT);
    Out.UV = float2(In.UV.x, (1.0 - In.UV.y));
    return Out;
}

VS_TO_PS VS_OUTLINE(VS_INPUT In){
    VS_TO_PS Out;
    float4 worldPosition = mul(In.Position, gW);
    float4 worldNormal = mul(In.Normal, gWIT);
    if(gUseOutline == true){
        worldNormal.xyz *= gOutlineWidth;
        if(gUseOutlineMask == true){
            float outlineMask;
            if(gOutlineMaskSource == 0){
                outlineMask = gOutlineMaskTexture.SampleLevel(gWrapSampler, In.UV, 0).r;
            }else if(gOutlineMaskSource == 1){
                outlineMask = gOutlineColorTexture.SampleLevel(gWrapSampler, In.UV, 0).a;
            }
            worldNormal.xyz *= outlineMask;
        }
        worldPosition.xyz += worldNormal.xyz;
        
    }    
    Out.HPos = mul(worldPosition, gVP);
    Out.Normal = mul(In.Normal, gWIT);
    Out.UV = float2(In.UV.x, (1.0 - In.UV.y));
    return Out;
}

float3 CulcShade(VS_TO_PS In){
    float3 OutColor;
    float3 lightDir = normalize(gLight0Dir);
    float3 baseColor;
    float3 shadowColor;
    float gamma = 1.0;
    if(gUseGamma == true){
        gamma = 2.2;
    }
    float N = dot(In.Normal.xyz, -lightDir);
    N = smoothstep(gToonThreshold - gToonFeather, gToonThreshold + gToonFeather, N);
    if(gUseBaseColorTexture == true){
        baseColor = pow(gBaseColorTexture.Sample(gWrapSampler, In.UV).xyz, gamma);
    }else{
        baseColor = gBaseColor;
    }
    if(gUseShadowColorTexture == true){
        shadowColor = pow(gShadowColorTexture.Sample(gWrapSampler, In.UV).xyz, gamma);
    }else{
        shadowColor = gShadowColor;
    }
    OutColor = lerp(shadowColor, baseColor, N);
    return OutColor;
}

float4 PS(VS_TO_PS In) : SV_Target{
    float3 color = CulcShade(In);
    return float4(color, 1.0);
}

float4 PS_OUTLINE(VS_TO_PS In) : SV_Target{
    float3 color = float3(1.0, 1.0, 1.0);
    float gamma = 1.0;
    if(gUseGamma == true){
        gamma = 2.2;
    }
    if(gUseColorTresses == true){
        float3 tressColor = CulcShade(In);
        color = tressColor * gOutlineColor;
    }else{
        if(gUseOutlineColorTexture == true){
            color = pow(gOutlineColorTexture.Sample(gWrapSampler, In.UV).xyz, gamma);
        }else if(gUseOutlineColorTexture == false){
            color = gOutlineColor;
        }
    }
    return float4(color, 1.0);
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