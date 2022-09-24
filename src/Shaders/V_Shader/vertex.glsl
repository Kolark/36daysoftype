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
varying float vyAdd;
varying float vyAdd2;
void main() {
    vUv = uv;

    vec3 newPos = position;
    float yAdd = cos(newPos.z*0.05 + time*1.5);
    float yAdd2 = mod(newPos.z,sinTMap(5.5,1.0,50.0))/25.;
    vyAdd = yAdd;
    vyAdd2 = yAdd2;
    newPos.y += yAdd2*yAdd*12.;
    gl_Position = projectionMatrix * modelViewMatrix * vec4( newPos, 1.0 );
}