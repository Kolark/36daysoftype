varying vec2 vUv;
varying float vA;
uniform float time;
#define PI 3.14159265359
mat2 rotate2d(float _angle){
    return mat2(cos(_angle),-sin(_angle),
                sin(_angle),cos(_angle));
}


void main() {
    vUv = uv;

    vec3 newPos = position;
    vec2 defaultVec = vec2(75.,-75.);
    vec2 diff = defaultVec - newPos.xz;
    float a = 1.-smoothstep(0.,100.1 - ((sin(time*1.5)*sin(time*5.5))+1.0)*0.5*100.,length(diff));
    vA = a;
    // move space from the center to the vec2(0.0)
    newPos.xz -= defaultVec;
    // rotate the space
    newPos.xz = rotate2d( cos(time*5.5)*sin(time*2.5)*max(1.0,length(diff/25.))*a ) * newPos.xz;
    // move it back to the original place
    newPos.xz += defaultVec;

    gl_Position = projectionMatrix * modelViewMatrix * vec4( newPos, 1.0 );
}