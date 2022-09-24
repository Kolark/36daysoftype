
uniform float time;
varying float vD;
varying vec2 vUv;
varying float vD2;
void main() {
    vec2 newUv = vUv;
    float f = vD*vD2;

    vec3 colorA = vec3(newUv.x,newUv.y,1. - newUv.x);
    vec3 colorB = vec3(1. - newUv.y,newUv.x ,newUv.y);
    gl_FragColor = vec4(mix(colorA,colorB,f),1.0);
}