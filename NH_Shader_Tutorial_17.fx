//変換行列のグローバル宣言
float4x4 gWVP   :   WorldViewProjection;
float4x4 gWIT   :   WorldInverseTranspose;
float4x4 gWVIT  :   WorldViewInverseTranspose;
float4x4 gW     :   World;
float4x4 gVI    :   ViewInverse;
float4x4 gVP    :   ViewProjection;

//バインドされた平行光源の情報
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

float gLight0ShadowMapBias  :   ShadowMapBias <
    string Object = "Light 0";
    int UIOrder = 3;
>;

float4x4 gMatLight  :   shadowMapMatrix <
    string Object = "Light 0";
    int UIOrder = 4;
>;

//トゥーンシェーディング関連
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

//アウトライン関連
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

uniform bool gUseColorAsNormal <
    string UIGroup = "Outline";
    int UIOrder = 213;
    string UIName = "Use Color as Normal";
> = false;

//リムライト関連
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

//ノーマルマップ関連
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

//セルフシャドウ関連
uniform bool gUseCastShadow <
    string UIGroup = "CastShadow";
    int UIOrder = 500;
    string UIName = "Use Cast Shadow";
> = false;

uniform int gShadowMethod <
    string UIGroup = "CastShadow";
    int UIOrder = 501;
    string UIName = "Shadow Method";
    string UIFieldNames = "DepthMap Hard:PCF Soft:VSM Soft";
    int UIMin = 0;
    int UIMax = 2;
> = 0;

uniform float gShadowIntensity <
    string UIGroup = "CastShadow";
    int UIOrder = 502;
    string UIName = "Shadow Intensity";
    float UIMin = 0.0f;
    float UIMax = 1.0f;
> = 0.5f;

uniform int gShadowMapRes <
    string UIGroup = "CastShadow";
    int UIOrder = 503;
    string UIName = "Shadow Map Size";
    string UIFieldNames = "128px:256px:512px:1024px:2048px:4096px:8192px";
    int UIMin = 0;
    int UIMax = 6;
> = 2;

uniform int gKernelSize <
    string UIGroup = "CastShadow";
    int UIOrder = 504;
    string UIName = "Kernel Size";
    int UIMin = 3;
    int UIMax = 35;
> = 5.0f;

uniform float gSigma <
    string UIGroup = "CastShadow";
    int UIOrder = 505;
    string UIName = "Blur SD";
    float UIMin = 0.1f;
    float UIMax = 10.0f;
> = 5.0f;

uniform int gSamplingPoints <
    string UIGroup = "CastShadow";
    int UIOrder = 503;
    string UIName = "Sampling Points";
    string UIFieldNames = "4:8";
    int UIMin = 0;
    int UIMax = 1;
> = 1;

//ハイライト関連
uniform bool gUseHilight <
    string UIGroup = "Hilight";
    int UIOrder = 600;
    string UIName = "Use Hilight";
> = false;

uniform bool gUseHilightTexture <
    string UIGroup = "Hilight";
    int UIOrder = 601;
    string UIName = "Use Hilight Texture";
> = false;

uniform int gHilightBlendMode <
    string UIGroup = "Hilight";
    int UIOrder = 602;
    string UIName = "Hilight Blend Mode";
    string UIFieldNames = "Screen:Add:Dodge color";
    int UIMin = 0;
    int UIMax = 2;
> = 0;

uniform float3 gHilightColor <
    string UIGroup = "Hilight";
    int UIOrder = 603;
    string UIName = "Hilight Color";
    string UIWidget = "ColorPicker";
> = {1.0f, 1.0f, 1.0f};

uniform Texture2D gHilightTexture <
    string UIGroup = "Hilight";
    int UIOrder = 604;
    string UIName = "Hilight Texture";
    string UIWidget = "FilePicker";
    string ResourceType = "2D";
>;

uniform float gHilightIntensity <
    string UIGroup = "Hilight";
    int UIOrder = 605;
    string UIName = "Hilight Intensity";
    float UIMin = 0.0f;
    float UIMax = 1.0f;
> = 1.0f;

uniform bool gUseLightDirHilightMask <
    string UIGroup = "Hilight";
    int UIOrder = 606;
    string UIName = "Use LightDir Mask";
> = false;

uniform float gLightDirHilightMaskDegree <
    string UIGroup = "Hilight";
    int UIOrder = 607;
    string UIName = "LightDir Mask Degree";
    float UIMin = 0.0f;
    float UIMax = 1.0f;
> = 0.0f;

//マットキャップ関連
uniform bool gUseMatcap <
    string UIGroup = "Matcap";
    int UIOrder = 700;
    string UIName = "Use Matcap";
> = false;

uniform bool gUseMatcapMask <
    string UIGroup = "Matcap";
    int UIOrder = 701;
    string UIName = "Use Matcap Mask";
> = false;

uniform Texture2D gMatcapMaskTexture <
    string UIGroup = "Matcap";
    int UIOrder = 702;
    string UIName = "Matcap Mask Texture";
    string UIWidget = "FilePicker";
    string ResourceType = "2D";
>;

uniform float gMatCapBlend <
    string UIGroup = "Matcap";
    int UIOrder = 703;
    string UIName = "Matcap Blend";
    float UIMin = 0.0f;
    float UIMax = 1.0f;
> = 1.0f;

uniform Texture2D gSphereMap <
    string UIGroup = "Matcap";
    int UIOrder = 703;
    string UIName = "Sphere Map";
    string UIWidget = "FilePicker";
    string ResourceType = "2D";
>;

//頬の光沢反転関連
uniform bool gUseCheekNormalFlip <
    string UIGroup = "Cheek Shading";
    int UIOrder = 800;
    string UIName = "Use Cheek Shading";
> = false;

uniform Texture2D gCheekMask <
    string UIGroup = "Cheek Shading";
    int UIOrder = 801;
    string UIName = "Cheek Mask";
    string UIWidget = "FilePicker";
    string ResourceType = "2D";
>;

uniform float gCheekBlend <
    string UIGroup = "Cheek Shading";
    int UIOrder = 802;
    string UIName = "Cheek Blend";
    float UIMin = 0.0f;
    float UIMax = 1.0f;
> = 1.0f;

uniform float3 gCheekTwistAxis <
    string UIGroup = "Cheek Shading";
    int UIOrder = 803;
    string UIName = "Twist Axis";
    float UIMin = -1.0f;
    float UIMax = 1.0f;
> = {-1.0f, 1.0f, 1.0f};

//疑似ノーマルマップ関連
uniform bool gUseshadowShading <
    string UIGroup = "Shadow Shading";
    int UIOrder = 900;
    string UIName = "Use Shadow Shading";
> = false;

uniform bool gUseColorNormal <
    string UIGroup = "Shadow Shading";
    int UIOrder = 901;
    string UIName = "Use Vertex Color Normal";
> = false;

uniform Texture2D gShadowShadingMask <
    string UIGroup = "Shadow Shading";
    int UIOrder = 902;
    string UIName = "Shadow Shading Mask";
    string UIWidget = "FilePicker";
    string ResourceType = "2D";
>;

uniform float gShadowShadingBlend <
    string UIGroup = "Shadow Shading";
    int UIOrder = 903;
    string UIName = "Shading Blend";
    float UIMin = 0.0f;
    float UIMax = 1.0f;
> = 1.0f;

uniform float3 gShadowShadingTwistAxis <
    string UIGroup = "Shadow Shading";
    int UIOrder = 904;
    string UIName = "Shading Twist Axis";
    float UIMin = -1.0f;
    float UIMax = 1.0f;
> = {0.0f, -0.5f, 0.0f};

//カメラベースのでフォーム関連
uniform bool gUseDeform <
    string UIGroup = "Deform";
    int UIOrder = 1000;
    string UIName = "Use Deform";
> = false;

uniform bool gUseDeformMask <
    string UIGroup = "Deform";
    int UIOrder = 1001;
    string UIName = "Use Deform Mask";
> = false;

uniform Texture2D gDeformMask <
    string UIGroup = "Deform";
    int UIOrder = 1002;
    string UIName = "Deform Mask";
    string UIWidget = "FilePicker";
    string ResourceType = "2D";
>;

uniform float gDeformRange <
    string UIGroup = "Deform";
    int UIOrder = 1003;
    string UIName = "Deform Range";
    float UIMin = 0.0f;
    float UIMax = 1.0f;
> = 0.5f;

uniform float gDeformIntensity <
    string UIGroup = "Deform";
    int UIOrder = 1004;
    string UIName = "Deform Intensity";
    float UIMin = 0.0f;
    float UIMax = 1.0f;
> = 1.0f;

//ガンマ補正関連
uniform bool gUseGamma <
    string UIGroup = "Color Space";
    int UIOrder = 1100;
    string UIName = "Gamma 2.2";
> = true;

//サンプラーステート定義
uniform SamplerState gWrapSampler{
    Filter = MIN_MAG_MIP_LINEAR;
    AddressU = WRAP;
    AddressV = WRAP;
};

//サンプラー比較関数定義
uniform SamplerComparisonState gCompSampler{
    Filter = COMPARISON_MIN_MAG_MIP_LINEAR;
    ComparisonFunc = LESS;
    MaxAnisotropy = 1;
};

//入力用構造体
struct VS_INPUT{
    float4 Position :   POSITION;
    float4 Normal   :   NORMAL;
    float4 Tangent  :   TANGENT;
    float2 UV       :   TEXCOORD0;
    float4 Color    :   COLOR1;
};

//出力用構造体
struct VS_TO_PS{
    float4 HPos     :   SV_Position;
    float4 Normal   :   NORMAL;
    float4 Tangent  :   TANGENT;
    float3 Binormal :   BINORMAL;
    float2 UV       :   TEXCOORD0;
    float3 View     :   TEXCOORD1;
    float4 posInLVP :   TEXCOORD2;
    float4 Color    :   COLOR1;
};

//頂点シェーダー（メイン）
VS_TO_PS VS(VS_INPUT In){
    VS_TO_PS Out;
    Out.HPos = mul(In.Position, gWVP);
    Out.Normal = mul(In.Normal, gWIT);
    Out.Tangent = normalize(mul(In.Tangent, gWIT));
    Out.Binormal = cross(In.Normal, In.Tangent).xyz * In.Tangent.w;
    Out.Binormal = normalize(mul(float4(Out.Binormal, 0.0f), gWIT));
    Out.UV = float2(In.UV.x, (1.0f - In.UV.y));
    Out.View = normalize(mul(In.Position, gW).xyz - gVI[3].xyz);
    Out.posInLVP = mul(mul(In.Position, gW), gMatLight);
    //Out.posInLVP.z = distance(mul(In.Position, gW), gLight0Pos)/1000;
    Out.Color = In.Color;
    if(gUseDeform == true){
        float deformMask = 1.0f;
        if(gUseDeformMask == true){
            deformMask = gDeformMask.SampleLevel(gWrapSampler, Out.UV, 0);
        }
        float N = dot(Out.View, Out.Normal) * 0.5f + 0.5f;
        N = smoothstep(gDeformRange, 1.0f, N);
        N *= gDeformIntensity * deformMask;
        float4 mPos = mul(In.Position, gW);
        mPos.xyz += N * Out.Normal.xyz;
        Out.HPos = mul(mPos, gVP);
    }    
    return Out;
}

//頂点シェーダー（アウトライン用）
VS_TO_PS VS_OUTLINE(VS_INPUT In){
    VS_TO_PS Out;
    float4 worldPosition = mul(In.Position, gW);
    float4 worldNormal;
    if(gUseColorAsNormal == true){
        worldNormal = mul(In.Color * 2.0f - 1.0f, gWIT);
    }else{
        worldNormal = mul(In.Normal, gWIT);
    }
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

float CalcDepth(float2 UV, Texture2D map){
    float depth;
    float4 depthMap = map.Sample(gWrapSampler, UV);
    float bias = gLight0ShadowMapBias;
    float rMask = 1.0f;
    float gMask = 1.0f / 255.0f;
    float bMask = 1.0f / (255.0f * 255.0f);
    float aMask = 1.0f / (255.0f * 255.0f * 255.0f);
    depth = dot(depthMap, float4(rMask, gMask, bMask, aMask));
    return depth;
}

//ガウスフィルター関数
float2 CalcGaus(float2 UV){
    //仮想のシャドウマップの解像度
    float size;
    if(gShadowMapRes == 0){
        size = 128.0f;
    }else if(gShadowMapRes == 1){
        size = 256.0f;
    }else if(gShadowMapRes == 2){
        size = 512.0f;
    }else if(gShadowMapRes == 3){
        size = 1024.0f;
    }else if(gShadowMapRes == 4){
        size = 2048.0f;
    }else if(gShadowMapRes == 5){
        size = 4096.0f;
    }else if(gShadowMapRes == 6){
        size = 8192.0f;
    }
    //ウェイトの計算
    float weight[35];
    int distance = gKernelSize / 2;
    float weightSum = 0.0f;
    for(int i = 0; i < gKernelSize ; i++){
        float delta =  i - distance;
        weight[i] = (1.0f / sqrt((2.0 * acos(-1) * gSigma * gSigma))) * exp(-1.0f * (delta * delta ) / (2.0f * gSigma * gSigma));
        weightSum += weight[i];
    }
    for(int i = 0; i < gKernelSize; i++){
        weight[i] /= weightSum;
    }
    float texelSize = 1.0 / size;
    float2 offset_01 = float2(-1.0 * texelSize * sin(radians(90))   ,   0.0                                 );
    float2 offset_02 = float2(-1.0 * texelSize * sin(radians(45))   ,   -1.0 * texelSize * sin(radians(45)) );
    float2 offset_03 = float2(0.0f                                  ,   -1.0 * texelSize * sin(radians(90)) );
    float2 offset_04 = float2(texelSize * sin(radians(45))          ,   -1.0 * texelSize * sin(radians(45)) );
    float2 coord_01 = UV + distance * offset_01;
    float2 coord_02 = UV + distance * offset_02;
    float2 coord_03 = UV + distance * offset_03;
    float2 coord_04 = UV + distance * offset_04;
    float2 output = float2(0.0f, 0.0f);
    if(gSamplingPoints == 0){
        for(int i = 0; i < gKernelSize; i++){
            output.x += gLight0ShadowMap.Sample(gWrapSampler, coord_01).r * weight[i] * 0.5;
            coord_01 -= offset_01;
            output.x += gLight0ShadowMap.Sample(gWrapSampler, coord_03).r * weight[i] * 0.5;
            coord_03 -= offset_03;
        }
    }else if(gSamplingPoints == 1){
        for(int i = 0; i < gKernelSize; i++){
            output.x += gLight0ShadowMap.Sample(gWrapSampler, coord_01).r * weight[i] * 0.25;
            coord_01 -= offset_01;
            output.x += gLight0ShadowMap.Sample(gWrapSampler, coord_02).r * weight[i] * 0.25;
            coord_02 -= offset_02;
            output.x += gLight0ShadowMap.Sample(gWrapSampler, coord_03).r * weight[i] * 0.25;
            coord_03 -= offset_03;
            output.x += gLight0ShadowMap.Sample(gWrapSampler, coord_04).r * weight[i] * 0.25;
            coord_04 -= offset_04;
        }
    }
    output.y = gLight0ShadowMap.Sample(gWrapSampler, UV).r;
    output.y *= output.y;
    return output;    
}

//ピクセルシェーダー（メイン）
float4 PS(VS_TO_PS In) : SV_Target{
    //ガンマ補正値の設定
    float gamma = 1.0f;
    if(gUseGamma == true){
        gamma = 2.2f;
    }
    //ノーマルマップの読み込み
    float3 normal;
    if(gUseNormalMap == true){
        normal = gNormalMap.Sample(gWrapSampler, In.UV).xyz * 2.0f - 1.0f;
        normal.xy *= gNormalIntensity;
        normal = normal.x * In.Tangent + normal.y * In.Binormal + normal.z * In.Normal;
    }else{
        normal = In.Normal.xyz;
    }
    //ライトと法線の内積からトゥーンシェーディングの計算
    float3 lightDir = normalize(gLight0Dir);
    float N;
    //頬の法線調整部分
    if(gUseCheekNormalFlip == true){
        float3 cheekNormal;
        cheekNormal.x = normal.x * gCheekTwistAxis.x;
        cheekNormal.y = normal.y * gCheekTwistAxis.y;
        cheekNormal.z = normal.z * gCheekTwistAxis.z;
        float cheekMask = gCheekMask.Sample(gWrapSampler, In.UV).r;
        cheekNormal = lerp(normal, cheekNormal, cheekMask);
        float defD = dot(normal, -lightDir);
        float fixD = dot(cheekNormal, -lightDir);
        N = max(fixD * gCheekBlend, defD);
    }else{
        N = dot(normal, -lightDir);
    }
    //疑似シャドウ調整部分
    if(gUseshadowShading == true){
        float shadowMask = gShadowShadingMask.Sample(gWrapSampler, In.UV).r;
        float3 twistNormal;
        if(gUseColorNormal == true){
            twistNormal = mul(In.Color * 2.0f - 1.0f, gWIT);
            twistNormal.x += gShadowShadingTwistAxis.x;
            twistNormal.y += gShadowShadingTwistAxis.y;
            twistNormal.z += gShadowShadingTwistAxis.z;
            twistNormal = normalize(twistNormal);
        }else{
            twistNormal.x = normal.x + gShadowShadingTwistAxis.x;
            twistNormal.y = normal.y + gShadowShadingTwistAxis.y;
            twistNormal.z = normal.z + gShadowShadingTwistAxis.z;
            twistNormal = normalize(twistNormal);
        }
        float shadowDot = clamp(dot(twistNormal, -lightDir), 0.0f, 1.0f);
        N = lerp(N, shadowDot, (1.0-shadowMask) * gShadowShadingBlend);
    }
    //シェーディング部分の範囲とぼかし具合計算
    N = smoothstep(gToonThreshold - gToonFeather, gToonThreshold + gToonFeather, N);
    //セルフシャドウの計算
    if(gUseCastShadow == true){
        float2 shadowMapUV = In.posInLVP.xy / In.posInLVP.w;
        shadowMapUV *= float2(0.5f, -0.5f);
        shadowMapUV += float2(0.5f, 0.5f);
        float zInLVP = In.posInLVP.z / In.posInLVP.w;
        if(gShadowMethod == 0){
            if(shadowMapUV.x > 0.0f && shadowMapUV.x < 1.0f && shadowMapUV.y > 0.0f && shadowMapUV.y < 1.0f){
                float zInShadowMap = gLight0ShadowMap.Sample(gWrapSampler, shadowMapUV).r;
                if(zInLVP > zInShadowMap){
                    float shade = 1.0 - gShadowIntensity;
                    N *= shade;
                }
            }
        }else if(gShadowMethod == 1){
            if(shadowMapUV.x > 0.0f && shadowMapUV.x < 1.0f && shadowMapUV.y > 0.0f && shadowMapUV.y < 1.0f){
                float shadow = gLight0ShadowMap.SampleCmpLevelZero(gCompSampler, shadowMapUV, zInLVP);
                float shade = 1.0 - (1.0f - shadow) * gShadowIntensity;
                N *= shade;
            }
        }else if(gShadowMethod == 2){
            if(shadowMapUV.x > 0.0f && shadowMapUV.x < 1.0f && shadowMapUV.y > 0.0f && shadowMapUV.y < 1.0f){
                float2 shadowValue = CalcGaus(shadowMapUV);
                if(zInLVP > shadowValue.x){
                    float variance = clamp(shadowValue.y * shadowValue.y - shadowValue.x * shadowValue.x, 0.0001f, 1.0f);
                    float md = zInLVP - shadowValue.x; 
                    float lightFactor = variance / (variance + md * md);
                    float shade = 1.0f - (1.0f - lightFactor) * gShadowIntensity;
                    N *= shade;
                }
            }
        }
    }
    //基本色と影色の指定
    float3 baseColor;
    float3 shadowColor;
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
    //トゥーンシェーディングの最終計算
    float3 color = lerp(shadowColor, baseColor, N);

    //マットキャップ部分
    if(gUseMatcap == true){
        float4 matOut;
        float4 vNormal = mul(In.Normal, gWVIT);
        float2 sphereEnvUV = vNormal.xy * 0.5f + 0.5f;
        sphereEnvUV.y = 1.0f - sphereEnvUV.y;
        matOut = pow(gSphereMap.Sample(gWrapSampler, sphereEnvUV), gamma);
        float blend;
        if(gUseMatcapMask == true){
            blend = gMatcapMaskTexture.Sample(gWrapSampler, In.UV).r * gMatCapBlend;
        }else{
            blend = gMatCapBlend;
        }
        color = lerp(color, matOut, blend);
    }
    //ハイライトの計算
    if(gUseHilight == true){
        float3 hiColor;
        //ハイライトテクスチャ使用分岐
        if(gUseHilightTexture == true){
            hiColor = pow(gHilightTexture.Sample(gWrapSampler, In.UV), gamma).rgb;
            hiColor *= gHilightColor;
        }else{
            hiColor = gHilightColor;
        }
        //ハイライト合成モード分岐
        if(gHilightBlendMode == 0){
            hiColor = 1.0f - (1.0f - color) * (1.0f - hiColor * gHilightIntensity);
        }else if(gHilightBlendMode == 1){
            hiColor = color + (hiColor * gHilightIntensity);
        }else if(gHilightBlendMode == 2){
            hiColor *= gHilightIntensity;
            hiColor = color / clamp(1.0f - hiColor, 0.0001f, 1.0f);
        }
        //ハイライトのライト方向処理分岐
        if(gUseLightDirHilightMask == true){
            float LN = clamp(N, gLightDirHilightMaskDegree, 1.0f);
            color = lerp(color, hiColor, LN);
        }else{
            color = hiColor;
        }
    }
    //リムカラーの計算
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
    //最終出力
    return float4(color, 1.0);
}

//ピクセルシェーダー（アウトライン用）
float4 PS_OUTLINE(VS_TO_PS In) : SV_Target{
    float3 color = float3(1.0f, 1.0f, 1.0f);
    //ガンマ補正値の設定
    float gamma = 1.0f;
    if(gUseGamma == true){
        gamma = 2.2f;
    }
    //色トレスの計算時の計算（カラーピッカーで色調整）
    if(gUseColorTresses == true){
        //ライトと法線の内積からトゥーンシェーディングの計算
        float3 lightDir = normalize(gLight0Dir);
        float N = dot(In.Normal, -lightDir);
        N = smoothstep(gToonThreshold - gToonFeather, gToonThreshold + gToonFeather, N);
        //基本色と影色の指定
        float3 baseColor;
        float3 shadowColor;
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
        //トゥーンシェーディングの最終計算
        color = lerp(shadowColor, baseColor, N);
        //カラーピッカーと色トレス機能の統合
        color *= gOutlineColor;
    }else{
        //アウトラインテクスチャ使用時の計算
        if(gUseOutlineColorTexture == true){
            color = pow(gOutlineColorTexture.Sample(gWrapSampler, In.UV).xyz, gamma);
        //カラーピッカー使用時の計算
        }else if(gUseOutlineColorTexture == false){
            color = gOutlineColor;
        }
    }
    return float4(color, 1.0f);
}

RasterizerState CullFront{
    FillMode = Solid;
    CullMode = Front;
};

RasterizerState CullBack{
    FillMode = Solid;
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