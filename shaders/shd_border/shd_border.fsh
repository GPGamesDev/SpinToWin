//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float pixelH;
uniform float pixelW;
uniform vec3 borderColor;
uniform vec4 u_spriteUvs;

void main()
{
    vec2 offsetx;
	offsetx.x=pixelW;
	vec2 offsety;
	offsety.y=pixelH;
	//vec3 borderColor = vec3(255.,255.,0.);
	
	vec2 normalized_uv = vec2(
        (v_vTexcoord.x - u_spriteUvs.x) / (u_spriteUvs.z - u_spriteUvs.x),
        (v_vTexcoord.y - u_spriteUvs.y) / (u_spriteUvs.w - u_spriteUvs.y)
    );
	
	float alpha = texture2D(gm_BaseTexture, v_vTexcoord).a;
	float initialAlpha = alpha;
	
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + offsetx).a);
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + offsety).a);
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - offsetx).a);
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - offsety).a);
	
	vec4 texColor = texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor = v_vColour * texColor;
	gl_FragColor.rgb = abs(initialAlpha - 1.)*(min(alpha,1.))*borderColor + initialAlpha*gl_FragColor.rgb;
	gl_FragColor.a = alpha;
	
}
