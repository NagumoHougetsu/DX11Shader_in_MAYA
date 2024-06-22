/*=================================================================*/
/*                        変数宣言　                                */
/*=================================================================*/
float4x4 gWVP   : WorldViewProjection;
float4x4 gWIT   : WorldInverseTranspose;
float4x4 gW     : World;
float4x4 gVP    : ViewProjection;
float4x4 gVI    : ViewInverse;
float4x4 gP     : Projection;

/*=================================================================*/
/*                        プロパティ                                */
/*=================================================================*/
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
/*          ライト取得                */
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/   
//ライト方向
float3 gLight0Dir : DIRECTION <
    string Object = "Light 0";
    int UIOrder = 0;
>;
//ライト座標
float3 gLight0Pos : POSITION <
    string Object = "Light 0";
>;
//シャドウマップ
Texture2D gLight0ShadowTex : ShadowMap <
    string Object = "Light 0";
>;
//ライトビュー返還行列
float4x4 gMatLight : ShadowMapMatrix <
    string Object = "Light 0";
>;
float3 gVPos  : ViewPosition <
    string Object = "View Position0";
    int UIOrder = 1;
>;

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
/*          カラーテクスチャ          */
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/   
uniform bool gUseBaseColorTexture <
    string UIGroup = "Color Texture";
    int UIOrder = 1;
    string UIName = "Use Base Color Texture";
> = false;

uniform Texture2D gBaseColorTexture <
    string UIGroup = "Color Texture";
    int UIOrder = 2;
    string UIName = "Base Color Texture";
    string UIWidget = "FilePicker";
    string ResourceType = "2D";
>;
uniform float3 gBaseColor <
    string UIGroup = "Color Texture";
    int UIOrder = 3;
    string UIName = "Base Color";
    string UIWidget = "ColorPicker";
> = {0.5f, 0.5f, 0.5f };

uniform bool gUseShadowColorTexture <
    string UIGroup = "Color Texture";
    int UIOrder = 4;
    string UIName = "Use Shadow Color Texture";
> = false;

uniform float3 gShadowColor <
    string UIGroup = "Color Texture";
    int UIOrder = 5;
    string UIName = "Shadow Color";
    string UIWidget = "ColorPicker";
> = {0.0f, 0.0f, 0.0f};

uniform Texture2D gShadowColorTexture <
    string UIGroup = "Color Texture";
    int UIOrder = 6;
    string UIName = "Shadow Color Texture";
    string UIWidget = "FilePicker";
    string ResourceType = "2D";
>;
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
/*          トゥーン調整              */
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/ 
uniform float gToonThreshold <
    string UIGroup = "Toon Shading";
    int UIOrder = 10;
    string UIName = "Toon Threshold";
    float UIMin = 0.0;
    float UIMax = 1.0;
> = 0.0;

uniform float gToonFeather <
    string UIGroup = "Toon Shading";
    int UIOrder = 11;
    string UIName = "Toon Feathre";
    float UIMin = 0.0;
    float UIMax = 1.0;
> = 0.0;

uniform bool gUseBoundaryTexture <
    string UIGroup = "Toon Shading";
    int UIOrder = 15;
    string UIName = "Use Boundary Texture";
> = false;

uniform Texture2D gBoundaryTexture <
    string UIGroup = "Toon Shading";
    int UIOrder = 16;
    string UIName = "Boundary Texture";
    string UIWidget = "FilePicker";
    string ResourceType = "2D";
>;

uniform float gBoundaryIntensity <
    string UIGroup = "Toon Shading";
    int UIOrder = 17;
    string UIName = "Boundary Intensity";
    float UIMin = 0.0;
    float UIMax = 1.0;
> = 1.0;

uniform bool gUseShadow <
    string UIGroup = "Toon Shading";
    int UIOrder = 18;
    string UIName = "Use Shadow";
> = false;

uniform float gShadowIntensity <
    string UIGroup = "Toon Shading";
    int UIOrder = 19;
    string UIName = "Shadow Intensity";
    float UIMin = 0.0;
    float UIMax = 1.0;
> = 1.0;

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
/*          法線調整                  */
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/  
uniform bool gUseNormalMap <
    string UIGroup = "Normal Map";
    int UIOrder = 21;
    string UIName = "Use Normal Map";
> = false;

uniform Texture2D gNormalMap <
    string UIGroup = "Normal Map";
    int UIOrder = 22;
    string UIName = "Normal Map";
    string UIWidget = "FilePicker";
    string ResourceType = "2D";
>;

uniform int gNormalMapAxisY <
    string UIGroup = "Normal Map";
    int UIOrder = 23;
    string UIName = "Y-Axis Direction";
    string UIFieldNames = "Y-Up(OpenGL):Y-Down(DirectX)";
> = 1;

uniform bool gUseHilightInShadowMask <
    string UIGroup = "Normal Map";
    int UIOrder = 24;
    string UIName = "Use Hilight in Shadow Mask";
> = false;

uniform Texture2D gHilightInShadowMask <
    string UIGroup = "Normal Map";
    int UIOrder = 25;
    string UIName = "Hilight in Shadow Mask";
    string UIWidget = "FilePicker";
    string ResourceType = "2D";
>;

uniform float gHilightInShadowMin <
    string UIGroup = "Normal Map";
    int UIOrder = 26;
    string UIName = "Hilight in Shadow Min";
    float UIMin = 0.0;
    float UIMax = 1.0;
> = 0.0;

uniform float gHilightInShadowMax <
    string UIGroup = "Normal Map";
    int UIOrder = 27;
    string UIName = "Hilight in Shadow Max";
    float UIMin = 0.0;
    float UIMax = 1.0;
> = 1.0;    

uniform float3 gHilightInShadowAxis <
    string UIGroup = "Normal Map";
    int UIOrder = 28;
    string UIName = "Hilight In Shadow Axis";
    float UIMin = -1.0;
    float UIMax = 1.0;
> = {-1.0f, 1.0f, 1.0f};

uniform bool gUseShadowInHilightMask <
    string UIGroup = "Normal Map";
    int UIOrder = 29;
    string UIName = "Use Shadow in Hilight Mask";
> = false;

uniform bool gUseVertexColorNormal <
    string UIGroup = "Normal Map";
    int UIOrder = 30;
    string UIName = "Use VertxColorNormal";
> = false;

uniform Texture2D gShadowInHilightMask <
    string UIGroup = "Normal Map";
    int UIOrder = 30;
    string UIName = "Shadow in ilight Mask";
    string UIWidget = "FilePicker";
    string ResourceType = "2D";
>;

uniform float gShadowInHilightMin <
    string UIGroup = "Normal Map";
    int UIOrder = 31;
    string UIName = "Shadow in Hilight Min";
    float UIMin = 0.0;
    float UIMax = 1.0;
> = 0.0;

uniform float gShadowInHilightMax <
    string UIGroup = "Normal Map";
    int UIOrder = 32;
    string UIName = "Shadow in Hilight Max";
    float UIMin = 0.0;
    float UIMax = 1.0;
> = 1.0;    

uniform float3 gShadowInHilightAxis <
    string UIGroup = "Normal Map";
    int UIOrder = 33;
    string UIName = "Shadow In Hilight Axis";
    float UIMin = -1.0;
    float UIMax = 1.0;
> = {0.0f, -0.5f, -0.5f};
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
/*          アウトライン              */
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/ 
uniform bool gUseOutline <
    string UIGroup = "Outline";
    int UIOrder = 40;
    string UIName = "Use Outline";
> = false;

uniform float3 gOutlineColor <
    string UIGroup = "Outline";
    int UIOrder = 41;
    string UIName = "Outline Color";
    string UIWidget = "ColorPicker";
> = {0.0f, 0.0f, 0.0f };

uniform float gOutlineWidth <
    string UIGroup = "Outline";
    int UIOrder = 42;
    string UIName = "Outline Width";
    float UIMin = 0.0;
    float UIMax = 1.0;
> = 0.1;

uniform bool gUseOutlineColorTexture <
    string UIGroup = "Outline";
    int UIOrder = 43;
    string UIName = "Use Outline Color Texture";
> = false;

uniform Texture2D gOutlineColorTexture <
    string UIGroup = "Outline";
    int UIOrder = 44;
    string UIName = "Outline Color Texture";
    string UIWidget = "FilePicker";
    string ResourceType = "2D";
>;

uniform bool gUseOutlineMaskTexture <
    string UIGroup = "Outline";
    int UIOrder = 45;
    string UIName = "Use Outline Mask Texture";
> = false;

uniform Texture2D gOutlineMaskTexture <
    string UIGroup = "Outline";
    int UIOrder = 46;
    string UIName = "Outline Mask Texture";
    string UIWidget = "FilePicker";
    string ResourceType = "2D";
>;

uniform bool gUseOutlineDistance <
    string UIGroup = "Outline";
    int UIOrder = 47;
    string UIName = "Use Outline Distance";
> = false;

uniform float gOutlineDistanceDegree <
    string UIGroup = "Outline";
    int UIOrder = 48;
    string UIName = "Outline Distance Degree";
    float UIMin = 10;
    float UIMax = 100.0;
> = 50.0;

uniform bool gUseOutlineColorMix <
    string UIGroup = "Outline";
    int UIOrder = 49;
    string UIName = "Use Outline Color Mix";
> = false;

uniform float gOutlineColorMixDegree <
    string UIGroup = "Outline";
    int UIOrder = 50;
    string UIName = "Outline Color Mix Degree";
    float UIMin = 0.0;
    float UIMax = 1.0;
> = 1.0;   

uniform bool gUseLightDirThinning <
    string UIGroup = "Outline";
    int UIOrder = 51;
    string UIName = "Use LightDir Thinning";
> = false;

uniform float gThinningDegree <
    string UIGroup = "Outline";
    int UIOrder = 52;
    string UIName = "Thinning Degree";
    float UIMin = 0.0;
    float UIMax = 1.0;
> = 1.0;
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
/*          リムライト                */
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/  
uniform bool gUseRimlight <
    string UIGroup = "Rimlight";
    int UIOrder = 70;
    string UIName = "Use Rimlight";
> = false;

uniform bool gUseRimlightColorTexture <
    string UIGroup = "Rimlight";
    int UIOrder = 71;
    string UIName = "Use Rimlight Color Texture";
> = false;

uniform Texture2D gRimlightColorTexture <
    string UIGroup = "Rimlight";
    int UIOrder = 72;
    string UIName = "Rimlight Color Texture";
    string UIWidget = "FilePicker";
    string ResourceType = "2D";
>;

uniform float3 gRimColor <
    string UIGroup = "Rimlight";
    int UIOrder = 73;
    string UIName = "Rim Color";
    string UIWidget = "ColorPicker";
> = {1.0f, 1.0f, 1.0f};

uniform float gRimExponent <
    string UIGroup = "Rimlight";
    int UIOrder = 74;
    string UIName = "Rim Exponent";
    float UIMin = 0.01;
    float UIMax = 10.0;
> = 5.0;

uniform float gRimlightMin <
    string UIGroup = "Rimlight";
    int UIOrder = 75;
    string UIName = "Rimlight Min";
    float UIMin = 0.0;
    float UIMax = 1.0;
> = 0.0;

uniform float gRimlightMax <
    string UIGroup = "Rimlight";
    int UIOrder = 76;
    string UIName = "Rimlight Max";
    float UIMin = 0.0;
    float UIMax = 1.0;
> = 1.0;    

uniform bool gUseRimlightMaskTexture <
    string UIGroup = "Rimlight";
    int UIOrder = 77;
    string UIName = "Use Rimlight Mask Texture";
> = false;

uniform Texture2D gRimlightMaskTexture <
    string UIGroup = "Rimlight";
    int UIOrder = 78;
    string UIName = "Rimlight Mask Texture";
    string UIWidget = "FilePicker";
    string ResourceType = "2D";
>;
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
/*          ハイライト                */
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/ 
uniform bool gUseHilightTexture <
    string UIGroup = "Hilight";
    int UIOrder = 90;
    string UIName = "Use Hilight Texture";
> = false;

uniform Texture2D gHilightTexture <
    string UIGroup = "Hilight";
    int UIOrder = 91;
    string UIName = "Hilight Texture";
    string UIWidget = "FilePicker";
    string ResourceType = "2D";
>;

uniform float gHilightIntensity<
    string UIGroup = "Hilight";
    int UIOrder = 92;
    string UIName = "Hilight Intensity";
    float UIMin = 0.0;
    float UIMax = 5.0;
> = 1.0;

/*=================================================================*/
/*                       サンプラーステート                         */
/*=================================================================*/
uniform SamplerState gWrapSampler{
    Filter = MIN_MAG_MIP_LINEAR;
    AddressU = WRAP;
    AddressV = WRAP;
};
uniform SamplerComparisonState gWrapSampler_shadow{
    Filter = COMPARISON_MIN_MAG_MIP_LINEAR;
    ComparisonFunc = GREATER;
    MaxAnisotropy = 1;
};

/*=================================================================*/
/*                        構造体                                   */
/*=================================================================*/
struct VS_INPUT{
    float3 Position : POSITION;
    float4 Normal   : NORMAL;
    float4 Tangent  : TANGENT;
    float2 UV       : TEXCOORD0;
    float4 Color    : COLOR0;
};

struct VS_OUTLINE_INPUT{
    float3 Position : POSITION;
    float4 Normal : NORMAL;
    float2 UV : TEXCOORD0;
};

struct VS_TO_PS{
    float4 HPos     : SV_Position;
    float4 Normal   : Normal;
    float4 Tangent  : TANGENT;
    float3 Binormal : BINORMAL;
    float2 UV       : TEXCOORD0;
    float3 View     : TEXCOORD1;
    float4 NormalDef: COLOR0;
    float4 posInLVP : TEXCOORD2;
};

/*=================================================================*/
/*                        頂点シェーダー                            */
/*=================================================================*/

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
/*頂点シェーダー（フラットカラー）      */
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
VS_TO_PS VS(VS_INPUT In){
    VS_TO_PS Out;
    Out.HPos = mul(float4(In.Position, 1),gWVP);
    Out.UV = float2(In.UV.x, 1.0 - In.UV.y);
    Out.Normal = mul(In.Normal, gWIT);
    Out.Tangent = normalize(mul(In.Tangent, gWIT));
    Out.Binormal = cross(In.Normal.xyz, In.Tangent.xyz) * In.Tangent.w;
    Out.Binormal = normalize(mul(float4(Out.Binormal,0.0), gWIT)).xyz;
    Out.View = normalize(gVI[3].xyz - mul(float4(In.Position, 1), gW).xyz);
    Out.NormalDef = mul(In.Color, gWIT);
    Out.posInLVP = mul(float4(In.Position, 1.0), gMatLight);
    return Out;
}
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
/*頂点シェーダー（アウトライン）        */
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
VS_TO_PS VS_Outline(VS_OUTLINE_INPUT In){
    VS_TO_PS Out;
    float3 worldPosition = mul(float4(In.Position, 1), gW).xyz;
    float3 worldNormal = mul(In.Normal, gWIT).xyz;
    if(gUseOutline == true){
        //距離に応じてアウトラインの太さ変更分岐
        float Depth = pow(distance(gVPos, In.Position) / gOutlineDistanceDegree, 2.0);
        float N = max(gThinningDegree,(dot(In.Normal.xyz, gLight0Dir) * 0.5 + 0.5));
        if(gUseOutlineDistance == true){
            worldNormal *= Depth;
        }
        //ライト方向影響分岐
        if(gUseLightDirThinning == true){
            worldNormal = worldNormal * N;
        }
        //アウトラインマスク使用分岐
        if(gUseOutlineMaskTexture == true){
            worldNormal *= gOutlineMaskTexture.SampleLevel(gWrapSampler, In.UV.xy, 0).xyz;
        }
        worldNormal *= gOutlineWidth;
        worldPosition += worldNormal;
    }
    Out.HPos = mul(float4(worldPosition, 1), gVP);
    Out.Normal = mul(In.Normal, gWIT);
    Out.UV = float2(In.UV.x, 1.0 - In.UV.y);
    Out.View = normalize(gVI[3].xyz - mul(float4(In.Position, 1), gW).xyz);
    return Out;
}

/*=================================================================*/
/*                        組み込み関数                              */
/*=================================================================*/
float smoothStep(float a, float b, float x){
    float t = saturate((x - a)/(b - a));
    return t * t * (3.0 - (2.0 * t));
}

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
/*ピクセルシェーダー（フラットカラー）  */
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
float4 PS_Toon(VS_TO_PS In) : SV_Target{
    /*####################################################*/
    /*                ノーマルマップ読み込み                */
    /*####################################################*/
    float3 normal;
    if(gUseNormalMap == true){
        normal = (gNormalMap.Sample(gWrapSampler, In.UV.xy) * 2.0 - 1.0).xyz; 
        normal = (In.Tangent.xyz * normal.x) + (In.Binormal.xyz * normal.y) + (In.Normal.xyz * normal.z);
    }else{
        normal = In.Normal.xyz;
    }
    //各法線調整法線に必要な情報取得
    float3 L = -gLight0Dir;
    float defaultDot = dot(normal, L);
    float fixDot = 1.0f;
    /*####################################################*/
    /*       法線調整　　　　　※影の中の頬の光沢の処理       */
    /*####################################################*/
    //HilightInShadowのAxisを適用したノーマル
    float3 hilightInShadowNormal;
    hilightInShadowNormal.x = normal.x * gHilightInShadowAxis.x;
    hilightInShadowNormal.y = normal.y * gHilightInShadowAxis.y;
    hilightInShadowNormal.z = normal.z * gHilightInShadowAxis.z;
    //HilightInShadowマスク読み込み
    float3 hilightInShadowMask = gHilightInShadowMask.Sample(gWrapSampler, In.UV.xy).xyz;
    //HilightInShadow処理
    if(gUseHilightInShadowMask == false){//反転不使用
        fixDot = dot(normal.xyz, L);
    }else{//反転使用
        normal = lerp(normal.xyz, hilightInShadowNormal, hilightInShadowMask.x);
        fixDot = max(dot(normal.xyz, L), defaultDot);
        fixDot = smoothStep(gHilightInShadowMin, gHilightInShadowMax, fixDot);
    }
    /*####################################################*/
    /*       法線調整　　　　　※シャドウシェーディングマップ       */
    /*####################################################*/
    if(gUseShadowInHilightMask == true){
        float3 shadowInHilightMask = gShadowInHilightMask.Sample(gWrapSampler, In.UV.xy).xyz;
        float3 shadowInHilightNormal;
        if(gUseVertexColorNormal == true){
            shadowInHilightNormal.x = In.NormalDef.x * gShadowInHilightAxis.x;
            shadowInHilightNormal.y = In.NormalDef.y * gShadowInHilightAxis.y;
            shadowInHilightNormal.z = In.NormalDef.z * gShadowInHilightAxis.z;
        }else if(gUseVertexColorNormal == false){
            shadowInHilightNormal.x = In.Normal.x * gShadowInHilightAxis.x;
            shadowInHilightNormal.y = In.Normal.y * gShadowInHilightAxis.y;
            shadowInHilightNormal.z = In.Normal.z * gShadowInHilightAxis.z;
        }        
        float shadowDot = dot(shadowInHilightNormal.xyz, L);
        float fixDot2;
        fixDot2 = lerp(fixDot, shadowDot, 1.0 - shadowInHilightMask.x);
        fixDot2 = min(fixDot2, fixDot); 
        fixDot = lerp(fixDot, fixDot2, 1.0 - shadowInHilightMask.x);
        fixDot = smoothStep(gShadowInHilightMin , gShadowInHilightMax, fixDot);
    } 
    /*##############
    /*####################################################*/
    /*        シャドウ計算      　　　　　　　　　　　　　　  */
    /*####################################################*/    
    float zInLVP = In.posInLVP.z / In.posInLVP.w;
    if(gUseShadow == true){
        float shadowShade;
        float2 shadowMapUV = In.posInLVP.xy / In.posInLVP.w;
        shadowMapUV *= float2(0.5, -0.5);
        shadowMapUV += 0.5;
        float zInLVP = In.posInLVP.z / In.posInLVP.w;
        if(shadowMapUV.x > 0.0 && shadowMapUV.x < 1.0 && shadowMapUV.y > 0.0 && shadowMapUV.y < 1.0){
            float2 shadowValue = gLight0ShadowTex.Sample(gWrapSampler, shadowMapUV).xy;
            if(zInLVP > shadowValue.r && zInLVP <= 1.0){
                float depth_sq = shadowValue.x * shadowValue.x;
                float variance = min(max(shadowValue.y - depth_sq, 0.0001), 1.0);
                float md = zInLVP - shadowValue.x;
                float lit_factor = variance / (variance + md * md);
                fixDot = lerp(fixDot * gShadowIntensity, fixDot, lit_factor);
            }
        }
    }
    /*####################################################*/
    /*        トゥーンシェーディング　　　　　　　　　　　　  */
    /*####################################################*/
    float toonShade = smoothStep(gToonThreshold - gToonFeather, gToonThreshold + gToonFeather, fixDot);  
     
    /*####################################################*/
    /*        シャドウタッチ　　　　　  　　　　　　　　　　  */
    /*####################################################*/
    float boundaryTexture;
    float halfToon;
    float boundary;
    if(gUseBoundaryTexture == true){
        boundaryTexture = gBoundaryTexture.Sample(gWrapSampler, In.UV.xy).x;
        float scrShade = gBoundaryIntensity * (2.0 * toonShade * boundaryTexture) + (1.0 - gBoundaryIntensity) * toonShade;
        toonShade = lerp((toonShade > 0.5 ? toonShade : scrShade), toonShade, toonShade);
    }

    /*####################################################*/
    /*        ベース・シャドウカラー読み込み　　　　　　　　  */
    /*####################################################*/
    //ベースとシャドウテクスチャ分岐
    float3 baseColor;
    float3 shadowColor;
    float alpha;     
    if(gUseBaseColorTexture == true){//ベーステクスチャを使用
        baseColor = pow(gBaseColorTexture.Sample(gWrapSampler, In.UV.xy), 2.2).xyz;
        alpha = gBaseColorTexture.Sample(gWrapSampler, In.UV.xy).w;
    }else{//ベーステクスチャは不使用
        baseColor = gBaseColor, 1.0;
        alpha = 1.0;
    }
    if(gUseShadowColorTexture == true){//シャドウカラーテクスチャを使用
        shadowColor = pow(gShadowColorTexture.Sample(gWrapSampler, In.UV.xy).xyz, 2.2);
    }else{//シャドウカラーテクスチャを使用しない⇒ベースカラーにカラーピッカーの色で乗算
        shadowColor = baseColor * gShadowColor;
    }

    /*####################################################*/
    /*        シェーディング結合　　　　　　　　　　　　　　  */
    /*####################################################*/
    float3 toonColor = lerp(shadowColor, baseColor, toonShade);
    /*####################################################*/
    /*                      ハイライト                     */
    /*####################################################*/
    float3 hilight;
    float3 hilightColor;
    if(gUseHilightTexture == true){
        hilight = pow(gHilightTexture.Sample(gWrapSampler, In.UV.xy), 2.2).xyz;
        hilightColor = toonColor.xyz + hilight * gHilightIntensity;
        toonColor = lerp(toonColor, hilightColor, toonShade);
    }
    /*####################################################*/
    /*               リムライト　　　　　　　　　　 　       */
    /*####################################################*/
    //リムライトカラー分岐
    float3 rimColor;
    if(gUseRimlight == true){
        if(gUseRimlightColorTexture == true){//リムライトカラーテクスチャを使う場合
            rimColor = pow(gRimlightColorTexture.Sample(gWrapSampler, In.UV.xy), 2.2).xyz;
        }else{//リムライトの色をカラーピッカーで指定する場合
            rimColor = gRimColor;
        }
        //リムライト範囲指定
        float vdn = max(0.0, dot(In.View, normal.xyz));
        float F = pow(1.0 - vdn, gRimExponent);
        float rimMask;
        if(gUseRimlightMaskTexture == true){
            rimMask = gRimlightMaskTexture.Sample(gWrapSampler, In.UV.xy).x;
            F *= rimMask;
        }
        F = smoothStep(gRimlightMin, gRimlightMax, F);
        //リムライト演算
        toonColor = lerp(toonColor, toonColor + rimColor, F);
    }
    float4 fixedColor = float4(toonColor, alpha);
    if(fixedColor.w <= 0.001){
        clip(-1);
    }
    return fixedColor;
}
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
/*ピクセルシェーダー（アウトライン）    */
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
float4 PS_Outline(VS_TO_PS In) : SV_Target{
    //トゥーン
    float3 N = In.Normal.xyz;
    float3 L = -gLight0Dir;
    float3 baseColor;
    float3 shadowColor;
    //カラーテクスチャの使用有無分岐
    if(gUseBaseColorTexture == true){
        baseColor = pow(gBaseColorTexture.Sample(gWrapSampler, In.UV.xy), 2.2).xyz;
    }else{
        baseColor = gBaseColor;
    }
    //シャドウカラーテクスチャの使用有無分岐
    if(gUseShadowColorTexture == true){
        shadowColor = pow(gShadowColorTexture.Sample(gWrapSampler, In.UV.xy), 2.2).xyz;
    }else{
        shadowColor = gShadowColor;
    }
    float toonShade = smoothStep(gToonThreshold - gToonFeather, gToonThreshold + gToonFeather, dot(N, L));
    float3 toonColor = lerp(shadowColor, baseColor, toonShade);
    //カラーテクスチャの色味を乗せるか・アウトラインカラーテクスチャの分岐
    float3 outlineColor;
    if(gUseOutlineColorTexture == false){//アウトラインカラーテクスチャ使用時
        outlineColor = pow(gOutlineColorTexture.Sample(gWrapSampler, In.UV.xy), 2.2).xyz; 
    }
    if(gUseOutlineColorTexture == false & gUseOutlineColorMix == true){//アウトラインカラーテクスチャ未使用で、テクスチャカラーブレンドONの時
        outlineColor = (gOutlineColorMixDegree * toonColor) + (1.0 - gOutlineColorMixDegree) * gOutlineColor;
    }else if(gUseOutlineColorTexture == true){//アウトラインカラー使用時
        outlineColor = pow(gOutlineColorTexture.Sample(gWrapSampler, In.UV.xy), 2.2).xyz;
    }else{
        outlineColor = gOutlineColor;
    }  
    //アルファを抜く
    float alpha = 1.0;
    if(gUseOutlineMaskTexture == true){
        alpha = gOutlineMaskTexture.Sample(gWrapSampler, In.UV.xy).x;
        if(alpha <= 0.001){
            clip(-1);
        }
    }         
    return float4(outlineColor, alpha);
}



/*=================================================================*/
/*                        テクニック                                */
/*=================================================================*/
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
/*　　　　　カリング設定               */
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
//バックカリング
RasterizerState CullBack{
    CullMode = Back;
};

//フロントカリング
RasterizerState CullFront{
    CullMode = Front;
};
//両面
RasterizerState CullNone{
    CullMode = None;
};
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
/*　　　　　アルファブレンド設定        */
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
//アルファブレンドあり
BlendState EnableBlending
{
    AlphaToCoverageEnable = FALSE;
    BlendEnable[0] = TRUE;
    SrcBlend = ONE;
    DestBlend = INV_SRC_ALPHA;
    BlendOp = ADD;
    SrcBlendAlpha = ONE;
    DestBlendAlpha = INV_SRC_ALPHA;
    BlendOpAlpha = ADD;
    RenderTargetWriteMask[0] = 0x0F;
};
//アルファブレンドなし
BlendState BlendNone
{
    AlphaToCoverageEnable = TRUE;
    BlendEnable[0] = FALSE;
};
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
/*　　　　　デプスステンシル設定       */
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
//デプスステンシルあり
DepthStencilState DepthEnabling{
    // Depth test parameters
    DepthEnable = true;//深度テストの有無
    DepthWriteMask = 1;//0:深度ステンシルバッファーへの書き込みOFF、0：ON
    DepthFunc = less_equal;//深度比較の関数
    StencilEnable = true;//ステンシルテストの有無
    StencilReadMask = 1;//深度ステンシルバッファーの読み込み指定
    StencilWriteMask = 1;//深度ステンシルバッファーの書き込み指定
};
//デプスステンシルなし
DepthStencilState DepthDisabling {
	DepthEnable = 0;
	DepthWriteMask = 0;
};

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
/*　　　　　テクニック                */
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
technique11 Opaque <
    bool OverridesDrawState = false;
    int isTransparent = 0;//0：不透明、1：透明、2：両方
    bool SupportsAdvancedTransparency = false;//true：深度ピーリング等対応、false：対応なし
>{
    pass P0 <
        string drawContext = "colorPass";
    >{
        SetDepthStencilState(DepthEnabling, 0);
        SetBlendState(EnableBlending, float4(0.0f, 0.0f, 0.0f, 0.0f), 0xFFFFFFFF);
        SetRasterizerState(CullFront); 
        SetVertexShader(CompileShader(vs_5_0, VS()));
        SetHullShader(NULL);
		SetDomainShader(NULL);
		SetGeometryShader(NULL);
        SetPixelShader(CompileShader(ps_5_0, PS_Toon()));
    } pass P1{
        SetDepthStencilState(DepthEnabling, 0);
        SetBlendState(EnableBlending, float4(0.0f, 0.0f, 0.0f, 0.0f), 0xFFFFFFFF);
        SetRasterizerState(CullBack);
        SetVertexShader(CompileShader(vs_5_0, VS_Outline()));
        SetPixelShader(CompileShader(ps_5_0, PS_Outline()));
    }
}


