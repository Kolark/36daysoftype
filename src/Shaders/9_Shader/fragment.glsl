
uniform float time;
varying vec2 vUv;
varying float vA;
varying float vL;
void main() {
    vec2 newUv = vUv;
    vec3 colorA = vec3(newUv.x,newUv.y,sin(vL*0.5 - time*2.5));
    vec3 colorB = vec3(sin(vL*0.5 + time*2.5));
    gl_FragColor = vec4(mix(colorA,colorB,vA),1.0);
}