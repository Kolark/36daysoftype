
uniform float time;
varying vec2 vUv;
varying float vRot;

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

void main() {
    vec2 newUv = vUv;
    vec3 colorA = vec3(newUv.x,newUv.y,pow(mod(1.0,newUv.x*newUv.y),sinTMap(2.5,0.25,0.75)));
    vec3 colorB = vec3(pow(mod(1.0,newUv.x*newUv.y),sinTMap(2.5,0.25,0.75)),newUv.x,newUv.y);
    gl_FragColor = vec4(mix(colorA,colorB,vRot),1.0);
}