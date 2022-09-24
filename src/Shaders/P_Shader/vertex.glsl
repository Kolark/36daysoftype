varying vec2 vUv;
varying float vValue;

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

    float scale = 0.05;
    float v1 = sinTMap(2.5,0.15,2.5);
    float value = smoothstep(0.0,1.0,cos((newPos.x*scale*v1 + sin(time)*15.))*sin(newPos.z*scale*v1 + cos(time)*15.));
    vValue = value;
    newPos.y += round(value)*15.;
    gl_Position = projectionMatrix * modelViewMatrix * vec4( newPos, 1.0 );
}