varying vec2 vUv;
uniform float time;
varying float vA;
#define PI 3.14159265359
mat2 rotate2d(float _angle){
    return mat2(cos(_angle),-sin(_angle),
                sin(_angle),cos(_angle));
}

void main() {
    vUv = uv;

    vec3 newPos = position;
    vec2 defaultVec = vec2(75.,5.0);
    vec2 diff = defaultVec - newPos.xy;
    float a = smoothstep(-150.,0.0,newPos.z + sin(time)*120.)*smoothstep(0.0,25. + (sin(time)+1.0)*0.5*75.,length(diff));
    vA = a;
    // move space from the center to the vec2(0.0)
    newPos.xy -= defaultVec;
    // rotate the space
    newPos.xy = rotate2d(sin(time*2.5)*PI * a) * newPos.xy;
    // move it back to the original place
    newPos.xy += defaultVec;

    gl_Position = projectionMatrix * modelViewMatrix * vec4( newPos, 1.0 );
}