varying vec2 vUv;
varying vec3 vNormal;
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
    newPos += normal*sin(time*2.5)*2.5;
    vNormal = normal;
    float a = sinTMap(1.5,0.15,0.45);

    newPos.y += smoothstep(a,1.-a,sin(newPos.x*.05 - (sin(time*3.5)*2.))*cos(newPos.z*.05 + (cos(time*3.5)*2.)))*15.;
    gl_Position = projectionMatrix * modelViewMatrix * vec4( newPos, 1.0 );
}