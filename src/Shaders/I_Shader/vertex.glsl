varying vec2 vUv;
uniform float time;
varying float vMix;
varying vec3 vNormal;
varying float vNoise;
float map(float value, float min1, float max1, float min2, float max2) {
  return min2 + (value - min1) * (max2 - min2) / (max1 - min1);
}

float sinT(float f){
    return sin(time*f);
}
float sinTMap(float f,float min, float max){
    return map(sin(time*f),-1.,1.,min,max);
}

float cosT(float f){
    return cos(time*f);
}
float cosTMap(float f,float min, float max){
    return map(cos(time*f),-1.,1.,min,max);
}

float hash(float n) { return fract(sin(n) * 1e4); }
float hash(vec2 p) { return fract(1e4 * sin(17.0 * p.x + p.y * 0.1) * (0.1 + abs(sin(p.y * 13.0 + p.x)))); }

float noise(float x) {
	float i = floor(x);
	float f = fract(x);
	float u = f * f * (3.0 - 2.0 * f);
	return mix(hash(i), hash(i + 1.0), u);
}


void main() {
    vUv = uv;
    vNormal = normal;
    vNoise = noise(vUv.x + time);
    vec3 newPos = position;
    //1 or sin..
    float a = cosTMap(1.5,10.,75.);
    float m = smoothstep(a-5.0,a+5.0,newPos.x);
    vMix = m;
    newPos.x *= mix(1.,sinTMap(2.5,1.0,2.0),m);
    gl_Position = projectionMatrix * modelViewMatrix * vec4( newPos, 1.0 );
}