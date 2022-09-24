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
//(x,y) : x = r × cos( θ ) y = r × sin( θ )
// float x = r*cos(deg)
// float y = r*sin(deg)

//r = √ ( x2 + y2 ) r= length(vecotr)
//θ = tan-1 ( y / x ) deg = atan(y/x)

void main() {
    vUv = uv;

    vec3 newPos = position;
    vec2 diff = vec2(75.,-75.) - newPos.xz;

    float r = length(diff);
    float deg = atan(diff.y,diff.x);
    float f = sin(10.*deg + time*3.);

    vR = r;
    vDeg = deg;
    vF = f;

    vec3 finalPos = newPos+vec3(0.,1.,0.)*smoothstep(0.25,0.75,f)*25.0*sinTMap(0.5,0.0,1.0);
    gl_Position = projectionMatrix * modelViewMatrix * vec4( finalPos, 1.0 );
}