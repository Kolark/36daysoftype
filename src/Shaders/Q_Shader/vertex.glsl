varying vec2 vUv;
varying float vR;
varying float vDeg;
varying float vF;
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

void main() {
    vUv = uv;

    vec3 newPos = position;
    vec2 diff = vec2(75.,-75.) - newPos.xz;

    float r = length(diff);
    float deg = atan(diff.y,diff.x);
    float f = sin(max(sinTMap(0.5,-5.,12.5),1.0)*deg + time*3.);

    vR = r;
    vDeg = deg;
    vF = f;

    newPos.xz += normalize(diff)*f*sinTMap(1.5,-5.,15.);
    gl_Position = projectionMatrix * modelViewMatrix * vec4( newPos, 1.0 );
}