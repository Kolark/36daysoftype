
uniform float time;
varying vec2 vUv;
varying float vYValue;
varying float vSmSt;

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
    vec2 newUv = vUv;
    vec2 diff = newUv - vec2(sin(time*5.)*0.15 +.5,cos(time*5.)*0.15 + .5);

    float a=length(diff)*sinTMap(1.5,0.05,0.25)*vYValue;
    float b=newUv.y*sinTMap(newUv.x*80.5,cos(time),1.);
    float c=cosTMap(2.5*mod(newUv.x,time),0.0,1.0);
    vec3 col = vec3(a,c*b,b);
    float w1=sinTMap(2.5,0.0,1.0)*newUv.y;
    float w2=(dot(vec2(sin(time*2.5),cos(time*2.5)),newUv)+1.0)*0.5;
    float w3=length(newUv)*newUv.x;
    vec3 w = vec3(w2,w1,w3);
    vec3 finalColor = mix(w,col,vSmSt);
    gl_FragColor = vec4(finalColor,1.0);
}