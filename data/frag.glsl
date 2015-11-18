uniform float yy;
uniform sampler2D tex;

void main(){
	vec2 res = vec2(256,256);
	float t = 14;
    float a = pow(smoothstep(yy-t,yy+t,gl_FragCoord.y),0.6);
	gl_FragColor = texture2D(tex,gl_FragCoord.xy/res.xy) * vec4(1,1,1,a);
}