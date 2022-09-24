varying vec2 vUv;
uniform float time;

varying float vB;

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
    vUv = uv;

    vec3 newPos = position;
    float a = abs(newPos.z + sinTMap(2.5,-50.,250.0));
    float b = 1. - step(45.,a);
    vB = b;
    newPos.x += b*sin(newPos.z*0.05)*15.;
    gl_Position = projectionMatrix * modelViewMatrix * vec4( newPos, 1.0 );
}