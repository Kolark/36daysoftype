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


varying float vVal;
void main() {
    vUv = uv;

    vec3 newPos = position;
    float b = sinTMap(2.5,-80.,30.);
    vec2 defaultVec = vec2(0.,-75.);
    vec2 diff = defaultVec - newPos.yz;
    // move space from the center to the vec2(0.0)
    newPos.yz -= defaultVec;
    // rotate the space
    //*sin(newPos.x*0.005 + time)
    float val = pow((sin(newPos.x*0.009 + time*2.5)+1.0)*0.5,6.0);
    vVal = val;
    newPos.yz = rotate2d(PI*0.7*val)*newPos.yz;
    // move it back to the original place
    newPos.yz += defaultVec;
    gl_Position = projectionMatrix * modelViewMatrix * vec4( newPos, 1.0 );
}