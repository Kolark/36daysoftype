
uniform float time;
varying vec2 vUv;
varying float vVor;
void main() {
    vec2 newUv = vUv;
    vec3 colorA =vec3(newUv.x,newUv.y,0.35);
    vec3 colorB =vec3(newUv.y,newUv.y*newUv.x,(sin(newUv.y+newUv.x + time)+1.0)*0.5);
    gl_FragColor = vec4(mix(colorA,colorB,vVor),1.0);
}