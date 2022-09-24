varying vec2 vUv;
uniform float time;

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
varying float vA;
varying float vL;
void main() {
    vUv = uv;
    vec2 defVec= vec2(65.,-105.);
    vec3 newPos = position;
    vec2 diff = defVec - newPos.xz;
    float k = sinTMap(2.5,0.0,110.);
    float a = smoothstep(k-10.,k+10.,length(diff));
    vL = length(diff);
    vA = a;
    newPos.y += sin(length(diff)*0.5 + time)*a*15.;
    gl_Position = projectionMatrix * modelViewMatrix * vec4( newPos, 1.0 );
}