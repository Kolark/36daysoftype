
uniform float time;
varying vec2 vUv;
void main() {
    vec2 newUv = vUv;

    gl_FragColor = vec4(newUv.x,newUv.y,0.0,1.0);
}