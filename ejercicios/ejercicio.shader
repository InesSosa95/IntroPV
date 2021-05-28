shader_type canvas_item;

uniform float width = 0.05;
uniform float progress: hint_range(0.1, 0.9) = 0.05;
uniform vec4 healthColour: hint_color;


float sdSegment( in vec2 p, in vec2 a, in vec2 b )
{
    vec2 pa = p-a, ba = b-a;
    float h = clamp( dot(pa,ba)/dot(ba,ba), 0.0, 1.0 );
    return length( pa - ba*h );
}


vec3 vectorLineFor(float aScale){
	return vec3(1.0 - smoothstep(width, width + 0.01, aScale));
}

void fragment() {
	float backgroundScale = sdSegment(UV, vec2(0.1, 0.5), vec2(0.9, 0.5));
	vec3 background = vectorLineFor(backgroundScale);
	
	float foregroundScale = sdSegment(UV, vec2(0.1, 0.5), vec2(progress, 0.5));
	vec3 foreground = vectorLineFor(foregroundScale);
	
	
	vec3 progressBar = mix(background, healthColour.rgb ,foreground.r);
	
	COLOR = vec4(progressBar, 1.0);
}