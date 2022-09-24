varying vec2 vUv;
uniform float time;
varying float vD;
varying float vD2;

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

    vec3 diff = vec3(50.,0.,-50.) - newPos;
    vec3 diff2 = vec3(65. + sin(time*1.5)*5.,0.,-75.) - newPos;
    vec3 a = vec3(sin(time),0.,cos(time));
    vec3 a2 = vec3(sin(time*2.5),0.,cos(-time*2.5));

    float d = dot(normalize(diff),normalize(a));
    float d2 = dot(normalize(diff2),normalize(a2));
    vD = d;
    vD2 = d2;

    float b = sinTMap(2.5,0.0,1.0);
    newPos.y += smoothstep(0.499 - b ,0.5 + b,d*d2)*15.;

    vec3 finalPos = newPos;
    gl_Position = projectionMatrix * modelViewMatrix * vec4( finalPos, 1.0 );
}