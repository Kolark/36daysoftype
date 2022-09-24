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
varying float vB;
varying float vC;
void main() {
    vUv = uv;

    vec3 newPos = position;
// sinTMap(3.5,0.02,0.1)*sinTMap(5.5,0.5,0.75)
    float xPoint = 50.;
    float a =sin(newPos.z*0.05 + time);
    float b = (smoothstep(0.0,50. + sin(time*2.5)*30.,80. - abs(xPoint - newPos.x)));
    float c = cosTMap(1.35,0.0,1.0);

    vA = a;
    vB = b;
    vC = c;

    newPos.x += c*a*b*35.;
    gl_Position = projectionMatrix * modelViewMatrix * vec4( newPos, 1.0 );
}