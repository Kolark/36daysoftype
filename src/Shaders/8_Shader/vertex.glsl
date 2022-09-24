varying vec2 vUv;
uniform float time;

#define PI 3.14159265359
mat2 rotate2d(float _angle){
    return mat2(cos(_angle),-sin(_angle),
                sin(_angle),cos(_angle));
}

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
varying float vM;
void main() {
    vUv = uv;
    vec2 def1 = vec2(-35.,-75.);
    float xdif = 75.;
    vec3 newPos = position;
    newPos.xz -= def1;
    float b = cos(time);
    newPos.xz *= rotate2d(-PI/6. + b*0.2);

    newPos.x -= xdif;
    float a = sin(time);
    newPos.xy *= rotate2d(newPos.z*0.05*a);

    vA = a;
    vB = b;
    newPos.x += xdif;
    newPos.xz *= rotate2d(PI/6.);
    newPos.xz += def1;
    float k = sinTMap(2.5,-225.,0.);
    float m = smoothstep(k-15.,k+15.,position.z);
    vM = m;
    vec3 finalPos = mix(newPos,position,m);
    gl_Position = projectionMatrix * modelViewMatrix * vec4( finalPos, 1.0 );
}