
uniform float time;
varying vec2 vUv;
varying float vVar;
void main() {
    vec2 newUv = vUv;
    vec3 colorA = vec3(newUv.x,newUv.y*newUv.x,0.25);
    vec3 colorB = vec3((cos(time*3.5)+1.0)*0.5);
    gl_FragColor = vec4(mix(colorA,colorB,pow(vVar+(sin(time)+1.0)*0.5,0.5)),1.0);
}