
uniform float time;
varying vec2 vUv;
void main() {
    vec2 newUv = vUv;
    vec3 color = vec3(newUv.y,(sin(time)+1.0)*0.5,0.5);
    gl_FragColor = vec4(color,1.0);
}