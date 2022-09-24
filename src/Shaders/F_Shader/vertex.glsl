varying vec2 vUv;
varying float vYValue;
varying float vSmSt;
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

    vec2 ref = newPos.xz;
    ref.x += cos(time*5.)*15.;
    ref.y += sin(time*5.)*15.;

    vec2 diff = ref - vec2(75.,-75.);


    float yValue = sin(length(diff)*0.5 + time*10.0)*5.0 - length(diff)*sin(time*10.)*0.15;
    vYValue = yValue;

    float s = smoothstep((50.+sin(time*1.75)*50.)-3.,(50.+sin(time*1.75)*50.)+3.,newPos.x);
    vSmSt = s;
    newPos.y += s*yValue;


    vec3 finalPos = newPos;

    gl_Position = projectionMatrix * modelViewMatrix * vec4( finalPos, 1.0 );
}

// void main() {
//     vUv = uv;
//     vec3 newPos = position;

//     vec2 ref = newPos.xz;
//     ref.x += cos(time*5.)*15.;
//     ref.y += sin(time*5.)*15.;

//     vec2 diff = ref - vec2(75.,-75.);
//     vec3 newPosNormalized = normalize(newPos);

//     float yValue = sin(length(diff)*0.5 + time*10.0)*5.0 - length(diff)*sin(time*10.)*0.15;

//     float v1 = mod(1.+sin(time*1.75)*1.,newPos.x)*1.5;
//     float v2 = step(50.+sin(time*1.75)*50.,newPos.x)*1.5;
//     newPos.y += smoothstep(0.,1.,mix(v1,v2,abs(newPosNormalized.z)))*yValue;


//     vec3 finalPos = newPos;

//     gl_Position = projectionMatrix * modelViewMatrix * vec4( finalPos, 1.0 );
// }